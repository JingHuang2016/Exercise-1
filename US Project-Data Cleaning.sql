use usprojects;

select ID, count(ID)
from ushouseholdincome
group by ID
having count(ID)>1;

# Change column name
ALTER TABLE ushouseholdincome_statistics rename column `ï»¿id` to `ID`;


select *
from (
select row_id, id,
row_number() over(partition by id order by id) row_num
from ushouseholdincome) duplicates
where row_num >1;

delete from ushouseholdincome
where row_id in (
	select row_id
	from (
	select row_id, id,
	row_number() over(partition by id order by id) row_num
	from ushouseholdincome) duplicates
	where row_num >1);


# Check whether there are duplicates in Table: ushouseholdincome_statistics
select ID, count(ID)
from ushouseholdincome_statistics
group by ID
having count(ID)>1;

# found duplicate state_name "Georgie" and lower case 'a' in 'Alabama'
# Change state_name

update ushouseholdincome
set State_Name = 'Georgia'
where State_Name = 'georia';

update ushouseholdincome
set State_Name = 'Alabama'
where State_Name = 'alabama';

update ushouseholdincome
set Place = 'Autaugaville'
where County='Autauga County' and City='Vinemont';

select Type, Count(Type)
from ushouseholdincome
group by Type
order by 1;

update ushouseholdincome
set Type = 'Borough'
where Type = 'Boroughs';

select Aland, AWater
from ushouseholdincome
where ALand=0 or ALand='' or ALand is null;

