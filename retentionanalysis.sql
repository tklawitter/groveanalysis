SELECT order_number, 
       Count(*)                    AS TOTAL_ORDERS, 
       Avg(Substr(order_value, 2)) AS AVG_VALUE, 
       Sum(Substr(order_value, 2)) AS TOTAL_VALUE 
FROM   orders 
GROUP BY order_number; 
