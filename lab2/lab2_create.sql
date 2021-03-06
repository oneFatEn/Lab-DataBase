-- create database weibo;
-- go
use weibo;
go

drop table if exists users;
create table users(
	uids int primary key,
	names char(30) not null,
	sex char(2) not null,
	byear int not null,
	city char(30) not null
);

drop table if exists label;
create table label(
	lid int primary key,
	lname char(30) not null
);

drop table if exists mblog;
create table mblog(
	bid int primary key,
	title char(30) not null,
	uids int not null,
	pyear int not null,
	pmonth int not null,
	pday int not null,
	cont text not null,
	foreign key (uids) references users(uids)
);

drop table if exists b_l;
create table b_l(
	bid int not null,
	lid int not null,
	foreign key (bid) references mblog(bid),
	foreign key (lid) references label(lid)
);

drop table if exists follow;
create table follow(
	uids int not null,
	uidfled int not null,
	foreign key (uids) references users(uids),
	foreign key (uidfled) references users(uids),
	primary key (uids, uidfled)
);

drop table if exists friends;
create table friends(
	uids int,
	fuid int not null,
	foreign key (uids) references users(uids),
	foreign key (fuid) references users(uids),
	primary key (uids, fuid)
);

drop table if exists sub;
create table sub(
	uids int not null,
	lid int not null,
	foreign key (uids) references users(uids),
	foreign key (lid) references label(lid),
	primary key (uids, lid)
);

drop table if exists thumb;
create table thumb(
	uids int not null,
	bid int not null,
	foreign key (uids) references users(uids),
	foreign key (bid) references mblog(bid),
	primary key (uids, bid)
);

drop table if exists topday;
create table topday(
	tyear int not null,
	tmonth int not null,
	tday int not null,
	bid int not null,
	tno int not null,
	foreign key (bid) references mblog(bid)
);