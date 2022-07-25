create schema if not exists auto_skola_2;

-- show variables like 'sql_mode' ; 
-- show variables like 'explicit_defaults_for_timestamp';
-- 
-- set sql_mode = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';


create table auto_skola_2.instruktor (
    id int primary key,
    ime text not null,
    prezime text not null,
    email text not null unique,
    jmbg text not null unique,
    telefon text not null,
    datrodj date not null,
    username varchar(64) not null unique,
    pass text not null,
    plata double,
    datzap date,
    usc varchar(64),
    dtc timestamp not null default current_timestamp,
    usm varchar(64),
    dtm timestamp null
);

-- drop index index_username on instruktor(username);

-- alter table instruktor drop index index_username;

create table auto_skola_2.ucenik (
    id int primary key,
    ime text not null,
    prezime text not null,
    email text not null unique,
    jmbg text not null unique,
    telefon text not null,
    datrodj date not null,
    usc varchar(64),
    dtc date not null default current_timestamp,
    usm varchar(64),
    dtm timestamp null,
    zavrsio_teor int default 0, 
    zavrsio_prvu_pomoc int default 0, 
    zavrsio_prakticni int default 0, 
    polozio_prakticni int ,
    polozio_teor int,
    dt_polozio date,
    constraint check_zavr_teor check (zavrsio_teor in (0,1)),
    constraint check_zavr_prvu_pom check (zavrsio_prvu_pomoc in (0,1)),
    constraint check_zavr_prakt check (zavrsio_prakticni in (0,1)),
    constraint check_polozio_prakt check (polozio_prakticni in (0,1)),
    constraint check_polozio_teor check (polozio_teor in (0,1)),
    constraint dt_polozio check (polozio_prakticni = 1 and polozio_teor = 1)
);

alter table ucenik add constraint fk_ucenik_instrutkor_usc foreign key(usc) references instruktor(username);
alter table ucenik add constraint fk_ucenik_instrutkor_usm foreign key(usm) references instruktor(username);

create table kategorija (
    id int primary key, 
    naziv text not null,
    min_god int, 
    usc varchar(35), 
    dtc date default now(), 
    usm varchar(35), 
    dtm date default now(),
    constraint fk_kat_usc foreign key(usc) references instruktor(username),
    constraint fk_kat_usm foreign key(usm) references instruktor(username),
    constraint check_kat_min_god check (min_god > 0)
);

create table grupa (
    id int primary key, 
    naziv text not null, 
    dtpoc date, 
    usc varchar(35), 
    dtc date default now(), 
    usm varchar(35), 
    dtm date default now(), 
    id_instr int, 
    id_kategor int,
    constraint fk_grupa_usc foreign key(usc) references instruktor(username),
    constraint fk_grupa_usm foreign key(usm) references instruktor(username),
    constraint fk_gr_inst foreign key(id_instr) references instruktor(id),
    constraint fk_gr_kateg foreign key(id_kategor) references kategorija(id)    
);

create table polaznici (
    id_grupa int, 
    id_ucenik int, 
    usc varchar(35), 
    dtc timestamp default now(),
    constraint pk_polaznici primary key (id_grupa, id_ucenik),
    constraint fk_polaznici_usc foreign key(usc) references instruktor(username),
    constraint fk_polaz_grupa foreign key(id_grupa) references grupa(id),
    constraint fk_polaz_ucenik foreign key(id_ucenik) references ucenik(id)
);

alter table auto_skola_2.polaznici add constraint pk_polaznici primary key (id_grupa, id_ucenik);

create table prakticniCas (
    rbr int,
    id_instruktor int, 
    id_ucenik int, 
    naziv text, 
    odrzan date, 
    usc varchar(35),
    dtc date default now(),
    constraint pk_prakticniCas primary key (rbr, id_instr, id_ucenik),
    constraint fk_prakCas_usc foreign key(usc) references instruktor(username),
    constraint fk_prakCas_instr foreign key(id_instr) references instruktor(id),
    constraint fk_prakCas_ucenik foreign key(id_ucenik) references ucenik(id)
);


create table teorijskiCas (
    id_instr int,
    id_grupa int, 
    dt timestamp, 
    rbr_teor_cas int not null unique auto_increment, 
    tema text , 
    usc varchar(35), 
    dtc date default now(), 
    usm varchar(35), 
    dtm date default now(),
    constraint pk_teorijskiCas primary key (rbr_teor_cas),
--     constraint pk_teorijskiCas primary key (id_instr, id_grupa, dt),
    constraint fk_teorCas_grupa foreign key(id_grupa) references grupa(id),
    constraint fk_teorCas_instruktor foreign key(id_instr) references instruktor(id),
    constraint fk_teorCas_usc foreign key(usc) references instruktor(username),
    constraint fk_teorCas_usm foreign key(usm) references instruktor(username)
);

create table odslusaniCas (
    rbr_teor_cas int,
    id_ucenik int,
    usc varchar(35), 
    dtc date default now(),
    constraint pk_odslusaniCas primary key (rbr_teor_cas, id_ucenik),
    constraint fk_odslusCas_teorCas foreign key(rbr_teor_cas) references teorijskiCas(rbr_teor_cas),
    constraint fk_odslusCas_ucenik foreign key(id_ucenik) references ucenik(id),
    constraint fk_odslusCas_usc foreign key(usc) references instruktor(username)
);


create or replace view auto_skola_3.wx_ucenik_group as
-- students not in group
select  id,
        ime,
        prezime,
        email,
        telefon,
        datrodj 
from    ucenik
where   not exists (
    select  1
    from    polaznici p
    where   p.id_ucenik = ucenik.id
        and p.id_grupa = :id_grupa
);


-- students in group 
select  id,
        ime,
        prezime,
        email,
        telefon,
        datrodj 
from    ucenik
where   exists (
    select  1
    from    polaznici p
    where   p.id_ucenik = ucenik.id
        and p.id_grupa = :id_grupa
);


select * from grupa;

select * from polaznici p where id_grupa = 1 ;

select * from ucenik




select * from wx_ucenik_group;


create or replace view auto_skola_3.wx_grupa_dodaj_ucenika as 
select  g.id id_grupa,
        g.naziv,
        g.dtpoc,
        id_instruktor,
        i.ime ime_instruktor,
        i.prezime prezime_instruktor,
        id_kategorija  id_kategorija,
        k.naziv naziv_kategorija
from    grupa g
join    instruktor i
    on  g.id_instruktor = i.id
join    kategorija k
    on g.id_kategorija = k.id;

select * from wx_grupa_dodaj_ucenika;


select * from wx_ucenik_group wug 

select * from polaznici p;


-- select * from (
with insert_q as (
    INSERT INTO ucenik (id, ime, prezime, email, jmbg, telefon, datrodj, zavrsio_teor, zavrsio_prvu_pomoc, zavrsio_prakticni,
                    polozio_prakticni, polozio_teor, dt_polozio, usc, dtc, usm, dtm)
    VALUES ((select coalesce(max(u.id), 0)+1 from ucenik u), 'test', 'test', 'test', 'test', 'test', now(),
            null, null, null, null, null, null, null, current_timestamp, null, null)      
    ON DUPLICATE KEY UPDATE 
           ime = null,prezime = null, email = null, jmbg = null, telefon = null, usm = null, dtm = current_timestamp
    RETURNING id
)
select * from insert_q.id





INSERT INTO ucenik (id, ime, prezime, email, jmbg, telefon, datrodj, 
            zavrsio_teor, zavrsio_prvu_pomoc, zavrsio_prakticni, polozio_prakticni, polozio_teor, dt_polozio, usc, dtc, usm, dtm)
      VALUES ((select coalesce(max(u.id), 0)+1 from ucenik u),null, null, null, null, null, null, 
              null, null, null, null, null, null, null, current_timestamp, null, null)      
ON DUPLICATE KEY UPDATE 
           ime = null,prezime = null, email = null, jmbg = null, telefon = null, usm = null, dtm = current_timestamp
           
           
           
select * from kategorija k ;
select * from ucenik u ;
select * from auto_skola.grupa g ;           
select * from odslusanicas o ;

insert into polaznici(id_grupa, id_ucenik, usc, dtc)
values(1, 1, 'aca', '2021-10-01')



select * from prakticnicas p 



-- INSERT INTO ucenik (id, ime, prezime, email, jmbg, telefon, datrodj, 
--     zavrsio_teor, zavrsio_prvu_pomoc, zavrsio_prakticni, polozio_prakticni, polozio_teor, dt_polozio, usc, dtc, usm, dtm)
-- VALUES ((select coalesce(max(u.id), 0)+1 from ucenik u),'aca', 'janko', 'aca_janko@email.com', '1234', '0989231', '1995-10-29', 
--     null, null, null, null, null, null, null, current_timestamp, null, null)
-- ON DUPLICATE KEY UPDATE            
--     ime = 'null',prezime = 'null', email = 'null', jmbg = 'null', telefon = 'null', usm = 'null', dtm = current_timestamp
-- returning id

select * from ucenik;
    
select * from grupa;

select * from wx_grupa_dodaj_ucenika wgdu ;

select * from wx_ucenik_group wug ;

select * from instruktor ;

SELECT id, ime, prezime, email, jmbg, telefon, datrodj, usc, dtc, usm, dtm, username, pass, plata, datzap
FROM INSTRUKTOR
WHERE 1=1 
--  and id = 1
--  and ime = 'Aleksandar'
--  and pass = 'a'

select * from teorijskicas t where id_grupa = 1


update instruktor 
set datzap = current_timestamp()
where id = 1

select * from ucenik u ;

select * from instruktor i ;


select * from prakticnicas p ;



select
    `g`.`id` as `id_grupa`,
    `g`.`naziv` as `naziv`,
    `g`.`dtpoc` as `dtpoc`,
    `g`.`id_instruktor` as `id_instruktor`,
    `i`.`ime` as `ime_instruktor`,
    `i`.`prezime` as `prezime_instruktor`,
    `g`.`id_kategorija` as `id_kategorija`,
    `k`.`naziv` as `naziv_kategorija`
from
    ((`auto_skola_3`.`grupa` `g`
left join `auto_skola_3`.`instruktor` `i` on
    (`g`.`id_instruktor` = `i`.`id`))
left join `auto_skola_3`.`kategorija` `k` on
    (`g`.`id_kategorija` = `k`.`id`))
    
select * from grupa  ;

UPDATE GRUPA SET
naziv = 'tttt',
dtpoc = '2022-03-06',
usc = null,
dtc = null,
usm = 'aca_janko',
dtm = '2022-03-30 23:15:03.9532576',
id_instruktor = 1,
id_kategorija = null
WHERE 1=1 
 and id = 2
 
 
 alter table ucenik drop constraint dt_polozio; 
 
UPDATE UCENIK SET
ime = '3',
prezime = '3',
email = '3',
jmbg = '3',
telefon = '3',
datrodj = '1999-01-29',
zavrsio_teor = 0,
zavrsio_prvu_pomoc = 0,
zavrsio_prakticni = 0,
polozio_prakticni = 0,
polozio_teor = 0,
dt_polozio = null,
usm = 'aca_janko',
dtm = '2022-04-01 00:08:54'
WHERE 1=1 
 and id = 5
 
 
 select * from auto_skola_3.grupa;