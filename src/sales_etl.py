import logging
from pathlib import Path

import numpy as np
import pandas as pd
from sqlalchemy import create_engine

# ---------------- Logging ----------------
logging.basicConfig(
    level=logging.INFO, format="%(asctime)s | %(levelname)s | %(message)s"
)
logger = logging.getLogger(__name__)

# ---------------- Config ----------------
RAW_DATA_PATH = Path("data/raw/superstore_sales_clean.csv")

# Change to your Postgres credentials
POSTGRES_URI = "postgresql+psycopg2://postgres:admin@localhost:5432/retail_sales_bi"
TABLE_NAME = "fact_sales"


# ---------------- Functions ----------------
def load_raw_data(path: Path) -> pd.DataFrame:
    logger.info(f"Loading raw data from {path}")
    df = pd.read_csv(path)
    logger.info(f"Loaded {len(df):,} rows")
    return df


def clean_data(df: pd.DataFrame) -> pd.DataFrame:
    logger.info("Cleaning data")
    df["order_date"] = pd.to_datetime(df["order_date"], format="mixed", dayfirst=True)
    df["ship_date"] = pd.to_datetime(df["ship_date"], format="mixed", dayfirst=True)
    df["year"] = df["year"].astype(int)
    df = df.drop_duplicates()
    df["quantity"] = df["quantity"].astype(int)
    numeric_cols = ["sales", "discount", "profit", "shipping_cost"]
    df[numeric_cols] = df[numeric_cols].apply(pd.to_numeric, errors="coerce")
    df["quantity"] = pd.to_numeric(df["quantity"], errors="coerce").astype("Int64")
    df = df.dropna(subset=["sales", "profit", "quantity"])
    logger.info(f"Data cleaned — {len(df):,} valid rows remain")
    return df


def create_metrics(df: pd.DataFrame) -> pd.DataFrame:
    logger.info("Creating business metrics")
    df["shipping_days"] = (df["ship_date"] - df["order_date"]).dt.days
    df["profit_margin"] = np.where(df["sales"] != 0, df["profit"] / df["sales"], 0)
    df["discount_band"] = pd.cut(
        df["discount"],
        bins=[-0.01, 0, 0.2, 0.4, 1],
        labels=["No Discount", "Low (≤20%)", "Medium (20–40%)", "High (>40%)"],
    )
    return df


def load_to_postgres(df: pd.DataFrame, table_name: str, uri: str):
    logger.info(f"Connecting to Postgres at {uri}")
    engine = create_engine(uri)
    logger.info(f"Loading {len(df):,} rows into Postgres table '{table_name}'")
    with engine.begin() as conn:  # ensures commit
        df.to_sql(table_name, conn, if_exists="replace", index=False)
    logger.info("Data loaded successfully!")


# ---------------- Main ETL ----------------
def run_etl():
    logger.info("Starting full ETL pipeline")
    df = load_raw_data(RAW_DATA_PATH)
    df = clean_data(df)
    df = create_metrics(df)
    load_to_postgres(df, TABLE_NAME, POSTGRES_URI)
    logger.info("ETL pipeline completed successfully")


# ---------------- CLI ----------------
if __name__ == "__main__":
    run_etl()
