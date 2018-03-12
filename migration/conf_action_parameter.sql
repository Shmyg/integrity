/*
|| Migration sript for CONF_ACTION_PARAMETER table
|| ESB Kyivstar project
|| Author: Serge Shmygelskyy aka Shmyg, mailto: serge@shmygelskyy.name
||
|| $Log: conf_action_parameter.sql,v $
|| Revision 1.1  2015/06/08 06:34:43  shmyg
|| Added conf_action and conf_action_parameter tables
||
*/

DEFINE OWNER=ks

INSERT	INTO &&owner..conf_action_parameter
	(
	action_type_id,
	parameter_name,
	parameter_no,
	parameter_desc,
	version_id
	)
(
SELECT	id,
	parameter_name,
	parameter_no,
	parameter_desc,
	1
FROM	&&owner..dict_action_type,
	&&owner..mig_action_parameter
)
/	
