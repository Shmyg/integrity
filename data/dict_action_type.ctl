LOAD	DATA
INFILE	*
INTO	TABLE ks.dict_action_type
FIELDS	TERMINATED BY ';'
	(
	id	SEQUENCE(1,1),	
	action_name,
	action_desc
	)
BEGINDATA
Activate;Подключить Feature
Deactivate;Отключить Feature
Modify;Изменить Feature (для кастомных екшенов)
Reactivate;Переподключить Feature
Suspend;Приостановить Feature
Resume;Возобновить Feature
Prolong ;Продление действия услуги 
Extra order;Внеочередной заказ начисления
Add (subEntity);Добавить вложенную сущность (Number, Country)
Remove (subEntity);Удалить вложенную сущность
Remove all;Удалить все вложенные сущности
Change (subEntity1, subEntity2);Заменить вложенную сущность
Reject offer;Отказ от предложения
GetInfo;Получить информацию
Create group;Создание группы
Delete group;Удаление группы
Add group member;Добавление пользователя в группу
Remove group member;Удаление пользователя из группы
Join group;Присоединение юзера к группе
Leave group;Выход из группы
Change group owner;Смена администратора группы
