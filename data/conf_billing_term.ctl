LOAD	DATA
INFILE	*
INTO	TABLE ks.conf_billing_term
FIELDS	TERMINATED BY ';'
	(
	id		INTEGER EXTERNAL,
	term_des,
	version_id	INTEGER EXTERNAL
	)
BEGINDATA
1;Default billing term;1
