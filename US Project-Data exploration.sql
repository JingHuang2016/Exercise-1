Use usprojects;
select *
from ushouseholdincome var
inner join ushouseholdincome_statistics inc
on var.id=inc.id
where Mean <> 0;

select var.State_name, round(avg(Mean),1), round(avg(Median),1), avg(ALand), avg(AWater)
from ushouseholdincome var
inner join ushouseholdincome_statistics inc
on var.id=inc.id
where Mean <> 0
group by var.State_Name
order by 3 desc
limit 10;

select var.Type, Count(var.Type), round(avg(Mean),1), round(avg(Median),1), avg(ALand), avg(AWater)
from ushouseholdincome var
inner join ushouseholdincome_statistics inc
on var.id=inc.id
where Mean <> 0
group by var.Type
order by 4 desc
limit 10;

select var.Type, Count(var.Type), round(avg(Mean),1), round(avg(Median),1), avg(ALand), avg(AWater)
from ushouseholdincome var
inner join ushouseholdincome_statistics inc
on var.id=inc.id
where Mean <> 0
group by var.Type
order by 4 desc
limit 10;

select *
from ushouseholdincome
where Type = 'County';

select *
from ushouseholdincome
where Type = 'Urban';

select var.Type, Count(var.Type), round(avg(Mean),1), round(avg(Median),1), avg(ALand), avg(AWater)
from ushouseholdincome var
inner join ushouseholdincome_statistics inc
on var.id=inc.id
where Mean <> 0
group by var.Type
having Count(var.Type)>100
order by 4 desc
limit 10;


select var.State_Name, City, round(avg(Mean),1), round(avg(Median),1)
from ushouseholdincome var
inner join ushouseholdincome_statistics inc
on var.id=inc.id
group by var.State_Name, City
order by round(avg(Mean),1) desc
limit 10;