/*
|| Migration sript for SOURCE table
|| ESB Kyivstar project
|| Author: Serge Shmygelskyy aka Shmyg, mailto: serge@shmygelskyy.name
||
|| $Log: conf_source.sql,v $
|| Revision 1.1.1.1  2015/05/22 06:01:16  shmyg
||
||
|| Revision 1.2  2014/11/18 09:36:45  shmyg
|| *** empty log message ***
||
*/

DEFINE OWNER=ks

INSERT	ALL
INTO	&&owner..conf_source
VALUES	(
	&&owner..source_seq.NEXTVAL,
	name,
	1
	)
INTO	&&owner..mig_source
VALUES	(
	&&owner..source_seq.CURRVAL,
	id
	)
SELECT	id,
	name
FROM	oms.oms_sources
/
