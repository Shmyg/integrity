LOAD	DATA
INFILE	*
INTO	TABLE ks.dict_feature_type
FIELDS	TERMINATED BY ';'
	(
	id	INTEGER EXTERNAL,
	type_name
	)
BEGINDATA
1;Feature
2;Rateplan
