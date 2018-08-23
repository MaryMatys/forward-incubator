REM   Script: draft_02
REM   lec2

select d.V_NAME,SUM(contr.F_SUM),COUNT(contr.F_SUM),COUNT(contr.ID_CONTRACT_INST)from fw_departments d 
LEFT JOIN  
(select e.F_SUM,c.ID_DEPARTMENT,c.ID_CONTRACT_INST from fw_contracts c  
LEFT JOIN trans_external e 
ON e.ID_CONTRACT=c.ID_CONTRACT_INST 
AND e.DT_EVENT>current_timestamp-interval'6'month 
--хотела так: AND e.DT_EVET>max(tr.DT_EVENT)-interval'1'month; - не получилось 
AND e.V_STATUS='A' 
WHERE c.DT_START<=current_timestamp 
AND c.DT_STOP>current_timestamp) contr  
ON contr.ID_DEPARTMENT=d.ID_DEPARTMENT 
WHERE d.B_DELETED=0 
GROUP BY d.V_NAME;

select c.V_EXT_IDENT,c.V_STATUS,count(1)from fw_contracts c 
WHERE  3<(select COUNT(1) from trans_external e 
WHERE e.ID_CONTRACT=c.ID_CONTRACT_INST 
AND e.DT_EVENT>=to_date('2017-01-01','yyyy-mm-dd') 
AND e.DT_EVENT<to_date('2018-01-01','yyyy-mm-dd') 
AND e.V_STATUS='A') 
GROUP BY c.V_EXT_IDENT,c.V_STATUS;

select d.V_NAME from fw_departments d  
where d.B_DELETED=0  
AND d.id_department NOT IN (select c.id_department from fw_contracts c )  
GROUP BY d.V_NAME;

SELECT count(1),MAX(e.DT_EVENT),c.V_EXT_IDENT,u.V_USERNAME FROM TRANS_EXTERNAL e 
left JOIN CI_USERS u 
ON U.ID_USER=E.ID_SOURCE 
left JOIN FW_CONTRACTS c 
ON c.ID_CONTRACT_INST=e.ID_CONTRACT 
AND c.DT_START<=current_timestamp 
AND c.DT_STOP>current_timestamp 
AND c.V_STATUS='A' 
group by c.V_EXT_IDENT,u.V_USERNAME ;

