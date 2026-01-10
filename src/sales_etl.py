import logging
from pathlib import Path

import numpy as np
import pandas as pd

# -----------------------------------
# Logging Configuration
# -----------------------------------
logging.basicConfig(
    level=logging.INFO, format="%(asctime)s | %(levelname)s | %(message)s"
)

logger = logging.getLogger(__name__)


# -----------------------------------
# File Paths
# -----------------------------------
RAW_DATA_PATH = Path("data/raw/superstore_sales_clean.csv")
PROCESSED_DATA_PATH = Path("data/processed/fact_sales_clean.csv")


# -----------------------------------
# Load Data
# -----------------------------------
def load_raw_data(path: Path) -> pd.DataFrame:
    logger.info(f"Loading raw data from {path}")
    df = pd.read_csv(path)
    logger.info(f"Loaded {len(df):,} rows")
    return df


# -----------------------------------
# Data Cleaning
# -----------------------------------
def clean_data(df: pd.DataFrame) -> pd.DataFrame:
    logger.info("Cleaning data")

    # Convert date columns
    df["order_date"] = pd.to_datetime(df["order_date"], format="mixed", dayfirst=True)
    df["ship_date"] = pd.to_datetime(df["ship_date"], format="mixed", dayfirst=True)

    # Ensure year is integer
    df["year"] = df["year"].astype(int)

    # Remove duplicates
    initial_rows = len(df)
    df = df.drop_duplicates()
    logger.info(f"Removed {initial_rows - len(df):,} duplicate rows")

    # Convert numeric columns
    numeric_cols = ["sales", "discount", "profit", "shipping_cost"]
    df[numeric_cols] = df[numeric_cols].apply(pd.to_numeric, errors="coerce")

    # Convert quantity
    df["quantity"] = pd.to_numeric(df["quantity"], errors="coerce").astype("Int64")

    # Drop invalid financial rows
    df = df.dropna(subset=["sales", "profit", "quantity"])

    logger.info(f"Data cleaned — {len(df):,} valid rows remain")
    return df


# -----------------------------------
# Feature Engineering
# -----------------------------------
def create_metrics(df: pd.DataFrame) -> pd.DataFrame:
    logger.info("Creating business metrics")

    # Shipping days
    df["shipping_days"] = (df["ship_date"] - df["order_date"]).dt.days

    # Profit margin
    df["profit_margin"] = np.where(df["sales"] != 0, df["profit"] / df["sales"], 0)

    # Discount bands
    df["discount_band"] = pd.cut(
        df["discount"],
        bins=[-0.01, 0, 0.2, 0.4, 1],
        labels=["No Discount", "Low (≤20%)", "Medium (20–40%)", "High (>40%)"],
    )

    return df


# -----------------------------------
# Save Processed Data
# -----------------------------------
def save_processed_data(df: pd.DataFrame, path: Path) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    df.to_csv(path, index=False)
    logger.info(f"Processed data written to {path}")


# -----------------------------------
# Full ETL Pipeline
# -----------------------------------
def run_etl():
    logger.info("Starting Sales Fact ETL Pipeline")

    df = load_raw_data(RAW_DATA_PATH)
    df = clean_data(df)
    df = create_metrics(df)
    save_processed_data(df, PROCESSED_DATA_PATH)

    logger.info("ETL Pipeline completed successfully")


# -----------------------------------
# CLI Execution
# -----------------------------------
if __name__ == "__main__":
    run_etl()