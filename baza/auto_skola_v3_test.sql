select * from auto_skola_3.instruktor i ;


insert into auto_skola_3.instruktor (
    id,
    ime,
    prezime,
    email,
    jmbg,
    telefon,
    datrodj,
    username,
    pass,
    plata,
    datzap,
    usc,
    dtc,
    usm,
    dtm)
values(
    1,
    'aca',
    'janko',
    'aca_janko@email.com',
    '123',
    '+381 64/123-123',
    current_timestamp,
    'aca_janko',
    '1',
    555,
    null,
    '',
    null,
    null,
    null
);


select * from ucenik u ;

select * from auto_skola_3.kategorija;
select * from instruktor i ;


INSERT INTO KATEGORIJA(id,naziv, min_god, usc)
values(10,'Test insert', 22, 'aca_janko')

select now();

INSERT INTO INSTRUKTOR
(id, ime, prezime, email, jmbg, telefon, datrodj, usc, dtc, usm, dtm, username, pass, plata, datzap)
values
(null, 'test insert', 'test insert', 'email111111.cccom', '224000000000000', '0431234', '3595-10-10', null, null, null, null, 'test_us343434er00000', 'a', null, null)


select * from kategorija;

select * from grupa;


SELECT id_instruktor, id_grupa, odrzan, rbr_teor_cas, tema, usc, dtc, usm, dtm
FROM TEORIJSKICAS
WHERE 1=1 
 and id_instruktor = 1
 and id_grupa = 1
--  and odrzan = '2002-02-02 09:45:00.0'



select now()

select   



