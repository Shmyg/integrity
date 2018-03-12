DEFINE owner=ks
CREATE	TABLE &&owner..mig_billing_term_name
	(
	new_term_name	VARCHAR2(500),
	old_term_name	VARCHAR2(500)
	)
/
CREATE	TABLE &&owner..mig_service
	(
	new_id	NUMBER NOT NULL,
	old_id	NUMBER NOT NULL,
	type_id	NUMBER NOT NULL
	)
/
COMMENT ON COLUMN &&owner..mig_service.type_id is 'Feature type, 1 - feature, 2 - rateplan'
/
CREATE	TABLE &&owner..mig_handler_service
	(
	new_id	NUMBER NOT NULL,
	old_id	NUMBER NOT NULL
)
/
CREATE	TABLE &&owner..mig_handler_command
	(
	new_id	NUMBER NOT NULL,
	old_id	NUMBER NOT NULL
)
/
CREATE	TABLE &&owner..mig_handler
	(
	new_id	NUMBER NOT NULL,
	old_id	NUMBER NOT NULL
)
/
CREATE	TABLE &&owner..mig_source
	(
	new_id	NUMBER NOT NULL,
	old_id	NUMBER NOT NULL
)
/
CREATE	TABLE &&owner..mig_action_parameter
	(
	parameter_no	NUMBER NOT NULL,
	parameter_name	VARCHAR2(1000) NOT NULL,
	parameter_desc	VARCHAR2(1000) NOT NULL
)
/
CREATE	TABLE &&owner..mig_feature_relation
	(
	requested_feature_id	NUMBER NOT NULL,
	dependent_feature_id	NUMBER NOT NULL,
	dependency_type		VARCHAR2(1) NOT NULL
	)
/
