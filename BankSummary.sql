create database one_db;
use one_db;
select * from financial_data;

select count(id) as total_loan_applications from financial_data; #15051 customers total loan applications
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM financial_data; #amount disbursed in 2021
SELECT SUM(total_payment) AS Total_Amount_Collected FROM financial_data; #amount received back by bank
SELECT AVG(int_rate)*100 AS Avg_Int_Rate FROM financial_data; #avg interest rate 
SELECT ROUND(AVG(int_rate),2)*100 AS Avg_Int_Rate FROM financial_data; #avg interest rate rounded off
SELECT AVG(dti)*100 AS Avg_DTI FROM financial_data; #debt to income ratio - whether loan should be given or not - financial health of the customer 
#dti should be 30-35% 
select loan_status from financial_data; #good loan - fully paid loan and current loan - good for bank 
#bad loan - charged off - defaulters bad for bank

SELECT
    (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100.0) / 
	COUNT(id) AS Good_Loan_Percentage
FROM financial_data; #good loan percent 86%

SELECT COUNT(id) AS Good_Loan_Applications FROM financial_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'; #13k people 

SELECT SUM(loan_amount) AS Good_Loan_Funded_amount FROM financial_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'; #good loan amount given by bank

SELECT SUM(total_payment) AS Good_Loan_amount_received FROM financial_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'; #good loan amount received by bank 

SELECT
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / 
	COUNT(id) AS Bad_Loan_Percentage
FROM financial_data; #bad load percent 

SELECT COUNT(id) AS Bad_Loan_Applications FROM financial_data
WHERE loan_status = 'Charged Off'; #bad loan applications - bank gave 1708 loans which became defaulters 

SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount FROM financial_data
WHERE loan_status = 'Charged Off'; #this amount given by bank as bad loan investigation required - cibil score 

SELECT SUM(total_payment) AS Bad_Loan_amount_received FROM financial_data
WHERE loan_status = 'Charged Off'; #only this much amt retreived back

SELECT loan_status, COUNT(id) AS LoanCount, SUM(total_payment) AS Total_Amount_Received, SUM(loan_amount) AS Total_Funded_Amount, AVG(int_rate * 100) AS Interest_Rate, AVG(dti * 100) AS DTI
FROM financial_data GROUP BY loan_status; 









