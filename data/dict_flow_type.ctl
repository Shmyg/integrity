LOAD	DATA
INFILE	*
INTO	TABLE ks.dict_flow_type
FIELDS	TERMINATED BY ';'
	(
	id	INTEGER EXTERNAL,
	flow_type_name
	)
BEGINDATA
1;CustomerInfo
2;Status
3;Precheck
4;PrecheckList
5;Submit
6;SubmitList
