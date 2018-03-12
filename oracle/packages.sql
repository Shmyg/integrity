CREATE	OR REPLACE
FUNCTION &&owner..get_current_version_id
RETURN NUMBER
IS
	v_version_id	PLS_INTEGER;
BEGIN
	SELECT	MAX( id )
    	INTO	v_version_id 
	FROM	&&owner..conf_version;

	RETURN	v_version_id;

EXCEPTION
	WHEN NO_DATA_FOUND
	THEN
		RETURN 1;
END;
/

CREATE	OR REPLACE
FUNCTION &&owner..get_handler_feature_id
RETURN	NUMBER
IS
BEGIN
	RETURN	handler_service_seq.NEXTVAL;
END;
/
