/*
create TABLE sales(custormername VARCHAR (50), Amount INT, TranDate datetime);
insert into sales values('Person A', 20000, '2019-01-31 11:30'),
						('Person A', 40000, '2019-01-31 12:00'),
                        ('Person A', 30000, '2019-01-31 13:22'),
                        ('Person A', 15000, '2019-01-31 13:51'),
                        ('Person B', 10000, '2019-01-31 15:30'),
                        ('Person B', 5000, '2019-01-31 16:00'),
                        ('Person B', 15000, '2019-01-31 16:22'),
                        ('Person B', 2000, '2019-01-31 17:51');
select * from sales;
*/

-- QUESTION --
-- My organisation has two policies:
-- 1. Customers can only perform 3 transactions per day
-- 2. Customers can only spend a cumulative amount of 50,000 per day

-- TASK --
-- Generate list of transaction records which do not comply with either of 
-- these new policies 

WITH Transactions AS(
		     SELECT custormername, amount, trandate, 
			    ROW_NUMBER() OVER(PARTITION BY custormername order by trandate) as outer_rank,
			    SUM(amount) OVER (PARTITION BY custormername  ORDER BY Inner_rank) as spent
		     FROM 
                    -- created inner query to generate row numbers(inner_rank) which was used to create cumulative sum in my outer query
			    (SELECT *, ROW_NUMBER() over(partition by custormername order by trandate) Inner_rank
			    FROM sales) as inner_table 
		    )
SELECT custormername, 
       trandate, 
        Amount, 
        spent
FROM Transactions
WHERE outer_rank > 3 OR spent > 50000;
