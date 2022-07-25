SET FOREIGN_KEY_CHECKS=0;



create table korisnik (
    id int primary key,
    ime text not null,
    prezime text not null,
    email text not null unique,
    jmbg text not null unique,
    telefon text not null,
    datrodj date not null,
    usc varchar(35),
    dtc date not null default current_timestamp,
    usm varchar(35),
    dtm varchar(35),
    admin int,
    username text not null unique,
    pass text not null,
    plata double,
    datzap date,
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

-- select COLUMN_NAME, CONSTRAINT_NAME, REFERENCED_COLUMN_NAME, REFERENCED_TABLE_NAME
-- from information_schema.KEY_COLUMN_USAGE
-- where TABLE_NAME = 'korisnik';



-- create table instruktor (
--     id int primary key,
--     username text not null unique,
--     pass text not null,
--     plata double,
--     datzap date,
--     constraint fk_korisnik foreign key (id) references korisnik(id) on delete restrict
-- );

-- create index idex_user on instruktor(username);


-- alter table korisnik modify column dtc date default now();
-- alter table korisnik modify column dtm date default now();

-- create table ucenik (
--     id int primary key,
--     zavrsio_teor int default 0, 
--     zavrsio_prvu_pomoc int default 0, 
--     zavrsio_prakticni int default 0, 
--     polozio_prakticni int ,
--     polozio_teor int,
--     dt_polozio date,
--     constraint fk_uc_korisnik foreign key(id) references korisnik(id) on delete restrict,
--     constraint check_zavr_teor check (zavrsio_teor in (0,1)),
--     constraint check_zavr_prvu_pom check (zavrsio_prvu_pomoc in (0,1)),
--     constraint check_zavr_prakt check (zavrsio_prakticni in (0,1)),
--     constraint check_polozio_prakt check (polozio_prakticni in (0,1)),
--     constraint check_polozio_teor check (polozio_teor in (0,1)),
--     constraint dt_polozio check (polozio_prakticni = 1 and polozio_teor = 1)
-- );

create table kategorija (
    id int primary key, 
    naziv text not null,
    min_god int, 
    usc varchar(35), 
    dtc date default now(), 
    usm varchar(35), 
    dtm date default now(),
--     constraint fk_kat_usc foreign key(usc) references instruktor(username),
--     constraint fk_kat_usm foreign key(usm) references instruktor(username),
    constraint check_kat_min_god check (min_god > 0)
);

alter table kategorija 
add constraint fk_kat_usc foreign key(usc) references instruktor(username);

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
    constraint fk_gr_inst foreign key(id_instr) references instruktor(id),
    constraint fk_gr_kateg foreign key(id_kategor) references kategorija(id)    
);
alter table grupa
add constraint fk_grupa_usc foreign key(usc) references instruktor(username);
alter table grupa
add constraint fk_grupa_usm foreign key(usm) references instruktor(username);

create table polaznici (
    id_grupa int, 
    id_ucenik int, 
    usc varchar(35), 
    dtc date default now(),
    constraint pk_polaznici primary key (id_grupa, id_ucenik),
    constraint fk_polaz_grupa foreign key(id_grupa) references grupa(id),
    constraint fk_polaz_ucenik foreign key(id_ucenik) references ucenik(id)
);
alter table polaznici
add constraint fk_polaznici_usc foreign key(usc) references instruktor(username);


create table prakticniCas (
    rbr int,
    id_instr int, 
    id_ucenik int, 
    naziv text, 
    odrzan date, 
    usc varchar(35),
    dtc date default now(),
    constraint pk_prakticniCas primary key (rbr, id_instr, id_ucenik),
    constraint fk_prakCas_instr foreign key(id_instr) references instruktor(id),
    constraint fk_prakCas_ucenik foreign key(id_ucenik) references ucenik(id)
);
alter table prakticniCas
add constraint fk_prakCas_usc foreign key(usc) references instruktor(username);
    
create table teorijskiCas (
    id_instr int,
    id_grupa int, 
    dt date, 
    rbr_teor_cas int not null unique, 
    tema text , 
    usc varchar(35), 
    dtc date default now(), 
    usm varchar(35), 
    dtm date default now(),
    constraint pk_teorijskiCas primary key (id_instr, id_grupa, dt),
    constraint fk_teorCas_grupa foreign key(id_grupa) references grupa(id),
    constraint fk_teorCas_instruktor foreign key(id_instr) references instruktor(id)
);
alter table teorijskicas
add constraint fk_teorCas_usc foreign key(usc) references instruktor(username);
alter table teorijskicas
add constraint fk_teorCas_usm foreign key(usm) references instruktor(username);


create table odslusaniCas (
    rbr_teor_cas int,
    id_ucenik int,
    usc varchar(35), 
    dtc date default now(),
    constraint pk_odslusaniCas primary key (rbr_teor_cas, id_ucenik),
    constraint fk_odslusCas_teorCas foreign key(rbr_teor_cas) references teorijskiCas(rbr_teor_cas),
    constraint fk_odslusCas_ucenik foreign key(id_ucenik) references ucenik(id)
);
-- alter table odslusaniCas
-- add constraint fk_odslCas_usc foreign key(usc) references instruktor(username);



create or replace view all_users as 
    select  case when exists(select u1.id from ucenik u1 where u1.id = k.id) then 'U' else 'I' end as 'kor',
            k.*, 
            i.username, i.pass, i.plata, i.datzap,
            u.zavrsio_teor, u.zavrsio_prvu_pomoc, u.zavrsio_prakticni, u.polozio_prakticni, u.polozio_teor, u.dt_polozio 
    from    korisnik k
    left join    ucenik u
        on  k.id = u.id
    left join    instruktor i
        on  k.id= i.id
    order by k.id;


create or replace view wx_grupa as
    select  g.id gr_id, g.naziv g_naziv, g.dtpoc, k.id kat_id, k.naziv k_naziv,
            au.kor, au.id, concat(au.ime,' ',au.prezime) ime_prez, au.email 
    from    grupa g 
    left join    kategorija k 
        on  g.id_kategor = k.id
    left join    polaznici p
        on  g.id = p.id_grupa 
    join    all_users au 
        on  g.id_instr = au.id 
        or  p.id_ucenik = au.id 

--------------------------------------------------------------------------------

INSERT INTO 
auto_skola.korisnik (id, ime, prezime, email, jmbg, telefon, datrodj,
                        usc, dtc, usm, dtm) 
VALUES(1, 'Aleksandar', 'Janković', 'akendar.jankovic95@yahoo.com', '1234567890123', '/', '1995-10-29',
                        '', current_timestamp, NULL, NULL);


INSERT INTO auto_skola.instruktor (id, username, pass, plata, datzap) 
                            values (1, 'aca', 'a', 123.0, NULL);

update auto_skola.instruktor 
set datzap = current_timestamp()
where id = 1; 

alter table korisnik
add constraint fk_kor_usc foreign key (usc) references instruktor(username);
alter table korisnik
add constraint fk_kor_usm foreign key (usm) references instruktor(username);






insert into korisnik(id) 
(select coalesce(max(k.id), 0)+1 from korisnik k)


select * from korisnik;
select * from ucenik;
select * from grupa;
select * from kategorija k ;
select * from instruktor i ;
select * from polaznici p ;
select * from odslusanicas o ;
select * from prakticnicas p ;
select * from teorijskicas t ;

select * from all_users au ;

    select  *
    from    grupa g 
    left join    kategorija k 
        on  g.id_kategor = k.id
    left join    polaznici p
        on  g.id = p.id_grupa 
    join    all_users au 
        on  g.id_instr = au.id 
        or  p.id_ucenik = au.id 


SELECT id, naziv, dtpoc, usc, dtc, usm, dtm, id_instr, id_kategor
FROM grupa
WHERE 1=1  and id = 1


SELECT id, naziv, dtpoc, usc, dtc, usm, dtm, id_instr, id_kategor
FROM grupa
WHERE 1=1  and dtc = '2021-09-24'

select * from all_users;
select * from wx_grupa where gr_id = 1;

select * from teorijskicas t ;


    insert into teorijskiCas(id_instr, id_grupa, rbr_teor_cas, tema, dt, usc) 
values(1, 1, 
    (select (coalesce(max(tc.rbr_teor_cas), 0) + 1) from teorijskiCas tc )
, 'test cas', '2021-10-01','aca')


insert into prakticniCas(rbr, id_instr, id_ucenik, naziv, odrzan, usc)
values((select coalesce(max(pc.rbr), 0)+1 from prakticniCas pc
    where pc.id_instr=1
        and pc.id_ucenik=2)
, 1, 2, 'test prakticni cas 1', '2021-10-01', 'aca')

select * from prakticnicas p ;

insert into prakticniCas(rbr, id_instr, id_ucenik, naziv, odrzan)
values((select coalesce(max(pc.rbr), 0)+1 from prakticniCas pc
    where pc.id_instr=1
        and pc.id_ucenik=4)
, 1, 4, 'test', '2021-09-05')

select * from grupa g ;


select * from all_users where kor = 'U';

select * from wx_grupa wg ;