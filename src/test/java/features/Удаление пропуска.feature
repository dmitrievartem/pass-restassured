# language: ru

@all
Функционал: Удаление пропуска по GUID
  Метод DELETE http://localhost:8080/pass/{guid}

  @smoke
  Сценарий: Запрос на удаление
    * создание нового пропуска
    * выполнен DELETE запрос на URL "http://localhost:8080/pass/" с сохраненным GUID
    * код ответа "200"
    * выполнен GET запрос на URL "http://localhost:8080/pass/" с сохраненным GUID
    * код ответа "404"