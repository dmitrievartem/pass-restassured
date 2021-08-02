# language: ru

@all
Функционал: Добавление пропуска

  @main
  Сценарий: Добавление нового валидного пропуска
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
    * параметры в ответе соответствуют отправленным
    * удаление пропуска по сохраненному GUID


  Сценарий: Добавление нового пропуска с пустым personName
    * выполнен POST запрос на URL "http://localhost:8080/pass/" с параметрами из таблицы
      | personName       |            |
      | personSurname    | test       |
      | personPatronymic | test       |
      | passportNumber   | test       |
      | dateFrom         | 2020-07-20 |
      | dateTo           | 2023-07-20 |
    * код ответа "200"
    * сохранен GUID из ответа
    * выполнен GET запрос на URL "http://localhost:8080/pass/" с сохраненным GUID
    * код ответа "200"
    * параметры в ответе соответствуют отправленным
    * удаление пропуска по сохраненному GUID


  Сценарий: Добавление нового пропуска с пустым personSurname
    * выполнен POST запрос на URL "http://localhost:8080/pass/" с параметрами из таблицы
      | personName       | test       |
      | personSurname    |            |
      | personPatronymic | test       |
      | passportNumber   | test       |
      | dateFrom         | 2020-07-20 |
      | dateTo           | 2023-07-20 |
    * код ответа "200"
    * сохранен GUID из ответа
    * выполнен GET запрос на URL "http://localhost:8080/pass/" с сохраненным GUID
    * код ответа "200"
    * параметры в ответе соответствуют отправленным
    * удаление пропуска по сохраненному GUID


  Сценарий: Добавление нового пропуска с пустым personPatronymic
    * выполнен POST запрос на URL "http://localhost:8080/pass/" с параметрами из таблицы
      | personName       | test       |
      | personSurname    | test       |
      | personPatronymic |            |
      | passportNumber   | test       |
      | dateFrom         | 2020-07-20 |
      | dateTo           | 2023-07-20 |
    * код ответа "200"
    * сохранен GUID из ответа
    * выполнен GET запрос на URL "http://localhost:8080/pass/" с сохраненным GUID
    * код ответа "200"
    * параметры в ответе соответствуют отправленным
    * удаление пропуска по сохраненному GUID


  Сценарий: Добавление нового пропуска с пустым passportNumber
    * выполнен POST запрос на URL "http://localhost:8080/pass/" с параметрами из таблицы
      | personName       | test       |
      | personSurname    | test       |
      | personPatronymic | test       |
      | passportNumber   |            |
      | dateFrom         | 2020-07-20 |
      | dateTo           | 2023-07-20 |
    * код ответа "200"
    * сохранен GUID из ответа
    * выполнен GET запрос на URL "http://localhost:8080/pass/" с сохраненным GUID
    * код ответа "200"
    * параметры в ответе соответствуют отправленным
    * удаление пропуска по сохраненному GUID

@c
  Сценарий: Добавление нового пропуска с пустым dateFrom
    * выполнен POST запрос на URL "http://localhost:8080/pass/" с параметрами из таблицы
      | personName       | test       |
      | personSurname    | test       |
      | personPatronymic | test       |
      | passportNumber   | test       |
      | dateFrom         |            |
      | dateTo           | 2023-07-20 |
    * код ответа "200"
    * сохранен GUID из ответа
    * выполнен GET запрос на URL "http://localhost:8080/pass/" с сохраненным GUID
    * код ответа "200"
    * параметры в ответе соответствуют отправленным
    * удаление пропуска по сохраненному GUID

  @c
  Сценарий: Добавление нового пропуска с пустым dateTo
    * выполнен POST запрос на URL "http://localhost:8080/pass/" с параметрами из таблицы
      | personName       | test       |
      | personSurname    | test       |
      | personPatronymic | test       |
      | passportNumber   | test       |
      | dateFrom         | 2020-07-20 |
      | dateTo           |            |
    * код ответа "200"
    * сохранен GUID из ответа
    * выполнен GET запрос на URL "http://localhost:8080/pass/" с сохраненным GUID
    * код ответа "200"
    * параметры в ответе соответствуют отправленным
    * удаление пропуска по сохраненному GUID


  Сценарий: Добавление нового пропуска без параметра personName
    * выполнен POST запрос на URL "http://localhost:8080/pass/" с параметрами из таблицы
      | personSurname    | test       |
      | personPatronymic | test       |
      | passportNumber   | test       |
      | dateFrom         | 2020-07-20 |
      | dateTo           | 2023-07-20 |
    * код ответа "200"
    * сохранен GUID из ответа
    * выполнен GET запрос на URL "http://localhost:8080/pass/" с сохраненным GUID
    * код ответа "200"
    * параметры в ответе соответствуют отправленным
    * удаление пропуска по сохраненному GUID


  Сценарий: Добавление нового пропуска без параметра personSurname
    * выполнен POST запрос на URL "http://localhost:8080/pass/" с параметрами из таблицы
      | personName       | test       |
      | personPatronymic | test       |
      | passportNumber   | test       |
      | dateFrom         | 2020-07-20 |
      | dateTo           | 2023-07-20 |
    * код ответа "200"
    * сохранен GUID из ответа
    * выполнен GET запрос на URL "http://localhost:8080/pass/" с сохраненным GUID
    * код ответа "200"
    * параметры в ответе соответствуют отправленным
    * удаление пропуска по сохраненному GUID


  Сценарий: Добавление нового пропуска без параметра personPatronymic
    * выполнен POST запрос на URL "http://localhost:8080/pass/" с параметрами из таблицы
      | personName       | test       |
      | personSurname    | test       |
      | passportNumber   | test       |
      | dateFrom         | 2020-07-20 |
      | dateTo           | 2023-07-20 |
    * код ответа "200"
    * сохранен GUID из ответа
    * выполнен GET запрос на URL "http://localhost:8080/pass/" с сохраненным GUID
    * код ответа "200"
    * параметры в ответе соответствуют отправленным
    * удаление пропуска по сохраненному GUID


  Сценарий: Добавление нового пропуска без параметра passportNumber
    * выполнен POST запрос на URL "http://localhost:8080/pass/" с параметрами из таблицы
      | personName       | test       |
      | personSurname    | test       |
      | personPatronymic | test       |
      | dateFrom         | 2020-07-20 |
      | dateTo           | 2023-07-20 |
    * код ответа "200"
    * сохранен GUID из ответа
    * выполнен GET запрос на URL "http://localhost:8080/pass/" с сохраненным GUID
    * код ответа "200"
    * параметры в ответе соответствуют отправленным
    * удаление пропуска по сохраненному GUID


  Сценарий: Добавление нового пропуска без параметра dateFrom
    * выполнен POST запрос на URL "http://localhost:8080/pass/" с параметрами из таблицы
      | personName       | test       |
      | personSurname    | test       |
      | personPatronymic | test       |
      | passportNumber   | test       |
      | dateTo           | 2023-07-20 |
    * код ответа "200"
    * сохранен GUID из ответа
    * выполнен GET запрос на URL "http://localhost:8080/pass/" с сохраненным GUID
    * код ответа "200"
    * параметры в ответе соответствуют отправленным
    * удаление пропуска по сохраненному GUID


  Сценарий: Добавление нового пропуска без параметра dateTo
    * выполнен POST запрос на URL "http://localhost:8080/pass/" с параметрами из таблицы
      | personName       | test       |
      | personSurname    | test       |
      | personPatronymic | test       |
      | passportNumber   | test       |
      | dateFrom         | 2020-07-20 |
    * код ответа "200"
    * сохранен GUID из ответа
    * выполнен GET запрос на URL "http://localhost:8080/pass/" с сохраненным GUID
    * код ответа "200"
    * параметры в ответе соответствуют отправленным
    * удаление пропуска по сохраненному GUID