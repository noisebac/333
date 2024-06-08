CREATE TABLE arena
(
  id INTEGER Primary Key,
  name varchar,
  size INTEGER
 );
 
CREATE TABLE player
(
id INTEGER Primary Key,
name VARCHAR,
position VARCHAR,
height NUMERIC,
weight NUMERIC,
salary NUMERIC,
team_id INTEGER
);

CREATE TABLE team
 (
  id INTEGER primary key,
  city varchar,
  name varchar ,
  coach_name varchar ,
  arena_id INTEGER
 );
 


alter table arena alter column name set not null;
alter table arena alter column size set not null;
alter table arena alter column size set default 100;

alter table team alter column name set not null;
alter table team alter column city set not null;
alter table team alter column coach_name set not null;
alter table team alter column arena_id set not null;

alter table player alter column name set not null;
alter table player alter column position set not null;

alter table player alter column height set not null;
alter table player alter column weight set not null;
alter table player alter column salary set not null;
alter table player alter column team_id set not null;

alter table player add check ((HEIGHT >0));
alter table player add check ((WEIGHT >0));
alter table player add check ((SALARY >0));



alter table arena add constraint arena_uk unique (name);
alter table team add constraint team_uk unique (name);
alter table team add constraint team_coach_uk unique (coach_name);
alter table player add constraint player_uk unique (name);

alter table team add constraint team_arena_id_fk foreign key (arena_id) references arena (id) on update cascade on delete restrict;
alter table player add constraint player_team_id_fk foreign key (team_id) references team (id) on update cascade on delete cascade;



create TABLE game
(
id INTEGER Primary Key ,
owner_team_id INTEGER,
guest_team_id INTEGER,
game_date date,
winner_team_id INTEGER,
owner_score INTEGER,
guest_score INTEGER,
arena_id INTEGER
);



alter table game alter column owner_team_id set not null;
alter table game alter column guest_team_id set not null;
alter table game alter column game_date set not null;
alter table game alter column winner_team_id set not null;
alter table game alter column owner_score set not null;
alter table game alter column guest_score set not null;
alter table game alter column arena_id set not null;

alter table game alter column owner_score set default 0;
alter table game alter column guest_score set default 0;
alter table game add check ((owner_score >= 0));
alter table game add check ((guest_score >= 0));

alter table game add constraint game_uk unique (owner_team_id, guest_team_id);
alter table game add constraint game_team_id_fk foreign key (owner_team_id) references team(id) on update cascade on delete cascade;
alter table game add constraint game_team_id_fk1 foreign key (guest_team_id) references team(id) on update cascade on delete cascade;
alter table game add constraint game_team_id_fk2 foreign key (winner_team_id) references team(id) on update cascade on delete cascade;
alter table game add constraint game_team_id_fk3 foreign key (arena_id) references arena(id) on update cascade on delete cascade;