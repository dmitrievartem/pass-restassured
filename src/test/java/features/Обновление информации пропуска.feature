# language: ru

@all
Функционал: Обновление информации по пропуску по GUID

  @main
  Сценарий: Обновление информации по пропуску по существующему GUID
    * создание нового пропуска
    * выполнен PUT запрос на URL "http://localhost:8080/pass/" со сгенерированными случайными параметрами и сохраненным GUID
    * код ответа "200"
    * выполнен GET запрос на URL "http://localhost:8080/pass/" с сохраненным GUID
    * код ответа "200"
    * параметры в ответе соответствуют отправленным
    * удаление пропуска по сохраненному GUID