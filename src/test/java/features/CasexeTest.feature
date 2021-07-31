# language: ru

@SmokeTest
Функционал: Получение информации по пропуску по GUID

  Сценарий: Запрос с существующим GUID
    Когда выполнен GET запрос на URL "http://localhost:8080/pass/87f927f2-081d-4e0d-9595-43675e5b92d6"
