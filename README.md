# Superstore Insights - SQL, Python & Tableau

### Created by Patrycja Decowska
## Data source 
https://www.kaggle.com/datasets/bravehart101/sample-supermarket-dataset/data

## Main Goal 
The goal of this project is to use data analysis and visualisation to better understand business performance and support data-driven decisions.

## Files in this project
- `superstore_dataset` - original dataset downloaded from Kaggle
- `superstore_clean` - unnormalised database created in SQL
- `superstore_normalised_db` - normalised relational database created in SQL
-`ERD` - schema ERD Diagram showing the database structure
- `SQL_queries` - SQL queries used for business analysis
- `Data_Exploration` - Python analysis
- `Tableau_visualisation` - interactive dashboard showing regional business performance
- `License` - MIT License

## Tools
- SQL
- Python
- Tableau

## SQL

**Description**

The cleaned data was transformed into a normalised relational database to reduce data redundancy and improve data integrity.
I used SQL to analyse sales, profit, customers, shipping methods and regional performance.

**Main Findings**

The Phone sub-category was the highest sales.There  were three not profitable sub-categories - Tables, Bookcases and Supplies.  Consumer customer segment was  the most profitable. The average loss on unprofitable orders was: Technology -142.3613690, Furniture -85.4475077, Office Supplies -63.9650237. However, all three main categories had positive total profit. Texas had the lowest total profit. Standard Class was the most popular shipping method, with the highest number of shipments. The Central region generated the highest profit. NYC had the highest sales from all of the cities in the dataset.

**SQL clauses used in the code** 
- `SELECT`
- `COUNT`, `SUM`, `AVG`
- `JOIN`
- `GROUP BY`
- `HAVING`
- `ORDER BY`
- `WHERE`
- `LIMIT`
- `ROW_NUMBER()`, `PARTITION BY`

**SQL Skills**
- Creating normlised database
- Preparing data for further analysis and visualisation
- Joining multiple tables
- Aggregating data
- Filtering aggregated results
- Using window functions (ROW_NUMBER(), PARTITION BY, ORDER BY)

## Python

**Description**

I loaded the dataset into Python and explored basic information, structure and statistics. Then I created a correlation matrix to examine the relationships between the five numerical variables in the dataset.

**Main Findings**

The strongest relationship in the correlation matrix was between discount and profit margin, with a correlation coefficient of -0.86. High discounts are related to lower profit margins.   Higher sales are associated with higher profit, although this is not always the case. Higher discounts can reduce the company's profit.

**Tool**
- Jupyter Notebook

**Python Skills**
- Loading and handling data
- Cleaning data and performing basic checks
- Creating a correlation matrix, a heatmap

## Tableau Visualization

**Description**

I exported data from SQL and  used Tableau for further visualisation. I created an interactive Tableau dashboard to better understand business performance. The dashboard helps to compare sales performance across regions and states and by shipping mode.  It also allows users to analyse profit across different product categories and sub-categories.

**Tableau Skills**
- Creating bar charts
- Building a map to visualise business data
- Adding interactive filters - charts and KPI cards update automatically when  a region is selected
- Creating KPI cards for Total Sales, Total Profit, Profit Margin and Average Discount

## Business Analysis
 The company should investigate the reasons behind the losses in the Tables, Bookcases and Supplies sub-categories. The company should also review its discount strategy.
