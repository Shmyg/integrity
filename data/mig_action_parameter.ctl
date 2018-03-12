LOAD	DATA
INFILE	*
INTO	TABLE ks.mig_action_parameter
FIELDS	TERMINATED BY ';'
OPTIONALLY ENCLOSED BY "'"
	(
	parameter_no	SEQUENCE(1,1),
	parameter_name,
	parameter_desc
	)
BEGINDATA
RP_ID;'Идентификатор тарифного плана (null - для всех)';
F_SETUP_FEE;'Абонентская плата по услуге с привязкой к тарифному плану';
F_SETUP_UNIT_FEE;'Еденицы измерения абонентской платы';
F_PERIOD_FEE_EN;'Период, за который снимается абонентская плата EN';
F_PERIOD_FEE_RU;'Период, за который снимается абонентская плата RU';
F_PERIOD_FEE_UA;'Период, за который снимается абонентская плата UA';
BASIC_PRICE;'Базовая стоимость заказа';
PRICE_ID;'Признак наличия спец. цены';
UNIT_ID;'Еденицы измерения стоимости заказа';
S_COMMENT_UA;'локализованные значения доп.контента';
S_COMMENT_RU;'локализованные значения доп.контента';
S_COMMENT_EN;'локализованные значения доп.контента';
