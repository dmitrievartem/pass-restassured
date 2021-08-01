# language: ru

@all
Функционал: Проверка пропуска на валидность по GUID

  @main
  Сценарий: Запрос на проверку валидного пропуска
    * выполнен POST запрос на URL "http://localhost:8080/pass/" с параметрами из таблицы
      | personName       | test       |
      | personSurname    | test       |
      | personPatronymic | test       |
      | passportNumber   | test       |
      | dateFrom         | 20.07.2020 |
      | dateTo           | 20.07.2023 |
    * код ответа "200"
    * сохранен GUID из ответа
    * выполнен GET запрос на URL "http://localhost:8080/pass/" с сохраненным GUID
    * код ответа "200"
    * выполнен GET запрос на URL "http://localhost:8080/pass/validate/" с сохраненным GUID
    * код ответа "200"
    * удаление пропуска по сохраненному GUID

  @main
  Сценарий: Запрос на проверку невалидного пропуска
    * выполнен POST запрос на URL "http://localhost:8080/pass/" с параметрами из таблицы
      | personName       | test       |
      | personSurname    | test       |
      | personPatronymic | test       |
      | passportNumber   | test       |
      | dateFrom         | 20.07.2020 |
      | dateTo           | 20.07.2020 |
    * код ответа "200"
    * сохранен GUID из ответа
    * выполнен GET запрос на URL "http://localhost:8080/pass/" с сохраненным GUID
    * код ответа "200"
    * выполнен GET запрос на URL "http://localhost:8080/pass/validate/" с сохраненным GUID
    * код ответа "410"
    * удаление пропуска по сохраненному GUID