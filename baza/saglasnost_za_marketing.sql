CREATE OR REPLACE PACKAGE LV1.P_WX_CCM001M003PF1 is
    PROCEDURE when_new_form_instance(json_apollo_obj in out json_apollo);
end;



CREATE OR REPLACE PACKAGE BODY LV1.P_WX_CCM001M003PF1 is 
    PROCEDURE when_new_form_instance(json_apollo_obj in out json_apollo) is
        p_prtn varchar2(32);
        p_prtn_dsc varchar2(256);
    begin
        p_prtn :=  json_apollo_obj.get_param_tx('p_prtn');
        p_prtn_dsc :=  json_apollo_obj.get_param_tx('p_prtn_dsc');
    
        json_apollo_obj.set_value('prtn', p_prtn,'wx_ccm001m003p1');
        json_apollo_obj.set_value('prtn_dsc', p_prtn_dsc, 'wx_ccm001m003p1');
    
        for r in (
            select  code, p1
            from    ccm025
            where   prtn = p_prtn
                and code in ('SAGL_MARK_DIR', 'SAGL_MARK_EL')
        ) loop
            json_apollo_obj.set_value(r.code, r.p1, 'wx_ccm001m003p1');
        end loop;
    
    end;
end;


CREATE OR REPLACE PACKAGE LV1.P_WX_CCM001M003P1 is

    procedure insert_data(json_apollo_obj in out json_apollo);
    procedure update_data(json_apollo_obj in out json_apollo);
    procedure delete_data(json_apollo_obj in out json_apollo);
    procedure post_change(json_apollo_obj in out json_apollo, field varchar2);
    procedure button_ok(json_apollo_obj in out json_apollo);
    procedure button_cancel(json_apollo_obj in out json_apollo);

end;


CREATE OR REPLACE PACKAGE BODY LV1.P_WX_CCM001M003P1 is 

    procedure insert_data(json_apollo_obj in out json_apollo) is 
    begin
        null;
    end;

    procedure update_data(json_apollo_obj in out json_apollo) is 
    begin
        null;
    end;

    procedure delete_data(json_apollo_obj in out json_apollo) is 
    begin
        null;
    end;

    procedure post_change(json_apollo_obj in out json_apollo, field varchar2) is
    begin
        null;
    end;

    procedure button_ok(json_apollo_obj in out json_apollo) is
    begin
        p_wx_icl005m002p1.check_saglasnost(json_apollo_obj, 'wx_ccm001m003p1');
--        json_apollo_obj.close_current_dialog();
    end; 

    procedure button_cancel(json_apollo_obj in out json_apollo) is
    begin
        json_apollo_obj.close_current_dialog();
    end;

end;


select DMS_UTIL.GET_SLC_MIGRATION_SCRIPT('LV1', 'ORACLE', 'wx_ccm001m003p%')  from dual;

select  code, p1
from    ccm025
where   prtn = '660019'
    and code in ('SAGL_MARK_DIR', 'SAGL_MARK_EL')


    
    
    
    
    

MERGE INTO slc001 D USING (
                    WITH slc_data (
                        DUMMY,FRM,CODE1,CODE2,VER,LANG,NUM,FIELD,US,DT,VATTRIB,VALUE,WIDTH,HEIGHT,X,Y,"SQL",TP,TTIP,HINT,
                        ATTRIB,"DOMAIN",LOV,DATATYPE,MAX_LENGTH,ITEM_TYPE,LOV1
                    ) as ( 
        SELECT 1, nullif('wx_ccm001m003p1', '' ), nullif('!', '' ), nullif('!', '' ), nullif('FIX', '' ), nullif('SER', '' ), 1, nullif('PRTN_DSC', '' ), nullif('LV1', '' ), localtimestamp, nullif('', '' ), nullif('Naziv:', '' ), nullif('150', '' ), nullif('', '' ), nullif('1', '' ), nullif('2', '' ), nullif('', '' ), nullif('ITEM', '' ), nullif('Naziv', '' ), nullif('Naziv', '' ), nullif('D', '' ), nullif('', '' ), nullif('', '' ), nullif('CHAR', '' ), 256, nullif('TEXT ITEM', '' ), nullif('', '' ) FROM dual  UNION ALL
        SELECT 1, nullif('wx_ccm001m003p1', '' ), nullif('!', '' ), nullif('!', '' ), nullif('FIX', '' ), nullif('SER', '' ), 1, nullif('CANCEL', '' ), nullif('LV1', '' ), localtimestamp, nullif('', '' ), nullif('Otkaži', '' ), nullif('80', '' ), nullif('', '' ), nullif('90', '' ), nullif('5', '' ), nullif('', '' ), nullif('BUTTON', '' ), nullif('Otkaži', '' ), nullif('Otkaži', '' ), nullif('DEN', '' ), nullif('', '' ), nullif('', '' ), nullif('', '' ), cast(null as numeric), nullif('', '' ), nullif('', '' ) FROM dual  UNION ALL
        SELECT 1, nullif('wx_ccm001m003p1', '' ), nullif('!', '' ), nullif('!', '' ), nullif('LOVCEN1', '' ), nullif('SER', '' ), 1, nullif('SAGL_MARK_DIR', '' ), nullif('LV1', '' ), localtimestamp, nullif('', '' ), nullif('Saglasnost za direktni marketing', '' ), nullif('100', '' ), nullif('', '' ), nullif('1', '' ), nullif('3', '' ), nullif('', '' ), nullif('CHECK', '' ), nullif('Saglasnost za direktni marketing <b>wx_icl005m002p1.STAT39</b>', '' ), nullif('Saglasnost za direktni marketing <b>wx_icl005m002p1.STAT39</b>', '' ), nullif('DENUQISC', '' ), nullif('', '' ), nullif('{"checked":"YES","unchecked":"NO"}', '' ), nullif('CHAR', '' ), 256, nullif('CHECKBOX', '' ), nullif('', '' ) FROM dual  UNION ALL
        SELECT 1, nullif('wx_ccm001m003p1', '' ), nullif('!', '' ), nullif('!', '' ), nullif('FIX', '' ), nullif('SER', '' ), 1, nullif('OK', '' ), nullif('LV1', '' ), localtimestamp, nullif('', '' ), nullif('Potvrdi izmene', '' ), nullif('80', '' ), nullif('', '' ), nullif('1', '' ), nullif('5', '' ), nullif('', '' ), nullif('BUTTON', '' ), nullif('Potvrdi izmene', '' ), nullif('Potvrdi izmene', '' ), nullif('DEN', '' ), nullif('', '' ), nullif('', '' ), nullif('', '' ), cast(null as numeric), nullif('', '' ), nullif('', '' ) FROM dual  UNION ALL
        SELECT 1, nullif('wx_ccm001m003p1', '' ), nullif('!', '' ), nullif('!', '' ), nullif('LOVCEN1', '' ), nullif('SER', '' ), 1, nullif('SAGL_MARK_EL', '' ), nullif('LV1', '' ), localtimestamp, nullif('', '' ), nullif('Saglasnost za obavještenja u elektr. obliku', '' ), nullif('100', '' ), nullif('', '' ), nullif('1', '' ), nullif('4', '' ), nullif('', '' ), nullif('CHECK', '' ), nullif('Saglasnost za prihvat obavještenja i računa u elektronskom obliku <b>wx_icl005m002p1.STAT39</b>', '' ), nullif('Saglasnost za prihvat obavještenja i računa u elektronskom obliku <b>wx_icl005m002p1.STAT39</b>', '' ), nullif('DENUQISC', '' ), nullif('', '' ), nullif('{"checked":"YES","unchecked":"NO"}', '' ), nullif('CHAR', '' ), 256, nullif('CHECKBOX', '' ), nullif('', '' ) FROM dual  UNION ALL
        SELECT 1, nullif('wx_ccm001m003p1', '' ), nullif('!', '' ), nullif('!', '' ), nullif('FIX', '' ), nullif('SER', '' ), 1, nullif('PRTN', '' ), nullif('LV1', '' ), localtimestamp, nullif('', '' ), nullif('Partner:', '' ), nullif('150', '' ), nullif('', '' ), nullif('1', '' ), nullif('1', '' ), nullif('', '' ), nullif('ITEM', '' ), nullif('Partner', '' ), nullif('Partner', '' ), nullif('D', '' ), nullif('', '' ), nullif('', '' ), nullif('CHAR', '' ), 256, nullif('TEXT ITEM', '' ), nullif('', '' ) FROM dual  UNION ALL
        SELECT 1, nullif('wx_ccm001m003pf1', '' ), nullif('!', '' ), nullif('!', '' ), nullif('LOVCEN', '' ), nullif('SER', '' ), 1, nullif('WX_CCM001M003P1', '' ), nullif('LV1', '' ), localtimestamp, nullif('', '' ), nullif('', '' ), nullif('', '' ), nullif('190', '' ), nullif('1', '' ), nullif('1', '' ), nullif('', '' ), nullif('TAB', '' ), nullif('', '' ), nullif('', '' ), nullif('DE', '' ), nullif('MASTER', '' ), nullif('', '' ), nullif('', '' ), cast(null as numeric), nullif('FORM', '' ), nullif('', '' ) FROM dual 
        ) select * from slc_data ) S 
                        on (
                            S.FRM = D.FRM AND
                            S.CODE1  = D.CODE1 AND
                            S.CODE2  = D.CODE2 AND
                            S.FIELD  = D.FIELD AND
                            S.NUM  = D.NUM AND
                            S.LANG  = D.LANG AND
                            S.VER  = D.VER )
                        when matched then update set
                            D.US = S.US,
                            D.VALUE = S.VALUE,
                            D.WIDTH = S.WIDTH,
                            D.HEIGHT = S.HEIGHT,
                            D.X = S.X,
                            D.Y = S.Y,
                            D."SQL" = S."SQL",
                            D.TP = S.TP,
                            D.TTIP = S.TTIP,
                            D.HINT = S.HINT,
                            D.ATTRIB = S.ATTRIB,
                            D."DOMAIN" = S."DOMAIN",
                            D.LOV = S.LOV,
                            D.LOV1 = S.LOV1,
                            D.DATATYPE = S.DATATYPE,
                            D.MAX_LENGTH = S.MAX_LENGTH,
                            D.ITEM_TYPE = S.ITEM_TYPE,
                            D.DT = S.DT
                        when not matched then insert
                            (FRM,CODE1,CODE2,VER,LANG,NUM,FIELD,US,DT,VATTRIB,VALUE,WIDTH,HEIGHT,X,Y,"SQL",TP,TTIP,HINT,
                            ATTRIB,"DOMAIN",LOV,DATATYPE,MAX_LENGTH,ITEM_TYPE,LOV1)
                        values
                            (S.FRM,S.CODE1,S.CODE2,S.VER,S.LANG,S.NUM,S.FIELD,S.US,S.DT,S.VATTRIB,S.VALUE,S.WIDTH,S.HEIGHT,S.X,S.Y,S."SQL",S.TP,S.TTIP,S.HINT,
                            S.ATTRIB,S."DOMAIN",S.LOV,S.DATATYPE,S.MAX_LENGTH,S.ITEM_TYPE,S.LOV1);
/




select * from all_source where lower(text) like '%question%' and owner = 'LV1';

select dsc1,dsc2, addr from ccm001 
where prtn = '1781730'

select * from ccm025 where prtn = '660019';


select  * --count(*)
from    ccm025 
where   prtn = '660019'
    and code in ('SAGL_MARK_EL', 'SAGL_MARK_DIR')

select case when null > 0 then 'null veci od nule' else '???' end from dual



select  * 
from    ccm025
where   lower(code) like '%mark%'

;

select * from icl001 where prtn = '215723';

declare
v_prtn varchar2(32);
begin
    begin
        select  prtn 
        into    v_prtn
        from    ICL001 i 
        where   calc = null;
    exception
        when no_data_found then
    end;
end;





select * from all_source where lower(text) like '%set_trigger_before_rep_start%' and owner = 'LV1';


select * 
from CRP001_DELETED cd 
where rep = 'CCM001M001'
order by DTC desc nulls last;

