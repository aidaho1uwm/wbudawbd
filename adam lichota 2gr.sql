# mysql -u infs_lichotaa -p
use infs_lichotaa;
select * from infs_lichotaa;

# lab 3, zadanie 3
create table izba (
adres_budynku varchar(50) not null,
nazwa_izby varchar(50) not null,
metraz mediumint unsigned,
wlasciciel int,
primary key(adres_budynku, nazwa_izby),
foreign key (wlasciciel) 
references postac(id_postaci) on delete set null
);
# on delete lub on update -> restrict|set null|cascade
drop table izba;
# on delete lub on update -> restrict|set
# pkt 2
alter table izba add column 
kolor varchar(30) default 'czarny'
after metraz;
describe izba;
# pkt 3
insert into izba values
('Kolejowa 23', 'spiżarnia',10,default,1);
select * from izba;

# dodac klucz glówny do tabeli izba
alter table izba add
primary key(adres_budynku, nazwa_izby);



create table przetwory (
nazwa_statku varchar(50),
id_przetworu tinyint,
rok_produkcji smallint default 1654,
id_wykonawcy tinyint,
zawartosc varchar(50) not null,
dodatek varchar(50) default 'papryczka chilii',
id_konsumenta int,
primary key(id_konsumenta, id_wykonawcy),
foreign key (id_konsumenta)
references postac(id_postaci),
foreign key (id_wykonawcy)
references postac(id_postaci)
);

insert into przetwory values
(1, default, 1,'bigos', 'papryczka chilii',1 );

alter table postac add column nazwa_statku varchar(50);

create table postac (
nazwa_statku varchar(50),
rodzaj_statku varchar(50),
primary key(nazwa_statku),
data_wodowania smallint,
max_ladownosc mediumint unsigned,
foreign key(nazwa_statku)
references postac(nazwa_statku)
);

insert into statek values
('Kawka', 'Morrigan', '01.01.1997', 100);