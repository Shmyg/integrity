LOAD	DATA
INFILE	*
INTO	TABLE ks.dict_subscriber_segment
FIELDS	TERMINATED BY ';'
	(
	id	INTEGER EXTERNAL,
	segment_name
	)
BEGINDATA
1;MMPP - Mass Market Prepaid
2;MMC - Mass Market Contract
3;LA - Large Account
4;SME - Small-Medium Enterprise
