-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
if exists (select * from sysobjects where id=object_id('dbo.p1'))
Drop procedure dbo.p1
go
CREATE PROCEDURE p1(@manuf_name varchar(20), @country varchar(20))
	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @id_c int =0;
if not exists (select * from COUNTRY where NAME=@country)
begin 
insert into COUNTRY values (@country)
end
select @id_c = id_country from COUNTRY where NAME=@country
insert into MANUFACTURER values(@id_c,@manuf_name) 

END
GO

exec p1 'KK12','ll3'
go


-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
if exists (select * from sysobjects where id=object_id('dbo.p2'))
Drop procedure dbo.p2
go

CREATE PROCEDURE p2(@diller varchar(20),@yes int=0 out)	
AS
BEGIN
SET NOCOUNT ON;
declare @id_t int=0
declare @id_c int=0

select @id_t = dbo.DILLER.ID_DILLER,@id_c=diller.ID_CITY from dbo.DILLER
 where DILLER.NAME=@diller
if @id_t<>0 
begin
delete from dbo.sell where sell.id_table in
(select id_table from forsell where FORSELL.ID_DILLER=@id_t)
delete from dbo.FORSELL where FORSELL.ID_DILLER=@id_t
delete from dbo.DILLER where diller.NAME=@diller
if not exists (select * from DILLER where diller.ID_CITY=@id_c)
begin
delete from CITY where city.ID_CITY=@id_c
end
select @yes=1
end 	
END
GO

declare @x1 int
declare @x2 int 
exec p2 'Volkswagen',@x1 out
exec p2 'Merzedes',@x2 out
select @x1
go


-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
if exists (select * from sysobjects where id=object_id('dbo.p3'))
Drop procedure dbo.p3
go
CREATE PROCEDURE p3(@s varchar(20),@s1 varchar(20),@x int out)
	-- Add the parameters for the stored procedure here	
AS

	 select @x =avg(FORSELL.PRICE) from FORSELL,AUTOS,DILLER,CITY 
	 where forsell.ID_MODEL = 
	 (select AUTOS.ID_MODEL from AUTOS 
	 where AUTOS.NAME=@s) and FORSELL.ID_DILLER in 
	 (select DILLER.ID_DILLER from DILLER whereDILLER.ID_CITY=(select CITY.ID_CITY from CITY where CITY.NAME=@s1))

return
GO

declare @e int;
exec p3 'Camry','Москва',@e out
select @e
go


-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
if exists (select * from sysobjects where id=object_id('dbo.p4'))
Drop procedure dbo.p4
go
CREATE PROCEDURE p4 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	create table #SS(c varchar(20),nm int, na int, mp money)
	insert into #SS(c,nm,na,mp)
	select t.NAME,tt.cc as 'eie-ai i?iecaiaeoaeae',tt1.cc1 as 'eie-ai iiaaeae',tt2.cc1 as 'naiay aieuoay oaia'  from COUNTRY as t
left join
(select distinct COUNT(MANUFACTURER.ID_MANUF) as cc,
   MANUFACTURER.ID_COUNTRY
     from MANUFACTURER,COUNTRY
    where MANUFACTURER.ID_COUNTRY=COUNTRY.ID_COUNTRY
    group by MANUFACTURER.ID_COUNTRY) as tt
    on t.ID_COUNTRY=tt.ID_COUNTRY
    left join
    (select distinct COUNT(AUTOS.ID_MODEL) as cc1,
   MANUFACTURER.ID_COUNTRY
     from AUTOS,MANUFACTURER,COUNTRY
    where  AUTOS.ID_MANUF = MANUFACTURER.ID_MANUF and 
     MANUFACTURER.ID_COUNTRY=COUNTRY.ID_COUNTRY
    group by MANUFACTURER.ID_COUNTRY) as tt1
     on tt.ID_COUNTRY=tt1.ID_COUNTRY
    left join
    (select distinct max(FORSELL.PRICE) as cc1,
   MANUFACTURER.ID_COUNTRY
     from Forsell,AUTOS,MANUFACTURER,COUNTRY
    where  FORSELL.ID_MODEL=autos.ID_MODEL and 
    AUTOS.ID_MANUF = MANUFACTURER.ID_MANUF and 
     MANUFACTURER.ID_COUNTRY=COUNTRY.ID_COUNTRY
    group by MANUFACTURER.ID_COUNTRY)as tt2
    on tt1.ID_COUNTRY=tt2.ID_COUNTRY
    select * from #ss
END
GO

exec p4
go
