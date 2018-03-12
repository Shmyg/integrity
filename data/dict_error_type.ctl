LOAD	DATA
INFILE	*
INTO	TABLE ks.dict_error_type
FIELDS	TERMINATED BY ';'
	(
	id	INTEGER EXTERNAL,
	type_name
	)
BEGINDATA
1;Warning
2;Fatal
3;Info
