# Grove Collaborative Analysis Exercise

## Retention Analysis

SQL: 

```
SELECT order_number, 
       Count(*)                    AS TOTAL_ORDERS, 
       Avg(Substr(order_value, 2)) AS AVG_VALUE, 
       Sum(Substr(order_value, 2)) AS TOTAL_VALUE 
FROM   orders 
GROUP  BY order_number; 
```

Results:

| Order Number | Total Orders | Average Order Value | Total Order Value |
|--------------|--------------|---------------------|-------------------|
| 1            | 33854        | $33.29              | $1,126,979.36     |
| 2            | 21863        | $34.34              | $750,811.56       |
| 3            | 13663        | $45.36              | $619,792.59       |
| 4            | 8203         | $42.26              | $346,659.27       |
| 5            | 4416         | $47.68              | $210,574.48       |
| 6            | 965          | $43.30              | $41,782.25        |
| 7            | 231          | $46.05              | $10,638.70        |
| 8            | 74           | $45.72              | $3,383.06         |
| 9            | 35           | $51.70              | $1,809.39         |
| 10           | 21           | $51.01              | $1,071.27         |
| 11           | 10           | $39.73              | $397.25           |
| 12           | 6            | $118.99             | $713.94           |
| 13           | 3            | $7.23               | $21.69            |
| 14           | 3            | $28.97              | $86.92            |
| 15           | 2            | $9.46               | $18.92            |
| 16           | 2            | $7.22               | $14.43            |

| Bucket   | Retention |
|----------|-----------|
| 1 to 2   | 64.58%    |
| 2 to 3   | 62.49%    |
| 3 to 4   | 60.04%    |
| 4 to 5   | 53.83%    |
| 5 to 6   | 21.85%    |
| 6 to 7   | 23.94%    |
| 7 to 8   | 32.03%    |
| 8 to 9   | 47.30%    |
| 9 to 10  | 60.00%    |
| 10 to 11 | 47.62%    |
| 11 to 12 | 60.00%    |
| 12 to 13 | 50.00%    |
| 13 to 14 | 100.00%   |
| 14 to 15 | 66.67%    |
| 15 to 16 | 100.00%   |

The biggest drop-off in the retention curve is in the 5 to 6 bucket, where it drops to 21.85%.

## Revenue Impact

The bigger lever for revenue impact is an increase in 3+ order retention of 500 basis points.

Scenario 1: an increase in 3+ order retention of 500 basis points	

| Order Number | Additional Orders | New Total Orders | Average Order Value      | New Revenue |
|--------------|-------------------|------------------|--------------------------|-------------|
| 1            | 0                 | 0                | $33.29                   | $0.00       |
| 2            | 0                 | 0                | $34.34                   | $0.00       |
| 3            | 1093              | 14756            | $45.36                   | $49,588.40  |
| 4            | 738               | 8941             | $42.26                   | $31,179.79  |
| 5            | 447               | 4863             | $47.68                   | $21,316.87  |
| 6            | 243               | 1208             | $43.30                   | $10,527.92  |
| 7            | 60                | 291              | $46.05                   | $2,782.07   |
| 8            | 15                | 89               | $45.72                   | $666.11     |
| 9            | 4                 | 39               | $51.70                   | $228.94     |
| 10           | 2                 | 23               | $51.01                   | $100.57     |
| 11           | 1                 | 11               | $39.73                   | $45.63      |
| 12           | 1                 | 7                | $118.99                  | $66.33      |
| 13           | 0                 | 3                | $7.23                    | $2.37       |
| 14           | 0                 | 3                | $28.97                   | $4.82       |
| 15           | 0                 | 2                | $9.46                    | $1.50       |
| 16           | 0                 | 2                | $7.22                    | $0.78       |
|              |                   |                  |                          |             |
|              |                   |                  | Total Additional Revenue | $116,512.09 |

Scenario 2: an increase in 3+ order average order value of $3	

| Order Number | Total Orders | Increase In Order Value  | New Revenue |
|--------------|--------------|--------------------------|-------------|
| 1            | 33854        | $0.00                    | $0.00       |
| 2            | 21863        | $0.00                    | $0.00       |
| 3            | 13663        | $3.00                    | $40,989.00  |
| 4            | 8203         | $3.00                    | $24,609.00  |
| 5            | 4416         | $3.00                    | $13,248.00  |
| 6            | 965          | $3.00                    | $2,895.00   |
| 7            | 231          | $3.00                    | $693.00     |
| 8            | 74           | $3.00                    | $222.00     |
| 9            | 35           | $3.00                    | $105.00     |
| 10           | 21           | $3.00                    | $63.00      |
| 11           | 10           | $3.00                    | $30.00      |
| 12           | 6            | $3.00                    | $18.00      |
| 13           | 3            | $3.00                    | $9.00       |
| 14           | 3            | $3.00                    | $9.00       |
| 15           | 2            | $3.00                    | $6.00       |
| 16           | 2            | $3.00                    | $6.00       |
|              |              |                          |             |
|              |              | Total Additional Revenue | $82,902.00  |

## Additional Datasets

Additional datasets that would be good to glean further insights would be: 
1. order detail table, with details such as each individual item ordered, item category, and item price. 
2. customer detail table, with customer information details such as customer delivery location.

Order detail table could be used to identify item popularity, item category popularity, pricing bucket popularity.

Examples of insights: 
* Grove Collaborative European Dish Cloth is the most popular item of 2018, based on number of times the item was ordered. 
* Grove collaborative product line items were more popular than other home essential brands across all orders in Q4 2018. 
* Items that fall into the $9.99 to $14.99 range were the most frequently ordered, compared to all other pricing buckets, across all time. 

Customer detail table could be used to identify location based trends, especially when combined with order detail.

Examples of insights: 
* Hand soaps are more popular in California than in any other state, based on the number of hand soaps ordered by state as a percentage of total items ordered.
