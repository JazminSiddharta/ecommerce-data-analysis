# Brazilian E-Commerce Analysis

End-to-end data analysis project using the [Olist Brazilian E-Commerce dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) from Kaggle. 

Olist is a Brazilian marketplace platform that connects small businesses to larger sales channels. The dataset contains around 100K orders placed between 2016 and 2018, making it a solid foundation for exploring real e-commerce business metrics.

The project covers data exploration, cleaning, SQL querying, and business dashboards built in both Tableau and Power BI.

> Analysis and documentation written in English for international audiences.

---

## Dashboards

**Tableau** — [View Live Dashboard](https://public.tableau.com/views/ecommerce_dashboard_17758641619750/Dashboard1?:language=es-ES&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

**Power BI** — available in `/dashboards/ecommerce_dashboard.pbix`

---

## Key Metrics

| Metric | Value |
|---|---|
| Total Revenue | $15,404,680 |
| Avg Order Value | $159.79 |
| Total Orders | 96,406 |
| Avg Delivery Time | 12 days |

> Both dashboards filter to delivered orders only to ensure consistency across tools.

---

## Key Findings

- Tuesday is the busiest day for orders, while weekends show a noticeable drop
- Around 80% of deliveries are completed within 20 days of purchase
- Revenue grew consistently from late 2016 through mid-2018, with a sharp peak in November 2017 — likely driven by Black Friday
- A small number of orders (around 70) had delivery times over 100 days and were treated as outliers

---

## Project Structure

```
ecommerce-data-analysis/
│
├── data/
│   ├── raw/                  # Original Kaggle CSV files
│   └── processed/            # Cleaned & transformed data
│       └── fact_orders.csv
│
├── dashboards/
│   ├── ecommerce_dashboard.twbx    # Tableau dashboard
│   └── ecommerce_dashboard.pbix    # Power BI dashboard
│
├── notebooks/
│   └── 01_exploration.ipynb  # Data exploration & cleaning
│
├── sql/
│   ├── kpi_avg_ticket.sql
│   ├── kpi_delivery_distribution.sql
│   ├── kpi_orders_by_day.sql
│   ├── kpi_orders_per_month.sql
│   ├── kpi_orders_with_revenue.sql
│   ├── kpi_revenue_per_month.sql
│   └── kpi_total_revenue.sql
│
├── .env                      # Local environment variables (not tracked)
├── .gitignore
├── requirements.txt
└── README.md
```

---

## Tech Stack

| Tool | Purpose |
|---|---|
| Python (pandas) | Data exploration & cleaning |
| PostgreSQL | Data storage & SQL queries |
| SQLAlchemy | Python-PostgreSQL connection |
| psycopg2 | PostgreSQL database adapter for Python |
| python-dotenv | Secure management of environment variables |
| Tableau Public | Interactive dashboard |
| Power BI Desktop | Interactive dashboard |

---

## Dataset

**Source:** [Olist Brazilian E-Commerce](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) on Kaggle

Tables used:
- `olist_orders_dataset.csv` — order status and timestamps
- `olist_order_items_dataset.csv` — products and prices per order
- `olist_order_payments_dataset.csv` — payment details per order

---

## Data Cleaning

Key decisions made during exploration:

- Filtered to delivered orders only (97% of the dataset) — cancelled, invoiced, and other statuses were excluded since they don't represent completed transactions
- Calculated `delivery_time_days` from purchase timestamp to actual delivery date
- Removed delivery time outliers — orders taking more than 100 days (~70 records) were excluded as they represent edge cases that would skew the distribution
- Used `payment_value` as the revenue source rather than `order_items.price` — payment value captures what the customer actually paid including freight and fees, making it a more accurate representation of business revenue

### Note on order count discrepancy
Tableau shows **96,406 orders** while Power BI shows **96,407**. This is due to a minor difference in how each tool processes the cleaned dataset: Tableau reads from the exported CSV after outlier removal, while Power BI connects directly to PostgreSQL. The difference of 1 record has no material impact on any of the reported metrics.

---

## Setup

### 1. Clone the repository
```bash
git clone https://github.com/JazminSiddharta/ecommerce-data-analysis.git
cd ecommerce-data-analysis
```

### 2. Install dependencies
```bash
pip install -r requirements.txt
```

### 3. Configure environment variables
Create a `.env` file in the root folder:
```
DB_HOST=localhost
DB_NAME=ecommerce_db
DB_USER=postgres
DB_PASSWORD=your_password
```

### 4. Download the dataset
Download from [Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) and place the CSV files in `data/raw/`.

### 5. Run the notebook
Open and run `notebooks/01_exploration.ipynb` to clean the data and load it into PostgreSQL.

---

*Project completed April 2026*

---

## Contact

Feel free to connect on [LinkedIn](https://www.linkedin.com/in/jazmin-siddharta-p%C3%A9rez-montero-597791336/) or reach out via [GitHub](https://github.com/JazminSiddharta).
