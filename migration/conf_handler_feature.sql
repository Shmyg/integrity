/*
|| Migration sript for CONF_HANDLER_FEATURE and CONF_HANDLER_FEATURE_MAP tables
|| ESB Kyivstar project
|| Author: Serge Shmygelskyy aka Shmyg, mailto: serge@shmygelskyy.name
||
|| $Log: conf_handler_feature.sql,v $
|| Revision 1.4  2016/03/16 18:35:57  shmyg
|| *** empty log message ***
||
|| Revision 1.3  2015/05/25 11:19:30  shmyg
|| Added migration scripts for CONF_FEATURE
||
|| Revision 1.2  2015/05/22 07:50:33  shmyg
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
	new_handler_id,
	self_value
	)
INTO	&&owner..conf_handler_feature_map
VALUES	(
	new_feature_id,
	&&owner..handler_service_seq.CURRVAL
	)
INTO	&&owner..mig_handler_service
VALUES
	(
	&&owner..handler_service_seq.CURRVAL,
	old_id
	)
SELECT	id AS old_id,
	mh.new_id AS new_handler_id,
	mg.new_id as new_feature_id,
	self_value,
	description
FROM	oms.oms_incoming_serv	oi,
	oms.oms_incoming_serv_rels	om,
	&&owner..mig_handler		mh,
	&&owner..mig_service		mg
WHERE	oi.handler_id = mh.old_id
AND	oi.id = om.incoming_id
AND	om.oms_serv = mg.old_id
/
	

