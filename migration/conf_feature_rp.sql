/*
|| Migration sript for CONF_FEATURE table - rateplans, OMS.SC_RATE_PLAN table
|| ESB Kyivstar project
|| Author: Serge Shmygelskyy aka Shmyg, mailto: serge@shmygelskyy.name
||
|| $Log: conf_feature_rp.sql,v $
|| Revision 1.3  2015/06/08 11:40:06  shmyg
|| First complete tested version
||
|| Revision 1.2  2015/05/25 11:19:30  shmyg
|| Added migration scripts for CONF_FEATURE
||
|| Revision 1.1  2015/05/22 07:50:33  shmyg
|| Added and tested some new migration scripts
||
|| Revision 1.1.1.1  2015/05/22 06:01:16  shmyg
||
||
|| Revision 1.3  2014/11/19 08:45:08  shmyg
|| Added migraiton for service from feature
||
|| Revision 1.2  2014/11/18 10:58:11  shmyg
|| Initial version for migration of services
||
|| Revision 1.1  2014/11/18 09:36:45  shmyg
|| *** empty log message ***
||
*/

DEFINE OWNER=ks

INSERT	ALL
INTO	&&owner..conf_feature
VALUES	(
	&&owner..service_seq.NEXTVAL,	-- ID
	2,			-- feature_type_id 
	1,			-- target_type_id
	1,			-- origin_type_id
	1,			-- activation_term_id, looks like it's not applicable here
	1,			-- billing_term_id, for now just default value
	1,			-- version_id
	date_from,		-- start_date
	date_to,		-- end_date
	'X'			-- curr_version
	)
INTO	&&owner..mig_service
VALUES	(
	&&owner..service_seq.CURRVAL,
	rp_id,
	2
	)
SELECT	rp_id,
	MIN( date_from ) AS date_from,
	MAX( date_to ) AS date_to
FROM	oms.sc_feature2rate_plan
GROUP	BY rp_id
/
