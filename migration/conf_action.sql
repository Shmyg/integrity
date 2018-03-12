/*
|| Migration sript for CONF_ACTION table
|| ESB Kyivstar project
|| Author: Serge Shmygelskyy aka Shmyg, mailto: serge@shmygelskyy.name
||
|| $Log: conf_action.sql,v $
|| Revision 1.1  2015/06/08 06:34:43  shmyg
|| Added conf_action and conf_action_parameter tables
||
*/

DEFINE OWNER=ks

INSERT	INTO &&owner..conf_action
	(
	id,
	feature_id,
	action_type_id,
	target_type_id,
	origin_type_id,
	active,
	start_date,
	end_date,
	version_id,
	price
	)
(
SELECT	&&owner..conf_action_seq.NEXTVAL,
	cf.id,
	da.id,
	target_type_id,
	origin_type_id,
	'Y',
	start_date,
	end_date,
	version_id,
	0
FROM	&&owner..conf_feature		cf,
	&&owner..dict_action_type	da
)
/

