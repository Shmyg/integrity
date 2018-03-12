/*
|| Migration sript for CONF_HANDLER table
|| ESB Kyivstar project
|| Author: Serge Shmygelskyy aka Shmyg, mailto: serge@shmygelskyy.name
||
|| $Log: conf_handler.sql,v $
|| Revision 1.1.1.1  2015/05/22 06:01:16  shmyg
||
||
|| Revision 1.3  2014/11/18 09:36:45  shmyg
|| *** empty log message ***
||
*/

DEFINE OWNER=ks

INSERT	ALL
INTO	&&owner..conf_handler
VALUES	(
	&&owner..handler_seq.NEXTVAL,
	name,
	1
	)
INTO	&&owner..mig_handler
VALUES	(
	&&owner..handler_seq.CURRVAL,
	id
	)
SELECT	id,
	name
FROM	oms.oms_handlers
/
