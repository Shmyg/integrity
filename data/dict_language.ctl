LOAD	DATA
INFILE	*
INTO	TABLE ks.dict_language
FIELDS	TERMINATED BY ';'
	(
	id	INTEGER EXTERNAL,
	language_name
	)
BEGINDATA
1;English
2;Russian
3;Ukrainian
