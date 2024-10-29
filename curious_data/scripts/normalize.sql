-- TEAM
select distinct(team)
as description
into teams
from import.master_plan;

alter table teams
add id serial primary key;

-- SPASS TYPES
select distinct(spass_type)
as description
into spass_types
from import.master_plan;

alter table spass_types
add id serial primary key;

-- TARGET
select distinct(target)
as description
into targets
from import.master_plan;


alter table targets
add id serial primary key;

-- EVENT TYPES
select distinct(library_definition)
as description
into event_types
from import.master_plan;


alter table event_types
add id serial primary key;

--REQUESTS
select distinct(request_name)
as description
into requests
from import.master_plan;

alter table requests
add id serial primary key;


insert into public.events(
	time_stamp,
	title,
	description,
	event_type_id,
	target_id,
	team_id,
	request_id,
	spass_type_id
)
select
	import.master_plan.start_time_utc::timestamp,
	import.master_plan.title,
	import.master_plan.description,
	event_types.id as event_type_id,
	targets.id as target_id,
	teams.id as team_id,
	requests.id as request_id,
	spass_types.id as spass_type_id
from import.master_plan
left join event_types
	on event_types.description
	= import.master_plan.library_definition
left join targets
	on targets.description
	= import.master_plan.target
left join teams
	on teams.description
	= import.master_plan.team
left join requests
	on requests.description
	= import.master_plan.request_name
left join spass_types
	on spass_types.description
	= import.master_plan.spass_type;