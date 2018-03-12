LOAD	DATA
INFILE	*
INTO	TABLE ks.dict_request_type
FIELDS	TERMINATED BY ';'
	(
	id,
	request_type_name
	)
BEGINDATA
1;GeneralInfo
2;ExtendedInfo
3;AccountInfo
4;SubscriptionInfo
5;BillingInfo
6;subEntities (only Identities)
7;subEntities (Hierarchy)
8;Статус
9;Статус + BillingTerm
10;Статус + Details
11;Статус + BillingTerm + Details
12;Статус + CanOrder
15;З поверненням додаткової інформації
16;Без повернення додаткової інформації
17;Всі доступні команди з поверненням додаткової інформації
18;Всі доступні команди без повернення додаткової інформації
