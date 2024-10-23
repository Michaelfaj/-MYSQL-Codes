use credit_collection;
select * from payments;
select * from loans;
  
SET SESSION MAX_EXECUTION_TIME = 10000;
  
-- Common Table Expression (CTE) to generate a series of dates starting from the disbursement date of the loan up to the last repayment date for each loan
WITH RECURSIVE DateSeries AS (
  SELECT 0 AS n -- Base case: starts the series at 0
  UNION ALL
  SELECT n + 1 FROM DateSeries WHERE n < 59 -- Recursive case: increments the number by 1 until 59 is reached (60 days)
),

-- CTE to retrieve loan disbursement information
Disbursed AS (
  SELECT user_id, loan_id, disbursement_date, total_amount_disbursed
  FROM LOANS
),

-- CTE to calculate total repayments for each loan
Repayments AS (
  SELECT loan_id, SUM(amount) AS total_repaid
  FROM PAYMENTS
  WHERE type = 'repayment'
  GROUP BY loan_id
),

-- CTE to find the last repayment date for each loan
LastRepaymentDates AS (
  SELECT loan_id, MAX(payment_timestamp) AS last_repayment_date
  FROM PAYMENTS
  WHERE type = 'repayment'
  GROUP BY loan_id
),

-- CTE to generate daily balances for each loan up to the last repayment date
DailyBalance AS (
  SELECT
    d.user_id,
    d.loan_id,
    d.disbursement_date + INTERVAL ds.n DAY AS date, -- Calculate the date for each day in the series
    d.total_amount_disbursed,
    COALESCE(r.total_repaid, 0) AS total_repaid -- Total repaid amount for the loan; if no repayments, default to 0
  FROM Disbursed d
  CROSS JOIN DateSeries ds -- Cross join with the generated series to create the date range
  LEFT JOIN Repayments r ON d.loan_id = r.loan_id -- Left join to get repayment amounts, if any
  JOIN LastRepaymentDates lrd ON d.loan_id = lrd.loan_id -- Join to find the last repayment date for each loan
  WHERE d.disbursement_date + INTERVAL ds.n DAY <= DATE_ADD(lrd.last_repayment_date, INTERVAL 1 DAY) -- Filter to ensure the date does not exceed the last repayment date
),

-- CTE to calculate outstanding balance and latest repayment date for each loan on each day
BalancesAndRepayments AS (
  SELECT
    db.date,
    db.user_id,
    db.loan_id,
    db.total_amount_disbursed,
    -- Calculate total outstanding balance by subtracting total repaid amount from total disbursed amount
    db.total_amount_disbursed - (
      SELECT COALESCE(SUM(amount), 0) FROM PAYMENTS
      WHERE loan_id = db.loan_id AND type = 'repayment' AND payment_timestamp <= db.date
    ) AS total_outstanding_amount,
    -- Find the latest repayment date up to the current date
    (
      SELECT MAX(payment_timestamp) FROM PAYMENTS
      WHERE loan_id = db.loan_id AND payment_timestamp <= db.date
    ) AS latest_repayment_date
  FROM DailyBalance db
)

-- Final SELECT statement to present the data
SELECT 
  b.date,
  b.user_id,
  b.loan_id,
  b.total_amount_disbursed,
  -- Use the disbursed amount if no repayments made yet
  IFNULL(b.total_outstanding_amount, b.total_amount_disbursed) AS total_outstanding_amount,
  b.latest_repayment_date
FROM BalancesAndRepayments b
ORDER BY b.user_id, b.loan_id, b.date; -- Orders the results by user, loan, and date for readability








