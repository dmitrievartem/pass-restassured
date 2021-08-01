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
      | dateFrom         | 20.07.2020 |
      | dateTo           | 20.07.2023 |
    * код ответа "200"
    * сохранен GUID из ответа
    * выполнен GET запрос на URL "http://localhost:8080/pass/" с сохраненным GUID
    * код ответа "200"
    * параметры в ответе соответствуют отправленным
    * удаление пропуска по сохраненному GUID
