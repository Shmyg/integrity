LOAD	DATA
INFILE	*
INTO	TABLE ks.dict_order_status
FIELDS	TERMINATED BY ';'
	(
	id	SEQUENCE(1,1),
	status_name,
	status_desc
	)
BEGINDATA
Order Created;Заявка створена на Джерелі. Це стані не потрапляє в ESB
Queued;Заявка передана Джерелом на ESB. Заявці привласнений ID
Accepted;Заявка провалідірована. Визначений тип заявки і flow обробник
Processing;Машина станів "Заявка в обробці." Означає що заявка обробляється відповідним flow. Заявка може бути передана на Обробник
Canceled;Заявка не може бути виконана.
Aborted;Заявка скасована Джерелом
Completed;заявка виконана
Pending;Заявка класифікована як "відкладена".
