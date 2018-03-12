alter table oms.sc_feature2actions modify ACTION_NAME_RU varchar2(300);
alter table oms.sc_feature2actions modify ACTION_NAME_UA varchar2(150);
alter table oms.sc_feature2actions modify ACTION_NAME_EN varchar2(150);
alter table oms.SC_FEATURE2RATE_PLAN modify F_URL_RU varchar2(2000);
alter table oms.SC_FEATURE2RATE_PLAN modify F_URL_UA varchar2(2000);
alter table oms.SC_FEATURE2RATE_PLAN modify F_URL_EN varchar2(2000);
alter table oms.sc_feature modify F_NAME_EN varchar2(300);
alter table oms.sc_feature modify F_NAME_RU varchar2(300);
alter table oms.sc_feature modify F_NAME_UA varchar2(300);
alter table oms.sc_feature modify RPA_MSG_EN varchar2(900);
alter table oms.sc_feature modify RPA_MSG_RU varchar2(900);
alter table oms.sc_feature modify RPA_MSG_UA varchar2(900);

