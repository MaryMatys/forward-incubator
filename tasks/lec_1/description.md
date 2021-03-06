﻿# Описание таблиц

### fw_identifiers - Справочник идентификаторов
| Столбец | Описание |
| --- | --- |
| ID_IDENTIFIER | Уникальный код идентификатора |
| V_IDENTIFIER_TYPE | Наименование типа идентификатора |
| V_VALUE | Значение идентификатора (например, телефонный номер или IP адрес)|
| V_STATUS | Статус идентификатора: <br>- W - в режиме ожидания;<br>- N - новый;<br>- U - используется;<br>- R - зарезервирован; |
| B_DELETED | Признак удалённости |
| V_EXT_IDENT | Внешний идентификатор |

### fw_process_log - Аудит процессов системы
| Столбец | Описание |
| --- | --- |
|ID_LOG|Уникальный код записи в логе|
|ID_PROCESS|Код процесса, к которому относится запись в логе.|
|N_STATUS|Код статуса сообщения: 100 - сообщение; 200 - предупреждение; 500 - ошибка|
|N_ACTION|Action (т.е. действие), выполняемое в этом сообщении. Каждый процесс определяет свой список Action-ов|
|DT_TIMESTAMP|Дата и время вставки сообщения (с миллисекундной точностью)|
|V_MESSAGE|Сообщение в логе.|
|OS_USERNAME|Имя пользователя ОС|
|USERHOST|Хост|
|SID|Идентификатор сессии|
|ID_USER|Код пользователя|
|ID_ERROR_CODE|Код ошибки (ORA)|
|B_PROCESSED|Признак обработки записи|

### fw_transfers - Денежные переводы
| Столбец | Описание |
| --- | --- |
|ID_TRANSFER_INST|Идентификатор экземпляра перевода|
|ID_CONTRACT_FROM|Код контракта с которого осуществляется перевод|
|ID_CONTRACT_TO|Код контракта на который осуществляется перевод|
|DT_INCOMING|Дата поступления первеода в систему|
|DT_REAL|Дата введенная оператором|
|V_DESCRIPTION|Комментарий к переводу|
|N_SUM|Сумма к переводу|
|V_CODE_CURRENCY|Код валюты перевода|
|N_UNCOVERED_SUM|Непокрытая часть суммы|
|B_EXTERNAL_CONFIRM|Признак подтверждения перевода внешней системой|

# Задачи
1. В таблице аудита найти количество попыток продвижения заказа 2520123, закончившихся ошибкой.<br> _Результат_: количество попыток
2. В таблице аудита найти дату/время последней попытки продвижения заказа 2520123, закончившейся ошибкой.<br> _Результат_: дата/время попытки в формате dd.mon.yyyy и номер заказа
3. Найти все номера заказов в таблице аудита, с которых начиналась загрузка порции заказов.<br> _Результат_: номера заказов
4. Найти количество уникальных номеров заказов в таблице аудита, с которых начиналась загрузка порции заказов.<br> _Результат:_ единственное число - количество заказов
5. Найти суммарную продолжительность продвижения заказов в долях секунды (доли секунды для "+000000000 00:00:00.063924000" = 63924000) в таблице аудита.<br> _Результат_: единственное число
6. Сколько было завершённых процессов продвижения заказов в таблице аудита в марте 2018.<br> _Результат_: единственное число - количество завершённых процессов
7. Сколько повторяющихся идентификаторов сессии есть в таблице аудита.<br> _Результат_: единственное число - количество повторяющихся идентификаторов
8. Найти пользователя и последнюю дату его входа по таблице аудита для кода пользователя = 11136.<br> _Результат_: дата/время и логин пользователя
9. Вывести количество записей в таблице аудита по месяцам. <br> _Результат:_ название месяца и количество записей аудита в нём
10. Сколько записей в таблице аудита со статусом сообщения = "Ошибка" для процесса с кодом = 5 в интервале 22.02.2018 - 02.03.2018 (не включая границы). Сколько среди них с уникальным текстом сообщения<br> _Результат_: два числа - общее количество записей по условиям и количество записей с уникальным сообщением
11. По таблице переводов найти минимальную сумму перевода с датой поступления в систему в интервале 10:00-12:00 14 февраля 2017 при условии, что перевод должен был проходить между разными контрактами.<br> _Результат_: единственное число - сумма перевода
12. На печатном бланке для денежного перевода есть поле для комментария к денежному переводу. Максимальная длина текста в данном поле = 22 символам. Найти переводы, комментарий к которым не поместится на данном бланке. <br> _Результат_: контракт (на который совершался перевод), дата перевода от оператора, количество символов комментария, которые не влезают в поле бланка. Список должен быть отсортирован по количеству "невлезающих" символов в порядке убывания.
13. Предоставить срез количества денежных переводов внутри контракта (контракт с которого = контракт на который) по дням.<br> _Результат_: день в формате dd.mm.yyyy и количество переводов в этот день.