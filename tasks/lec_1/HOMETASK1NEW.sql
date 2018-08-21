REM   Script: Hometask1NEW
REM   MATYSKINA

select  count(1)from fw_process_log pr 
WHERE pr.N_STATUS='500';

select   to_char(MAX(pr.DT_TIMESTAMP),'dd.mon.yyyy') from fw_process_log pr 
WHERE pr.N_STATUS='500';

select ltrim(pr.V_MESSAGE,'Загрузка порции заказов начиная с') from fw_process_log pr 
WHERE  pr.N_ACTION='12';

select count(distinct(pr.V_MESSAGE)) from fw_process_log pr 
WHERE  pr.N_ACTION='12';

select SUM(substr(pr.V_MESSAGE,140)) from fw_process_log pr 
WHERE pr.N_ACTION='11';

select count(1) from fw_process_log pr  
WHERE pr.N_ACTION='11'   
AND pr.DT_TIMESTAMP>='2018-03-01'  
AND pr.DT_TIMESTAMP<'2018-04-01';

select count(*) from (select pr.sid, count(*)from fw_process_log pr 
group by pr.sid 
having count(*)>1);

select MAX(pr.DT_TIMESTAMP), pr.OS_USERNAME from fw_process_log pr  
WHERE pr.ID_USER='11136' 
GROUP BY pr.OS_USERNAME;

select to_char(pr.DT_TIMESTAMP,'month'),count(pr.ID_LOG) from fw_process_log pr 
group by to_char(pr.DT_TIMESTAMP,'month');

select count(1) ,count(DISTINCT(pr.V_MESSAGE))from fw_process_log pr 
WHERE pr.N_STATUS='500' 
AND pr.ID_PROCESS='5' 
AND pr.DT_TIMESTAMP>'2018-02-22' 
AND pr.DT_TIMESTAMP<‘2018-03-02’;

select min(tr.N_SUM) from fw_transfers tr 
WHERE tr.DT_INCOMING>'2017-02-14:10:00' 
AND tr.DT_INCOMING<'2017-02-14:14:00'  
AND tr.ID_CONTRACT_FROM!=tr.ID_CONTRACT_TO;

select tr.ID_CONTRACT_TO,tr.DT_REAL, length(tr.V_DESCRIPTION)-20 from fw_transfers tr 
WHERE length(tr.V_DESCRIPTION)>20 
ORDER BY length(tr.V_DESCRIPTION)-20 DESC;

select to_char(tr.DT_INCOMING,'dd.mm.yyyy'),count(1) from fw_transfers tr 
WHERE tr.ID_CONTRACT_FROM=tr.ID_CONTRACT_TO 
GROUP BY to_char(tr.DT_INCOMING,'dd.mm.yyyy') ;

