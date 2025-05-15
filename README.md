# Stock Market Analysis with MySQL and Power BI

This project demonstrates how to analyze stock market performance using MySQL for data storage, Python for data extraction and transformation, and Power BI for visualization. It focuses on fetching historical stock data from Yahoo Finance, storing it in a MySQL database, and running SQL queries to perform data analysis. The final analysis is visualized in Power BI for better insights.

## Project Structure

1. **Database Setup**

   * A MySQL database named `StockMarket` is created to store historical data of selected tickers from different sectors.
   * A table named `Stocks` is created with columns for `id`, `ticker`, `sector`, `date`, and `close_price`.

2. **Data Extraction and Insertion**

   * Historical stock data is fetched using `yfinance` and loaded into a Pandas DataFrame.
   * The data is reshaped for easy SQL storage and mapped with sector information.
   * Data is inserted into the `Stocks` table using SQLAlchemy.

3. **Data Cleaning and Deduplication**

   * SQL queries are used to identify and remove duplicate entries from the `Stocks` table.
   * Common Table Expressions (CTE) and `ROW_NUMBER()` are utilized for efficient deduplication.

4. **Virtual Table for Daily Returns**

   * A SQL view named `DailyReturns` is created to calculate the **daily return** for each ticker using the `LAG` function.
   * This view enables quick access to performance metrics without recalculating each time.

5. **Data Analysis and Reporting**

   * SQL queries are used to analyze average returns per sector and identify top-performing sectors and tickers.
   * Insights are drawn to highlight Technology as the top-performing sector, while Energy showed volatility.

6. **Power BI Visualization**

   * Data is imported into Power BI to create visual representations:

     * **Top Performance by Sector and Ticker** - Bar chart showing average returns by sector.
     * **Sum of Daily Return by Year and Ticker** - Line chart tracking annual progression of daily returns.
     * **Sum of Close Price by Sector** - Bar chart representing total closing prices grouped by sector.

## Key Insights

* Technology consistently outperforms other sectors in both average returns and total market valuation.
* Energy is notably volatile, reflecting high risk in market movements.
* Financials and Materials are stable but less impactful compared to Technology.

## Technologies Used

* **MySQL** – Database storage and querying
* **Python (yfinance, SQLAlchemy, Pandas)** – Data fetching and transformation
* **Power BI** – Data visualization and trend analysis

## Future Improvements

* Add more tickers and sectors for broader market analysis
* Automate daily data updates
* Integrate Power BI dashboards for real-time visualization

This project serves as a robust template for analyzing stock performance, comparing sector growth, and visualizing market trends effectively.
