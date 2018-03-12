/*
|| Migration sript for CONF_HANDLER_FEATURE table
|| ESB Kyivstar project
|| Author: Serge Shmygelskyy aka Shmyg, mailto: serge@shmygelskyy.name
||
|| $Log: conf_handler_feature_map.sql,v $
|| Revision 1.1  2015/05/22 07:50:33  shmyg
|| Added and tested some new migration scripts
||
|| Revision 1.1.1.1  2015/05/22 06:01:16  shmyg
||
||
|| Revision 1.2  2014/11/18 09:36:45  shmyg
|| *** empty log message ***
||
*/

DEFINE OWNER=ks

INSERT	ALL
INTO &&owner..conf_handler_feature
VALUES
	(
	&&owner..handler_service_seq.NEXTVAL,
	new_id,
	self_value
	)
INTO	&&owner..mig_handler_service
VALUES
	(
	&&owner..handler_service_seq.CURRVAL,
	old_id
	)
SELECT	id AS old_id,
	mh.new_id,
	self_value,
	description
FROM	oms.oms_incoming_serv	oi,
	ks.mig_handler		mh
WHERE	oi.handler_id = mh.old_id
/
	

