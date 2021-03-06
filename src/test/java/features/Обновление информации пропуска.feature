# language: ru

@all
Функционал: Обновление информации по пропуску по GUID
  Метод PUT http://localhost:8080/pass/{guid}

  @main
  Сценарий: Обновление информации по пропуску по существующему GUID
    * создание нового пропуска
    * выполнен PUT запрос на URL "http://localhost:8080/pass/" со сгенерированными случайными параметрами и сохраненным GUID
    * код ответа "200"
    * выполнен GET запрос на URL "http://localhost:8080/pass/" с сохраненным GUID
    * код ответа "200"
    * параметры в ответе соответствуют отправленным
    * удаление пропуска по сохраненному GUID


  Сценарий: Обновление информации по пропуску с указанием нового GUID
    * создание нового пропуска
    * выполнен PUT запрос на URL "http://localhost:8080/pass/" с параметрами из таблицы и сохраненным GUID
      | guid             | e431754b-5f58-433c-9ca0-387261c9ca33 |
      | personName       | test                                 |
      | personSurname    | test                                 |
      | personPatronymic | test                                 |
      | passportNumber   | test                                 |
      | dateFrom         | 2020-07-20                           |
      | dateTo           | 2023-07-20                           |
    * код ответа "200"
    * выполнен GET запрос на URL "http://localhost:8080/pass/" с сохраненным GUID
    * код ответа "200"
    * параметр guid в ответе равен сохраененному guid
    * удаление пропуска по сохраненному GUID


  Сценарий: Обновление информации по пропуску без указания параметра personName
    * создание нового пропуска
    * выполнен PUT запрос на URL "http://localhost:8080/pass/" с параметрами из таблицы и сохраненным GUID
      | personSurname    | updated    |
      | personPatronymic | updated    |
      | passportNumber   | updated    |
      | dateFrom         | 2021-01-21 |
      | dateTo           | 2021-01-21 |
    * код ответа "200"
    * выполнен GET запрос на URL "http://localhost:8080/pass/" с сохраненным GUID
    * код ответа "200"
    * параметры в ответе соответствуют отправленным
    * удаление пропуска по сохраненному GUID


  Сценарий: Обновление информации по пропуску без указания параметра personSurname
    * создание нового пропуска
    * выполнен PUT запрос на URL "http://localhost:8080/pass/" с параметрами из таблицы и сохраненным GUID
      | personName       | updated    |
      | personSurname    | updated    |
      | personPatronymic | updated    |
      | passportNumber   | updated    |
      | dateFrom         | 2021-01-21 |
      | dateTo           | 2021-01-21 |
    * код ответа "200"
    * выполнен GET запрос на URL "http://localhost:8080/pass/" с сохраненным GUID
    * код ответа "200"
    * параметры в ответе соответствуют отправленным
    * удаление пропуска по сохраненному GUID


  Сценарий: Обновление информации по пропуску без указания параметра personPatronymic
    * создание нового пропуска
    * выполнен PUT запрос на URL "http://localhost:8080/pass/" с параметрами из таблицы и сохраненным GUID
      | personName       | updated    |
      | personSurname    | updated    |
      | passportNumber   | updated    |
      | dateFrom         | 2021-01-21 |
      | dateTo           | 2021-01-21 |
    * код ответа "200"
    * выполнен GET запрос на URL "http://localhost:8080/pass/" с сохраненным GUID
    * код ответа "200"
    * параметры в ответе соответствуют отправленным
    * удаление пропуска по сохраненному GUID


  Сценарий: Обновление информации по пропуску без указания параметра passportNumber
    * создание нового пропуска
    * выполнен PUT запрос на URL "http://localhost:8080/pass/" с параметрами из таблицы и сохраненным GUID
      | personName       | updated    |
      | personSurname    | updated    |
      | personPatronymic | updated    |
      | dateFrom         | 2021-01-21 |
      | dateTo           | 2021-01-21 |
    * код ответа "200"
    * выполнен GET запрос на URL "http://localhost:8080/pass/" с сохраненным GUID
    * код ответа "200"
    * параметры в ответе соответствуют отправленным
    * удаление пропуска по сохраненному GUID


  Сценарий: Обновление информации по пропуску без указания параметра dateFrom
    * создание нового пропуска
    * выполнен PUT запрос на URL "http://localhost:8080/pass/" с параметрами из таблицы и сохраненным GUID
      | personName       | updated    |
      | personSurname    | updated    |
      | personPatronymic | updated    |
      | passportNumber   | updated    |
      | dateTo           | 2021-01-21 |
    * код ответа "200"
    * выполнен GET запрос на URL "http://localhost:8080/pass/" с сохраненным GUID
    * код ответа "200"
    * параметры в ответе соответствуют отправленным
    * удаление пропуска по сохраненному GUID


  Сценарий: Обновление информации по пропуску без указания параметра dateTo
    * создание нового пропуска
    * выполнен PUT запрос на URL "http://localhost:8080/pass/" с параметрами из таблицы и сохраненным GUID
      | personName       | updated    |
      | personSurname    | updated    |
      | personPatronymic | updated    |
      | passportNumber   | updated    |
      | dateFrom         | 2021-01-21 |
    * код ответа "200"
    * выполнен GET запрос на URL "http://localhost:8080/pass/" с сохраненным GUID
    * код ответа "200"
    * параметры в ответе соответствуют отправленным
    * удаление пропуска по сохраненному GUID


  Сценарий: Обновление информации по пропуску по несуществующему GUID
    * создание нового пропуска
    * удаление пропуска по сохраненному GUID
    * выполнен PUT запрос на URL "http://localhost:8080/pass/" со сгенерированными случайными параметрами и сохраненным GUID
    * код ответа "404"