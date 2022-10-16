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


-----------------------------------
 --drop table DimSupplier_Type1
CREATE TABLE [dbo].[DimSupplier_Type1](
       [SupplierCode] CHAR(8),
       [SupplierName] [varchar](50) NULL,
       [Address] [varchar](50) NULL
       CONSTRAINT [PK_DimSupplier_1] PRIMARY KEY CLUSTERED ([SupplierCode] ASC)
) ON [PRIMARY]

---------------------------------------
SELECT * FROM [dbo].[Supplier]
SELECT * FROM [dbo].[DimSupplier_Type1]
------------------------------------------------

--scd type 1:
MERGE INTO [dbo].[DimSupplier_Type1] Dest
USING [dbo].[Supplier] Src
       ON (Dest.[SupplierCode] = Src.[SupplierCode])
WHEN MATCHED THEN 
UPDATE SET Dest.SupplierCode=src.SupplierCode,Dest.SupplierName=src.SupplierName,Dest.Address=src.Address

WHEN NOT MATCHED THEN
insert values(src.SupplierCode,src.SupplierName,src.Address) ;


