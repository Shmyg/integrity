LOAD	DATA
INFILE	*
INTO	TABLE ks.dict_operation
FIELDS	TERMINATED BY ';'
	(
	id	INTEGER EXTERNAL,
	interface_name
	)
BEGINDATA
1;getFeature
2;getFeatureList
3;prechekOrder
4;precheckOrderList
5;submitOrder
6;submitOrderList
7;getOrder
8;getOrderList
9;cancelOrder
10;captureOrders
11;updateOrders
12;getConfig
13;updateConfig
14;storeMapping
15;retrieveMapping
16;getBillingConfig
17;updateBillingConfig
18;updateLocks
19;getLocks
20;getCustomerInfo
