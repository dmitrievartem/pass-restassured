# language: ru

@all
Функционал: Добавление пропуска

  @x
  Сценарий: Добавление нового пропуска
    * выполнен POST запрос на URL "http://localhost:8080/pass/" с параметрами из таблицы
      | personName       | test       |
      | personSurname    | test       |
      | personPatronymic | test       |
      | passportNumber   | test       |
      | dateFrom         | 20.07.2020 |
      | dateTo           | 20.07.2023 |
    * вывод ответа
