A window function performs a calculation across a set of table rows that are somehow related to the current row.

`SELECT depname, empno, salary, avg(salary) OVER (PARTITION BY depname) FROM empsalary;`

```
   depname  | empno | salary |          avg          
-----------+-------+--------+-----------------------
 develop   |    11 |   5200 | 5020.0000000000000000``
 develop   |     7 |   4200 | 5020.0000000000000000
 develop   |     9 |   4500 | 5020.0000000000000000
 develop   |     8 |   6000 | 5020.0000000000000000
 develop   |    10 |   5200 | 5020.0000000000000000
 personnel |     5 |   3500 | 3700.0000000000000000
 personnel |     2 |   3900 | 3700.0000000000000000
 sales     |     3 |   4800 | 4866.6666666666666667
 sales     |     1 |   5000 | 4866.6666666666666667
 sales     |     4 |   4800 | 4866.6666666666666667
 ```

The OVER clause determines exactly how the rows of the query are split up for processing by the window function. 

The PARTITION BY list within OVER specifies dividing the rows into groups, or partitions, that share the same values of the PARTITION BY expression(s).

For each row, the window function is computed across the rows that fall into the same partition as the current row. You
can also control the order in which rows are processed by window functions using ORDER BY within OVER.

### ROW_NUMBER:
The ROW_NUMBER() is a window function that assigns a sequential integer number to each row in the query’s result set.
```
ROW_NUMBER() OVER (
    [PARTITION BY expr1, expr2,...]
    ORDER BY expr1 [ASC | DESC], expr2,...
)
```

ROW_NUMBER() function to add sequential integer number to each row.

```
SELECT
    ROW_NUMBER() OVER (
            ORDER BY salary
    ) row_num,
    first_name,
    last_name,
    salary
FROM
    employees
```

| row\_num | first\_name | last\_name | salary |
| :--- | :--- | :--- | :--- |
| 1 | Karen | Colmenares | 2500.00 |
| 2 | Guy | Himuro | 2600.00 |
| 3 | Irene | Mikkilineni | 2700.00 |
| 4 | Sigal | Tobias | 2800.00 |
| 5 | Shelli | Baida | 2900.00 |
| 6 | Alexander | Khoo | 3100.00 |
| 7 | Britney | Everett | 3900.00 |
| 8 | Sarah | Bell | 4000.00 |
| 9 | Diana | Lorentz | 4200.00 |
| 10 | Jennifer | Whalen | 4400.00 |


