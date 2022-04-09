create table if not exists Genre (
	Id serial primary key,
	Name varchar(40) not null
);

create table if not exists Songer (
	Id serial primary key,
	Name varchar(40) not null,
	Id_genre integer references Genre(id)
);

create table if not exists Album (
	Id serial primary key,
	Name varchar(40) not null,
	release_year integer,
	Id_songer integer references Songer(id)
);

create table if not exists Collection (
	Id serial primary key,
	Name varchar(40) not null,
	release_year integer
);

create table if not exists Track (
	Id serial primary key,
	Name varchar(40) not null,
	length_seconds integer,
	collection_id integer not null references Collection(id),
	album_id integer not null references Album(id)
);

create table if not exists GenreSonger (
	genre_id integer references Genre(id),
	songer_id integer references Songer(id),
	constraint genre_songer_pk primary key (genre_id, songer_id)
);

create table if not exists SongerAlbum (
	album_id integer references Album(id),
	songer_id integer references Songer(id),
	constraint songer_album_pk primary key (songer_id, album_id)
);