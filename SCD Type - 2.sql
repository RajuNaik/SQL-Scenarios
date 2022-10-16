CREATE TABLE [dbo].[DimSupplier_Type2](
       [SupplierId] [int] IDENTITY(1,1) NOT NULL,
       [SupplierCode] CHAR(8),
       [SupplierName] [varchar](50) NULL,
       [Address] [varchar](50) NULL,
       [EffectiveDate] [date] NULL,
       [ExpirationDate] [date] NULL,
       [CurrentFlag] [char](1) NULL,
       CONSTRAINT [PK_DimSupplier2] PRIMARY KEY CLUSTERED ([SupplierId] ASC)
) ON [PRIMARY]



SELECT * FROM [dbo].[Supplier]
SELECT * FROM [dbo].[DimSupplier_Type2]

insert into DimSupplier_Type2 select SupplierCode,SupplierName,Address,EffectiveDate,ExpirationDate,CurrentFlag
from
(
merge into DimSupplier_Type2 as tgt
using Supplier as src
on src.SupplierCode=isnull(tgt.SupplierCode,'')

when not matched THEN
insert values(src.SupplierCode,src.SupplierName,src.Address,GETDATE(),null,'Y')

when matched and binary_checksum(src.SupplierCode,src.SupplierName,src.Address)!=binary_checksum(tgt.SupplierCode,tgt.SupplierName,tgt.Address) 
and CurrentFlag='Y' THEN
update set ExpirationDate=GETDATE(),CurrentFlag='N'
OUTPUT $ACTION action_taken,src.SupplierCode,src.SupplierName,src.Address,getdate() as EffectiveDate,null as ExpirationDate,'Y' as CurrentFlag
)as merge_table
where merge_table.action_taken='update'






