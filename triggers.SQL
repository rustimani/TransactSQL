ALTER trigger notold
on SELL
instead of delete
as
if EXISTS (SELECT * FROM DELETED WHERE year([date]) > year(GETDATE())-5)
begin
print 'слишком недавн€€ сделка'
end 
else 
begin
delete from SELL where ID_SELL IN (select ID_SELL from deleted)
end 
go


alter trigger xxx

on forsell
instead of update
as
if not exists(select * from inserted where (price<10000))
begin
  update forsell
    set price = 
    inserted.price,id_diller=inserted.id_diller,id_model=inserted.id_model from inserted where inserted.ID_TABLE=forsell.ID_TABLE,
end
else print 'NO'
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
