--drop table [dbo].[Supplier] ;

CREATE TABLE [dbo].[Supplier](
       [SupplierCode] CHAR(8) PRIMARY KEY,
       [SupplierName] [varchar](50) NULL,
       [Address] [varchar](50) NULL,
) ON [PRIMARY]
GO
INSERT INTO [dbo].[Supplier] ([SupplierCode], [SupplierName], [Address])
VALUES
('S0000001', 'ABC Company', 'USA'),
('S0000002', 'XYZ Corporation', 'USA')
GO


 --drop table DimSupplier_Type1
CREATE TABLE [dbo].[DimSupplier_Type1](
       [SupplierCode] CHAR(8),
       [SupplierName] [varchar](50) NULL,
       [Address] [varchar](50) NULL
       CONSTRAINT [PK_DimSupplier_1] PRIMARY KEY CLUSTERED ([SupplierCode] ASC)
) ON [PRIMARY]


SELECT * FROM [dbo].[Supplier]
SELECT * FROM [dbo].[DimSupplier_Type1]

----------------------------------------------------------------------------------
--scd type 1:

merge into DimSupplier_Type1 as tgt
using Supplier as src
on src.SupplierCode=tgt.SupplierCode

WHEN MATCHED AND 
BINARY_checksum(src.SupplierCode,src.SupplierName,src.Address) != BINARY_checksum(tgt.SupplierCode,tgt.SupplierName,tgt.Address) THEN
update set tgt.SupplierCode=src.SupplierCode,tgt.SupplierName=src.SupplierName,tgt.Address=src.Address

WHEN NOT MATCHED THEN
insert values(src.SupplierCode,src.SupplierName,src.Address);

---------------------------
--Day2:
insert into Supplier values ('S0000003','EY','Canada')

--Day3:
update Supplier set SupplierName='EY Canada LLP' where SupplierCode='S0000003'
insert into Supplier values ('S0000004','KPMG','Australia')
