/*
|| Migration sript for CONF_HANDLER_ACTION_MAP table
|| ESB Kyivstar project
|| Author: Serge Shmygelskyy aka Shmyg, mailto: serge@shmygelskyy.name
||
|| $Log: conf_handler_action_map.sql,v $
|| Revision 1.1  2015/06/08 11:40:06  shmyg
|| First complete tested version
||
*/

DEFINE OWNER=ks

INSERT	INTO &&owner..conf_handler_action_map
	(
	action_id,
	handler_cmd_id
	)
(
SELECT	ca.id,
	cf.id
FROM	&&owner..conf_action			ca,
	&&owner..conf_handler_feature_map	ch,
	&&owner..conf_handler_feature		cf
WHERE	ca.feature_id = ch.feature_id
AND	ch.handler_ftr_id = cf.id
)	
/
