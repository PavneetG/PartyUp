CREATE SCHEMA music;

CREATE TABLE music.groups ( 
	id                   integer  NOT NULL GENERATED BY DEFAULT AS IDENTITY UNIQUE,
	name             	 varchar(100) UNIQUE,
	voted_songs          json,
	code                 varchar(200) UNIQUE,
	spotify_token        varchar(200)
 );

CREATE TABLE music.users ( 
	id                   integer  NOT NULL GENERATED BY DEFAULT AS IDENTITY UNIQUE,
	nickname             varchar(100),
	group_id             integer,
	CONSTRAINT PK_NICKNAME_GROUP PRIMARY KEY (nickname, group_id),
	FOREIGN KEY (group_id) REFERENCES music.groups(id)
 );
