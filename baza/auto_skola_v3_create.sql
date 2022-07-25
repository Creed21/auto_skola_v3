create schema if not exists auto_skola_3;

create table auto_skola_3.instruktor (
    id int auto_increment primary key,
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

create table auto_skola_3.ucenik (
    id int auto_increment primary key,
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

create table auto_skola_3.kategorija (
    id int auto_increment primary key, 
    naziv text not null,
    min_god int, 
    usc varchar(35), 
    dtc date default current_timestamp, 
    usm varchar(35), 
    dtm date default current_timestamp,
    constraint fk_kat_usc foreign key(usc) references instruktor(username),
    constraint fk_kat_usm foreign key(usm) references instruktor(username),
    constraint check_kat_min_god check (min_god > 0)
);


create table auto_skola_3.grupa (
    id int auto_increment primary key, 
    naziv text not null, 
    dtpoc date, 
    usc varchar(35), 
    dtc date default current_timestamp, 
    usm varchar(35), 
    dtm date default current_timestamp, 
    id_instr int, 
    id_kategor int,
    constraint fk_grupa_usc foreign key(usc) references instruktor(username),
    constraint fk_grupa_usm foreign key(usm) references instruktor(username),
    constraint fk_gr_inst foreign key(id_instr) references instruktor(id),
    constraint fk_gr_kateg foreign key(id_kategor) references kategorija(id)    
);

create table auto_skola_3.polaznici (
    id_grupa int, 
    id_ucenik int, 
    usc varchar(35), 
    dtc date default current_timestamp,
    constraint pk_polaznici primary key (id_grupa, id_ucenik),
    constraint fk_polaznici_usc foreign key(usc) references instruktor(username),
    constraint fk_polaz_grupa foreign key(id_grupa) references grupa(id),
    constraint fk_polaz_ucenik foreign key(id_ucenik) references ucenik(id)
);

create table auto_skola_3.prakticniCas (
    rbr int,
    id_instr int, 
    id_ucenik int, 
    naziv text, 
    odrzan date, 
    usc varchar(35),
    dtc date default current_timestamp,
    constraint pk_prakticniCas primary key (rbr, id_instr, id_ucenik),
    constraint fk_prakCas_usc foreign key(usc) references instruktor(username),
    constraint fk_prakCas_instr foreign key(id_instr) references instruktor(id),
    constraint fk_prakCas_ucenik foreign key(id_ucenik) references ucenik(id)
);

CREATE TABLE auto_skola_3.teorijskicas (
    id_instr int(11),
    id_grupa int(11),
    odrzan timestamp,
    rbr_teor_cas int(11) NOT NULL UNIQUE AUTO_INCREMENT,
    tema text DEFAULT NULL,
    usc varchar(35) DEFAULT NULL,
    dtc date DEFAULT current_timestamp ,
    usm varchar(35) DEFAULT NULL,
    dtm date DEFAULT current_timestamp ,
    CONSTRAINT teorijskiCas_pk PRIMARY KEY (id_grupa, id_instr, odrzan),
    CONSTRAINT fk_teorCas_grupa FOREIGN KEY (id_grupa) REFERENCES grupa (id),
    CONSTRAINT fk_teorCas_instruktor FOREIGN KEY (id_instr) REFERENCES instruktor (id),
    CONSTRAINT fk_teorCas_usc FOREIGN KEY (usc) REFERENCES instruktor (username),
    CONSTRAINT fk_teorCas_usm FOREIGN KEY (usm) REFERENCES instruktor (username)
);

create table auto_skola_3.odslusaniCas (
    rbr_teor_cas int,
    id_ucenik int,
    usc varchar(35), 
    dtc date default current_timestamp,
    constraint pk_odslusaniCas primary key (rbr_teor_cas, id_ucenik),
    constraint fk_odslusCas_teorCas foreign key(rbr_teor_cas) references teorijskiCas(rbr_teor_cas),
    constraint fk_odslusCas_ucenik foreign key(id_ucenik) references ucenik(id)
);


-- insert into auto_skola_3.instruktor (id,ime,prezime,email,jmbg,telefon,datrodj,username,pass,plata,datzap,usc,dtc,usm,dtm)
-- values()
-- on duplicate key update



-- select current_timestamp() ;
-- 
-- 
-- insert into auto_skola_2.test(id, val)
-- values (null, 'x')
-- 
-- select * from auto_skola_2.test;    

-- 
-- select  rbr,
--         id_instr,
--         (select ime||' '||prezime from instruktor i where i.id = id_instr) instr_dsc,
--         id_ucenik,
--         (select ime||' '||prezime from ucenik u where u.id = id_ucenik) ucenik_dsc,
--         naziv,
--         odrzan,
--         usc,
--         dtc,
--         ' ',
--         auto_skola_3.prakticniCas.*
-- from    auto_skola_3.prakticniCas;









