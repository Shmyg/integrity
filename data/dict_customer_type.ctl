LOAD	DATA
INFILE	*
INTO	TABLE ks.dict_customer_type
FIELDS	TERMINATED BY ';'
	(
	id	INTEGER EXTERNAL,
	type_name
	)
BEGINDATA
1;Association
2;Account
3;Customer
4;Subscriber
