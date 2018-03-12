/*
|| Migration sript for CONF_HANDLER_ACTION table
|| ESB Kyivstar project
|| Author: Serge Shmygelskyy aka Shmyg, mailto: serge@shmygelskyy.name
||
|| $Log: conf_handler_action.sql,v $
|| Revision 1.2  2015/06/08 11:40:06  shmyg
|| First complete tested version
||
|| Revision 1.1.1.1  2015/05/22 06:01:16  shmyg
||
||
|| Revision 1.3  2014/11/18 09:36:45  shmyg
|| *** empty log message ***
||
*/

DEFINE OWNER=ks

INSERT	ALL
INTO &&owner..conf_handler_action
VALUES
	(
	&&owner..handler_command_seq.NEXTVAL,
	new_id,
	self_value,
	description
	)
INTO	&&owner..mig_handler_command
VALUES
	(
	&&owner..handler_command_seq.CURRVAL,
	old_id
	)
SELECT	id AS old_id,
	mh.new_id,
	self_value,
	description
FROM	oms.oms_incoming_cmd	oi,
	ks.mig_handler		mh
WHERE	oi.handler_id = mh.old_id
/
