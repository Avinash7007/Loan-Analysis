SELECT * FROM mydb.financial_loan;

# Total_loan_application 
select count(id) as Total_loan_application from financial_loan; 

# MTD - Month to date - 
select count(id) as MTD_loan_application from financial_loan
where month(issue_date) = 12 AND year(issue_date) = 2021;

# PMTD - Previous month to date 
select count(id) as PMTD_loan_application from financial_loan
where month(issue_date) = 11 AND year(issue_date) = 2021;


# Total_funded amount
Select sum(loan_amount) as Total_funded_amount
from financial_loan;

# MTD_total_funded_amount
Select sum(loan_amount)  as MTD_total_funded_amount
from financial_loan
WHERE month(issue_date) = 12 AND Year(issue_date) = 2021;

# PMTD_total_funded_amount
select sum(loan_amount) as PMTD_total_funded_amount
From financial_loan
where month(issue_date) = 11 AND Year(issue_date) = 2021;

# Total_Amount_Recieved

Select sum(total_payment) as Total_Amount_Recieved 
from financial_loan; 

# MTD_Total_Amount_Recieved
Select sum(total_payment) as MTD_Total_Amount_Recieved
FROM financial_loan
WHERE month(issue_date) = 12 AND year(issue_date) = 2021;


# PMTD_Total_Amount_Recieved
Select sum(total_payment) as PMTD_Total_Amount_Recieved
FROM financial_loan
WHERE month(issue_date) = 11 AND year(issue_date) = 2021;


# Total_intrest 
SELECT 
      sum(total_payment-loan_amount) as total_intrest
from 
	financial_loan;
    
# AVG_int_rate
USE MYDB;
Select 
       round(avg(int_rate)*100,2) as AVG_int_rate
from financial_loan;

# MTD_AVG_int_rate

Select 
       round(avg(int_rate)*100,2) as MTD_AVG_int_rate
from financial_loan
WHERE month(issue_date) = 12 AND Year(issue_date)=2021;

# PMTD_AVG_int_rate
Select 
       round(avg(int_rate)*100,2) as PMTD_AVG_int_rate
from financial_loan
WHERE month(issue_date) = 11 AND Year(issue_date)=2021;

# Avg DTI 
 Select 
       round(avg(dti)*100,2) as PMTD_AVG_dti
from financial_loan;

# PMTD_AVG_dti
Select 
       round(avg(dti)*100,2) as PMTD_AVG_dti
from financial_loan
WHERE month(issue_date) = 12 AND Year(issue_date)=2021;


# PMTD_AVG_int_rate
Select 
       round(avg(dti)*100,2) as PMTD_AVG_int_rate
from financial_loan
WHERE month(issue_date) = 11 AND Year(issue_date)=2021;


# GOOD_LOAN_ISSUED
# Good_Loan_Percentage

select 
        round(
       count(case 
                  WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' then id
		      end)*100 / count(id),2) as good_loan_per
	from financial_loan;

# Good_Loan_Applications
select count(id) as Good_Loan_Applications from financial_loan
where loan_status = 'Fully Paid' OR loan_status = 'Current'; 

# Good_Loan_Funded_Amount
select sum(loan_amount) as Good_Loan_Funded_Amount from financial_loan
where loan_status = 'Fully Paid' OR loan_status = 'Current';

# Good_Loan_Amount_Received 
select sum(total_payment) as Good_Loan_Amount_Received  from financial_loan
where loan_status = 'Fully Paid' OR loan_status = 'Current';


                                       # BAD LOAN ISSUED
# Bad_loan_per
Select 
     round(
     count(case
           when loan_status = 'Charged Off' then id  
     end)*100 / count(id),2) as Bad_loan_per
from financial_loan;

# Bad Loan Applications
SELECT COUNT(id) AS Bad_Loan_Applications FROM financial_loan
WHERE loan_status = 'Charged Off';
 
# Bad Loan Funded Amount
SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount FROM financial_loan
WHERE loan_status = 'Charged Off';
 
# Bad Loan Amount Received
SELECT SUM(total_payment) AS Bad_Loan_amount_received FROM financial_loan
WHERE loan_status = 'Charged Off';

# LOAN STATUS
SELECT 
      loan_status , 
      count(id) as total_loan_application,
      sum(total_payment) as total_amount_recieved,
      sum(loan_amount) as total_loan_amount,
      round(avg(int_rate)*100,2) as avg_int_rate,
      round(avg(dti)*100,2) as avg_dti       
FROM financial_loan 
GROUP BY loan_status;

# MTD
SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM financial_loan
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status;


# MONTH
SELECT
      month(ISSUE_DATE) AS MONTH_NUMBER,
      monthname(ISSUE_DATE) AS MONTH_NAME,
      COUNT(ID) AS TOTAL_LOAN_APPLICATION,
      SUM(total_payment) AS TOTAL_FUNDED_AMOUNT,
      SUM(LOAN_AMOUNT) AS TOTAL_LOAN_AMOUNT
FROM financial_loan
GROUP BY MONTH_NUMBER , MONTH_NAME
ORDER BY MONTH_NUMBER  ;


# STATE
SELECT 
       address_state , 
       COUNT(ID) AS TOTAL_LOAN_APPLICATION,
       SUM(total_payment) AS Total_Amount_Received, 
	   SUM(loan_amount) AS Total_Funded_Amount 
 FROM financial_loan
 GROUP BY address_state 
 ORDER BY address_state;

 # TERM
SELECT 
       TERM, 
       COUNT(ID) AS TOTAL_LOAN_APPLICATION,
       SUM(total_payment) AS Total_Amount_Received, 
	   SUM(loan_amount) AS Total_Funded_Amount 
 FROM financial_loan
 GROUP BY TERM 
 ORDER BY TERM;


# EMPLOYEE LENGTH

SELECT  
	  emp_length,
      COUNT(ID) AS TOTAL_LOAN_APPLICATION,
       SUM(total_payment) AS Total_Amount_Received, 
	   SUM(loan_amount) AS Total_Funded_Amount 
 FROM financial_loan
 GROUP BY emp_length 
 ORDER BY emp_length;
 
 # PURPOSE
 SELECT  
	  purpose,
      COUNT(ID) AS TOTAL_LOAN_APPLICATION,
       SUM(total_payment) AS Total_Amount_Received, 
	   SUM(loan_amount) AS Total_Funded_Amount 
 FROM financial_loan
 GROUP BY purpose 
 ORDER BY purpose;
 
 
 # HOME OWNERSHIP
 
 SELECT  
	 home_ownership,
      COUNT(ID) AS TOTAL_LOAN_APPLICATION,
       SUM(total_payment) AS Total_Amount_Received, 
	   SUM(loan_amount) AS Total_Funded_Amount 
 FROM financial_loan
 GROUP BY home_ownership
 ORDER BY home_ownership;
 
 
 # grade
 SELECT 
       grade,
       COUNT(ID) AS TOTAL_LOAN_APPLICATION,
       SUM(total_payment) AS Total_Amount_Received, 
	   SUM(loan_amount) AS Total_Funded_Amount 
 FROM financial_loan
 GROUP BY grade
 ORDER BY grade;

