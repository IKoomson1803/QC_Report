USE [QCSUK]
GO

INSERT INTO [bward].[qcClients] (CustName,GradingScale)
SELECT 'Disney Plus Originals - TWDC',5
WHERE NOT EXISTS (SELECT NULL FROM  [bward].[qcClients] WHERE CustName =  'Disney Plus Originals - TWDC')

GO
