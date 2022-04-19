create table if not exists genre (
	Id serial primary key,
	Name varchar(40) not null
);

create table if not exists songer (
	Id serial primary key,
	Name varchar(40) not null,
	Id_genre integer references genre(id)
);

create table if not exists album (
	Id serial primary key,
	Name varchar(40) not null,
	release_year integer,
	Id_songer integer references songer(id)
);

create table if not exists collection (
	Id serial primary key,
	Name varchar(40) not null,
	release_year integer
);

create table if not exists track (
	Id serial primary key,
	Name varchar(40) not null,
	length_seconds integer,
	collection_id integer not null references collection(id),
	album_id integer not null references album(id)
);

create table if not exists genre_songer (
	genre_id integer references genre(id),
	songer_id integer references songer(id),
	constraint genre_songer_pk primary key (genre_id, songer_id)
);

create table if not exists songer_album (
	album_id integer references album(id),
	songer_id integer references songer(id),
	constraint songer_album_pk primary key (songer_id, album_id)
);
	
create table if not exists collection_track (
	collection_id integer references collection(id),
	track_id integer references track(id),
	constraint collection_track_pk primary key (collection_id, track_id)
);