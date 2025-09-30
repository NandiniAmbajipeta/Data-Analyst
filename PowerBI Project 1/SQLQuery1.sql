select * from [dbo].[Transactions]
select * from [dbo].[Customers]
select * from [dbo].[Accounts]

UPDATE Accounts
SET OpenDate = 
    CASE
        WHEN TRY_CONVERT(date, OpenDate, 101) IS NOT NULL 
            THEN FORMAT(TRY_CONVERT(date, OpenDate, 101), 'MM/dd/yyyy')
        WHEN TRY_CONVERT(date, OpenDate, 23) IS NOT NULL    
            THEN FORMAT(TRY_CONVERT(date, OpenDate, 23), 'MM/dd/yyyy')
        WHEN TRY_CONVERT(date, OpenDate, 111) IS NOT NULL   
            THEN FORMAT(TRY_CONVERT(date, OpenDate, 111), 'MM/dd/yyyy')
        WHEN TRY_CONVERT(date, OpenDate, 105) IS NOT NULL  
            THEN FORMAT(TRY_CONVERT(date, OpenDate, 105), 'MM/dd/yyyy')
        WHEN TRY_CONVERT(date, OpenDate, 103) IS NOT NULL
            THEN FORMAT(TRY_CONVERT(date, OpenDate, 103), 'MM/dd/yyyy') 
        ELSE OpenDate  -- leave as is if unable to parse
    END;


UPDATE Customers
SET DateOfBirth = 
    CASE
        WHEN TRY_CONVERT(date, DateOfBirth, 101) IS NOT NULL 
            THEN FORMAT(TRY_CONVERT(date, DateOfBirth, 101), 'MM/dd/yyyy')
        WHEN TRY_CONVERT(date, DateOfBirth, 23) IS NOT NULL    
            THEN FORMAT(TRY_CONVERT(date, DateOfBirth, 23), 'MM/dd/yyyy')
        WHEN TRY_CONVERT(date, DateOfBirth, 111) IS NOT NULL   
            THEN FORMAT(TRY_CONVERT(date, DateOfBirth, 111), 'MM/dd/yyyy')
        WHEN TRY_CONVERT(date, DateOfBirth, 105) IS NOT NULL  
            THEN FORMAT(TRY_CONVERT(date, DateOfBirth, 105), 'MM/dd/yyyy')
        WHEN TRY_CONVERT(date, DateOfBirth, 103) IS NOT NULL
            THEN FORMAT(TRY_CONVERT(date, DateOfBirth, 103), 'MM/dd/yyyy')
        ELSE DateOfBirth
    END;

UPDATE Transactions
SET Transactiondate = 
    CASE
        -- MM/DD/YYYY or MM-DD-YYYY
        WHEN TRY_CONVERT(date, Transactiondate, 101) IS NOT NULL 
            THEN FORMAT(TRY_CONVERT(date, Transactiondate, 101), 'MM/dd/yyyy')
        -- YYYY-MM-DD
        WHEN TRY_CONVERT(date, Transactiondate, 23) IS NOT NULL    
            THEN FORMAT(TRY_CONVERT(date, Transactiondate, 23), 'MM/dd/yyyy')
        -- YYYY/MM/DD
        WHEN TRY_CONVERT(date, Transactiondate, 111) IS NOT NULL   
            THEN FORMAT(TRY_CONVERT(date, Transactiondate, 111), 'MM/dd/yyyy')
        -- DD-MM-YYYY
        WHEN TRY_CONVERT(date, Transactiondate, 105) IS NOT NULL  
            THEN FORMAT(TRY_CONVERT(date, Transactiondate, 105), 'MM/dd/yyyy')
        -- DD/MM/YYYY
        WHEN TRY_CONVERT(date, Transactiondate, 103) IS NOT NULL
            THEN FORMAT(TRY_CONVERT(date, Transactiondate, 103), 'MM/dd/yyyy')
        ELSE Transactiondate
    END;

select top 5 * from [dbo].[Accounts]
select top 5 * from [dbo].[Customers]
select top 5 * from [dbo].[Transactions]

select 
t.TransactionID,
t.AccountID AS Transaction_AccountID,
t.TransactionDate,
t.Type as TransactionType,
t.Amount,
t.Description,
t.Currency,
a.AccountID AS Account_AccountID,
a.customerID AS Account_CustomerID,
a.Type AS AccountType,
a.OpenDate,
a.Balance,
c.CustomerID,
c.Name,
c.Gender,
c.DateOfBirth,
c.Address,
c.Email,
c.Phone
INTO CombinedBankingDataset
FROM 
Transactions t
Left Join Accounts a ON t.AccountID=a.AccountID
left join Customers c ON a.CustomerID=c.CustomerID

select * from CombinedBankingDataset

select distinct AccountID from [dbo].[Transactions]