LOAD	DATA
INFILE	*
INTO	TABLE ks.conf_lock
FIELDS	TERMINATED BY ';'
	(
	id	SEQUENCE(1,1),
	lock_type_name,
	target_type_id,
	origin_type_id
	)
BEGINDATA
RESOURCE_3;1;1
RESOURCE_1;1;1
RESOURCE_4;1;1
RESOURCE_7;1;1
RESOURCE_6;1;1
RESOURCE_8;1;1
RESOURCE_5;1;1
RESOURCE_2;1;1
POSTPONED;1;1
WHC_NFM_NFAM;1;1
SERVICE;1;1
RESOURCE_3;4;4
RESOURCE_1;4;4
RESOURCE_4;4;4
RESOURCE_7;4;4
RESOURCE_6;4;4
RESOURCE_8;4;4
RESOURCE_5;4;4
RESOURCE_2;4;4
POSTPONED;4;4
WHC_NFM_NFAM;4;4
SERVICE;4;4
