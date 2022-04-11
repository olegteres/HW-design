create table if not exists Department (
	id serial primary key,
	name varchar(40) not null,
);
	
create table if not exists Employee (
	id serial primary key,
	name varchar(40) not null,
	department_id integer primary key references Department(id),
	head_id integer primary key references Employee(id)
);