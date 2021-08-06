# language: ru

@all
Функционал: Проверка пропуска на валидность по GUID
  Метод GET http://localhost:8080/pass/validate/{guid}

  @smoke
  Сценарий: Запрос на проверку валидного пропуска
    * выполнен POST запрос на URL "http://localhost:8080/pass/" с параметрами из таблицы
      | personName       | test       |
      | personSurname    | test       |
      | personPatronymic | test       |
      | passportNumber   | test       |
      | dateFrom         | 2020-07-20 |
      | dateTo           | 2023-07-20 |
    * код ответа "200"
    * сохранен GUID из ответа
    * выполнен GET запрос на URL "http://localhost:8080/pass/" с сохраненным GUID
    * код ответа "200"
    * выполнен GET запрос на URL "http://localhost:8080/pass/validate/" с сохраненным GUID
    * код ответа "200"
    * удаление пропуска по сохраненному GUID

#  Поправочка +
#  С тестом и приложением всё ок, надо было указывать в запросе сегодняшнюю дату, а не ту что в автотесте
  @smoke
  Сценарий: Запрос на проверку невалидного пропуска
    * выполнен POST запрос на URL "http://localhost:8080/pass/" с параметрами из таблицы
      | personName       | test       |
      | personSurname    | test       |
      | personPatronymic | test       |
      | passportNumber   | test       |
      | dateFrom         | 2020-07-20 |
      | dateTo           | 2020-07-20 |
    * код ответа "200"
    * сохранен GUID из ответа
    * выполнен GET запрос на URL "http://localhost:8080/pass/validate/" с сохраненным GUID
    * код ответа "410"
    * удаление пропуска по сохраненному GUID