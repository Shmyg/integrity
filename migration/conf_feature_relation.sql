/*
|| Migration sript for CONF_FEATURE_RELATION table
|| ESB Kyivstar project
|| Author: Serge Shmygelskyy aka Shmyg, mailto: serge@shmygelskyy.name
||
|| $Log: conf_feature_relation.sql,v $
|| Revision 1.1  2015/06/08 11:40:06  shmyg
|| First complete tested version
||
||
*/

DEFINE OWNER=ks

INSERT	INTO &&owner..conf_feature_relation
	(
	id,
	requested_feature_id,
	dependent_feature_id,
	dependency_type,
	version_id,
	is_active
	)
(
SELECT	&&owner..conf_feature_relation_seq.NEXTVAL,
	ms1.new_id,
	ms2.new_id,
	dependency_type,
	1,
	'Y'
FROM	&&owner..mig_feature_relation	mf,
	&&owner..mig_service		ms1,
	&&owner..mig_service		ms2
WHERE	mf.requested_feature_id = ms1.old_id
AND	mf.dependent_feature_id = ms2.old_id
AND	ms1.type_id = 1
AND	ms2.type_id = 1
)
/

