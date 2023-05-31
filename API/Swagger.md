# Запросы в Swagger

Сайт: https://fakerestapi.azurewebsites.net/

## Activities

###  1. GET​/api/v1/Activities

**HTTP-метод:** GET
**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Activities
**Заголовки запроса:** text/plain; v=1.0
**Тело запроса:** -
**Статус-код ответа:** 200 Success
**Тело ответа:**
```
[
  {
    "id": 1,
    "title": "Activity 1",
    "dueDate": "2023-05-16T18:26:44.0042255+00:00",
    "completed": false
  },
  {
    "id": 2,
    "title": "Activity 2",
    "dueDate": "2023-05-16T19:26:44.0042282+00:00",
    "completed": true
  },
  {
    "id": 3,
    "title": "Activity 3",
    "dueDate": "2023-05-16T20:26:44.0042286+00:00",
    "completed": false
  },
  {
    "id": 4,
    "title": "Activity 4",
    "dueDate": "2023-05-16T21:26:44.0042288+00:00",
    "completed": true
  },
  {
    "id": 5,
    "title": "Activity 5",
    "dueDate": "2023-05-16T22:26:44.0042291+00:00",
    "completed": false
  },....
  ```
### 2. POST/api/v1/Activities

**HTTP-метод:** POST
**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Activities
**Заголовки запроса:** text/plain; v=1.0
**Тело запроса:**
```
{
  "id": 0,
  "title": "string",
  "dueDate": "2023-05-16T17:31:19.280Z",
  "completed": true
}
```
**Статус-код ответа:** 200 Success
**Тело ответа:**
```
{
  "id": 0,
  "title": "string",
  "dueDate": "2023-05-16T17:31:19.28Z",
  "completed": true
}
```
### 3. GET/api/v1/Activities/{id}

**HTTP-метод:** GET
**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Activities/1
**Заголовки запроса:** text/plain; v=1.0
**Тело запроса**: -
**Статус-код ответа:** 200 Success
**Тело ответа:**
```
{
  "id": 1,
  "title": "Activity 1",
  "dueDate": "2023-05-16T18:45:45.3553229+00:00",
  "completed": false
}
```
### 4. GET/api/v1/Activities/{id}

**HTTP-метод:** GET
**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Activities/100
**Заголовки запроса:** text/plain; v=1.0
**Тело запроса:** -
**Статус-код ответа:** 404 Error: Not Found
**Тело ответа:**
```
{
  "type": "https://tools.ietf.org/html/rfc7231#section-6.5.4",
  "title": "Not Found",
  "status": 404,
  "traceId": "00-4a3c904766da3b4fb8052697a936be28-133bd20d01152040-00"
}
```
### 5. PUT​/api​/v1​/Activities​/{id}

**HTTP-метод:** PUT
**URL запроса:**
https://fakerestapi.azurewebsites.net/api/v1/Activities/1
**Заголовки запроса:** text/plain; v=1.0
**Тело запроса:**
```
{
  "id": 0,
  "title": "string",
  "dueDate": "2023-05-16T17:53:29.602Z",
  "completed": true
}
```
**Статус-код ответа:** 200 Success
**Тело ответа:** 
```
{
  "id": 0,
  "title": "string",
  "dueDate": "2023-05-16T17:53:29.602Z",
  "completed": true
}
```
### 6. PUT​/api​/v1​/Activities​/{id}

**HTTP-метод:** PUT
**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Activities/1568364527181
**Заголовки запроса:** text/plain; v=1.0
**Тело запроса:**
```
{
  "id": 0,
  "title": "string",
  "dueDate": "2023-05-16T17:53:29.602Z",
  "completed": true
}
```
**Статус-код ответа:** 400 Error: Bad Request
**Тело ответа:** 
```
{
  "type": "https://tools.ietf.org/html/rfc7231#section-6.5.1",
  "title": "One or more validation errors occurred.",
  "status": 400,
  "traceId": "00-271ba1467db8dc46ad9d465903e3eaee-05b18c77b6c95847-00",
  "errors": {
    "id": [
      "The value '1568364527181' is not valid."
    ]
  }
}
```
### 7. DELETE ​/api/v1/Activities/{id}

**HTTP-метод:** DELETE
**URL запроса:**
https://fakerestapi.azurewebsites.net/api/v1/Activities/1
**Заголовки запроса:** */*
**Тело запроса:** -
**Статус-код ответа:** 200 Success
**Тело ответа:** -

### 8. DELETE​/api/v1/Activities/{id}

**HTTP-метод:** DELETE
**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Activities/14298401928012948
**Заголовки запроса:** */*
**Тело запроса:** -
**Статус-код ответа:** 400 Error: Bad Request
**Тело ответа:** 
```
{
  "type": "https://tools.ietf.org/html/rfc7231#section-6.5.1",
  "title": "One or more validation errors occurred.",
  "status": 400,
  "traceId": "00-3bdb37f9f039d14bb60efe2c0472d389-a411273c8e20e94b-00",
  "errors": {
    "id": [
      "The value '14298401928012948' is not valid."
    ]
  }
}
```
## Authors 

### 9. GET/api/v1/Authors

**HTTP-метод:** GET
**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Authors
**Заголовки запроса:** text/plain; v=1.0
**Тело запроса:**-
**Статус-код ответа:** 200 Success
**Тело ответа:** 
```
[
  {
    "id": 1,
    "idBook": 1,
    "firstName": "First Name 1",
    "lastName": "Last Name 1"
  },
  {
    "id": 2,
    "idBook": 1,
    "firstName": "First Name 2",
    "lastName": "Last Name 2"
  },
  {
    "id": 3,
    "idBook": 1,
    "firstName": "First Name 3",
    "lastName": "Last Name 3"
  },
  {
    "id": 4,
    "idBook": 2,
    "firstName": "First Name 4",
    "lastName": "Last Name 4"
  },
  {
    "id": 5,
    "idBook": 2,
    "firstName": "First Name 5",
    "lastName": "Last Name 5"
  },...
  ```
### 10. POST/api/v1/Authors

**HTTP-метод:** POST
**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Authors
**Заголовки запроса:** text/plain; v=1.0
**Тело запроса:**
```
{
  "id": 0,
  "idBook": 0,
  "firstName": "string",
  "lastName": "string"
}
```
**Статус-код ответа:** 200 Success
**Тело ответа:** 
```
{
  "id": 0,
  "idBook": 0,
  "firstName": "string",
  "lastName": "string"
}
```
### 11. GET/api/v1/Authors/authors/books/{idBook}

**HTTP-метод:** GET
**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Authors/authors/books/1
**Заголовки запроса:** text/plain; v=1.0
**Тело запроса:**-
**Статус-код ответа:** 200 Success
**Тело ответа:** 
```
[
  {
    "id": 1,
    "idBook": 1,
    "firstName": "First Name 1",
    "lastName": "Last Name 1"
  },
  {
    "id": 2,
    "idBook": 1,
    "firstName": "First Name 2",
    "lastName": "Last Name 2"
  },
  {
    "id": 3,
    "idBook": 1,
    "firstName": "First Name 3",
    "lastName": "Last Name 3"
  },
  {
    "id": 4,
    "idBook": 1,
    "firstName": "First Name 4",
    "lastName": "Last Name 4"
  }
]
```
### 12. GET/api/v1/Authors/authors/books/{idBook}

**HTTP-метод:** GET
**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Authors/authors/books/1000
**Заголовки запроса:** text/plain; v=1.0
**Тело запроса:**-
**Статус-код ответа:** 200 Success
**Тело ответа** - 

### 13. GET/api/v1/Authors/{id}

**HTTP-метод:** GET
**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Authors/1
**Заголовки запроса:** text/plain; v=1.0
**Тело запроса:** -
**Статус-код ответа:** 200 Success
**Тело ответа:** 
```
{
  "id": 1,
  "idBook": 1,
  "firstName": "First Name 1",
  "lastName": "Last Name 1"
}
```
### 14. GET/api/v1/Authors/{id}

**HTTP-метод:** GET
**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Authors/1000
**Заголовки запроса:** text/plain; v=1.0
**Тело запроса:** -
**Статус-код ответа:** 404 Error: Not Found
**Тело ответа:** 
```
{
  "type": "https://tools.ietf.org/html/rfc7231#section-6.5.4",
  "title": "Not Found",
  "status": 404,
  "traceId": "00-471960b86293b5458ac62662e3db11df-6ee8e649ae56da48-00"
}
```
### 15.  PUT/api/v1/Authors/{id}

**HTTP-метод:** PUT
**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Authors/1
**Заголовки запроса:** text/plain; v=1.0
**Тело запроса:**
```
{
  "id": 0,
  "idBook": 0,
  "firstName": "string",
  "lastName": "string"
}
```
**Статус-код ответа:** 200 Success
**Тело ответа:** 
```
{
  "id": 0,
  "idBook": 0,
  "firstName": "string",
  "lastName": "string"
}
```
### 16. PUT/api/v1/Authors/{id}

**HTTP-метод:** PUT
**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Authors/1568364527181
**Заголовки запроса:** text/plain; v=1.0
**Тело запроса:** 
```
{
  "id": 0,
  "idBook": 0,
  "firstName": "string",
  "lastName": "string"
}
```
**Статус-код ответа:** 400 Error: Bad Request
**Тело ответа:** 
```
{
  "type": "https://tools.ietf.org/html/rfc7231#section-6.5.1",
  "title": "One or more validation errors occurred.",
  "status": 400,
  "traceId": "00-d7fe539c2b39784484a19e6a7e6320d7-155ecf5169647d40-00",
  "errors": {
    "id": [
      "The value '1568364527181' is not valid."
    ]
  }
}
```
### 17. DELETE/api/v1/Authors/{id}

**HTTP-метод:** DELETE
**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Authors/1
**Заголовки запроса:** */*
**Тело запроса:** -
**Статус-код ответа:**  200 Success
**Тело ответа:** -

### 18. DELETE​/api/v1/Authors/{id}

**HTTP-метод:** DELETE
**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Authors/146586936355
**Заголовки запроса:** */*
**Тело запроса:** -
**Статус-код ответа:** 400 Error: Bad Request
**Тело ответа:** 
```
{
  "type": "https://tools.ietf.org/html/rfc7231#section-6.5.1",
  "title": "One or more validation errors occurred.",
  "status": 400,
  "traceId": "00-8c4cd10bfd4f6848bc0f4c1664c570e6-c9fe44b4ad8b5141-00",
  "errors": {
    "id": [
      "The value '146586936355' is not valid."
    ]
  }
}
```
## Books

### 19. GET/api/v1/Books

**HTTP-метод:** GET
**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Books
**Заголовки запроса:** text/plain; v=1.0
**Тело запроса:** -
**Статус-код ответа:** 200 Success
**Тело ответа:** 
```
[
  {
    "id": 1,
    "title": "Book 1",
    "description": "Lorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\n",
    "pageCount": 100,
    "excerpt": "Lorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\n",
    "publishDate": "2023-05-15T18:59:55.4221756+00:00"
  },
  {
    "id": 2,
    "title": "Book 2",
    "description": "Lorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\n",
    "pageCount": 200,
    "excerpt": "Lorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\n",
    "publishDate": "2023-05-14T18:59:55.4221886+00:00"
  },
  {
    "id": 3,
    "title": "Book 3",
    "description": "Lorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\n",
    "pageCount": 300,
    "excerpt": "Lorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\n",
    "publishDate": "2023-05-13T18:59:55.4221995+00:00"
  },
  {
    "id": 4,
    "title": "Book 4",
    "description": "Lorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\n",
    "pageCount": 400,
    "excerpt": "Lorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\n",
    "publishDate": "2023-05-12T18:59:55.4222118+00:00"
  },
  {
    "id": 5,
    "title": "Book 5",
    "description": "Lorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\n",
    "pageCount": 500,
    "excerpt": "Lorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\n",
    "publishDate": "2023-05-11T18:59:55.4222226+00:00"
  },...
  ```
### 20. POST/api/v1/Books

**HTTP-метод:** POST
**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Books
**Заголовки запроса:** text/plain; v=1.0
**Тело запроса:** 
```
{
  "id": 0,
  "title": "string",
  "description": "string",
  "pageCount": 0,
  "excerpt": "string",
  "publishDate": "2023-05-16T19:02:17.183Z"
}
```
**Статус-код ответа:** 200 Success
**Тело ответа:** 
```
{
  "id": 0,
  "title": "string",
  "description": "string",
  "pageCount": 0,
  "excerpt": "string",
  "publishDate": "2023-05-16T19:02:17.183Z"
}
```
### 21. GET/api/v1/Books/{id}

**HTTP-метод:** GET
**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Books/1
**Заголовки запроса:** text/plain; v=1.0
**Тело запроса:** 
**Статус-код ответа:** 200 Success
**Тело ответа:** 
```
{
  "id": 1,
  "title": "Book 1",
  "description": "Lorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\n",
  "pageCount": 100,
  "excerpt": "Lorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\n",
  "publishDate": "2023-05-15T19:05:10.583818+00:00"
}
```
### 22. GET/api/v1/Books/{id}

**HTTP-метод:** GET
**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Books/198867765
**Заголовки запроса:** text/plain; v=1.0
**Тело запроса:** 
**Статус-код ответа:** 400 Error: Not Found
**Тело ответа:** 
```
{
  "type": "https://tools.ietf.org/html/rfc7231#section-6.5.4",
  "title": "Not Found",
  "status": 404,
  "traceId": "00-a1e0a83da3c1994a8c23291373e304b7-530bcee61379f443-00"
},
```
### 23. PUT/api/v1/Books/{id}

**HTTP-метод:** PUT
**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Books/1
**Заголовки запроса:** /
**Тело запроса:** 
```
{
  "id": 0,
  "title": "string",
  "description": "string",
  "pageCount": 0,
  "excerpt": "string",
  "publishDate": "2023-05-16T19:17:39.406Z"
}
```
**Статус-код ответа:**  200 Success
**Тело ответа:** 
```
{
  "id": 0,
  "title": "string",
  "description": "string",
  "pageCount": 0,
  "excerpt": "string",
  "publishDate": "2023-05-16T19:17:39.406Z"
}
```
### 24. PUT/api/v1/Books/{id}

**HTTP-метод:** PUT
**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Books/14375638457
**Заголовки запроса:** /
**Тело запроса:** 
```
{
  "id": 0,
  "idBook": 0,
  "firstName": "string",
  "lastName": "string"
}
```
**Статус-код ответа:** 400 Error: Bad Request
**Тело ответа:** 
```
{
  "type": "https://tools.ietf.org/html/rfc7231#section-6.5.1",
  "title": "One or more validation errors occurred.",
  "status": 400,
  "traceId": "00-85afea834bb9734d8ac581c1ac589a80-d2a22a42444a9b4d-00",
  "errors": {
    "id": [
      "The value '14375638457' is not valid."
    ]
  }
}
```
### 25.DELETE/api/v1/Books/{id}

**HTTP-метод:** DELETE
**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Books/1
**Заголовки запроса:** */*
**Тело запроса:** -
**Статус-код ответа:** 200 Success
**Тело ответа:** -

### 26.DELETE/api/v1/Books/{id}

**HTTP-метод:** DELETE
**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Books/1031273467234
**Заголовки запроса:** */*
**Тело запроса:** -
**Статус-код ответа:**  400 Error: Bad Request
**Тело ответа:** 
```
{
  "type": "https://tools.ietf.org/html/rfc7231#section-6.5.1",
  "title": "One or more validation errors occurred.",
  "status": 400,
  "traceId": "00-70782eead387ff459d2c31e9614e2d40-01265d0fada4e24f-00",
  "errors": {
    "id": [
      "The value '1031273467234' is not valid."
    ]
  }
}
```
## CoverPhotos

### 27.GET/api/v1/CoverPhotos

**HTTP-метод:** GET
**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/CoverPhotos
**Заголовки запроса:** text/plain; v=1.0
**Тело запроса:** -
**Статус-код ответа:** 200 Success
**Тело ответа:** 
```
[
  {
    "id": 1,
    "idBook": 1,
    "url": "https://placeholdit.imgix.net/~text?txtsize=33&txt=Book 1&w=250&h=350"
  },
  {
    "id": 2,
    "idBook": 2,
    "url": "https://placeholdit.imgix.net/~text?txtsize=33&txt=Book 2&w=250&h=350"
  },
  {
    "id": 3,
    "idBook": 3,
    "url": "https://placeholdit.imgix.net/~text?txtsize=33&txt=Book 3&w=250&h=350"
  },
  {
    "id": 4,
    "idBook": 4,
    "url": "https://placeholdit.imgix.net/~text?txtsize=33&txt=Book 4&w=250&h=350"
  },
  {
    "id": 5,
    "idBook": 5,
    "url": "https://placeholdit.imgix.net/~text?txtsize=33&txt=Book 5&w=250&h=350"
  }
```
### 28. POST/api/v1/CoverPhotos

**HTTP-метод:** POST
**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/CoverPhotos
**Заголовки запроса:** text/plain; v=1.0
**Тело запроса:** 
```
{
  "id": 0,
  "idBook": 0,
  "url": "string"
}
```
**Статус-код ответа:** 200 Success
**Тело ответа:** 
 ```
{
  "id": 0,
  "idBook": 0,
  "url": "string"
}
```
### 29. GET/api/v1/CoverPhotos/books/covers/{idBook}

**HTTP-метод:** GET
**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/CoverPhotos/books/covers/1
**Заголовки запроса:** text/plain; v=1.0
**Тело запроса:** -
**Статус-код ответа:** 200 Success
**Тело ответа:** 
```
[
  {
    "id": 1,
    "idBook": 1,
    "url": "https://placeholdit.imgix.net/~text?txtsize=33&txt=Book 1&w=250&h=350"
  }
],
```
### 30.GET/api/v1/CoverPhotos/books/covers/{idBook}

**HTTP-метод:** GET
**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/CoverPhotos/books/covers/482098402984209348
**Заголовки запроса:** text/plain; v=1.0
**Тело запроса:** -
**Статус-код ответа:** 400 Error: Bad Request
**Тело ответа:** 
```
{
  "type": "https://tools.ietf.org/html/rfc7231#section-6.5.1",
  "title": "One or more validation errors occurred.",
  "status": 400,
  "traceId": "00-e4542314af07ee479b2e4c5e152a54c4-3eeda8d7d4a16241-00",
  "errors": {
    "idBook": [
      "The value '482098402984209348' is not valid."
    ]
  }
}
```
### 31. GET /api/v1/CoverPhotos/{id}

**HTTP-метод:** GET
**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/CoverPhotos/1
**Заголовки запроса:** text/plain; v=1.0
**Тело запроса:** -
**Статус-код ответа:** 200 Success
**Тело ответа:** 
```
{
  "id": 1,
  "idBook": 1,
  "url": "https://placeholdit.imgix.net/~text?txtsize=33&txt=Book 1&w=250&h=350"
}
```
### 32. GET/api/v1/CoverPhotos/{id}

**HTTP-метод:** GET
**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/CoverPhotos/1000
**Заголовки запроса:** text/plain; v=1.0
**Тело запроса:** -
**Статус-код ответа:** 404 Error: Not Found
**Тело ответа:** 
```
{
  "type": "https://tools.ietf.org/html/rfc7231#section-6.5.4",
  "title": "Not Found",
  "status": 404,
  "traceId": "00-3c192b03229c1f41b7e29bcafae06161-657f161b9b3ef14c-00"
}
```
### 33. PUT /api/v1/CoverPhotos/{id}

**HTTP-метод:** PUT
**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/CoverPhotos/1
**Заголовки запроса:** text/plain; v=1.0
**Тело запроса:**
```
{
  "id": 0,
  "idBook": 0,
  "url": "string"
}
```
**Статус-код ответа:** 200 Success
**Тело ответа:**
```
{
  "id": 0,
  "idBook": 0,
  "url": "string"
}
```
### 34. PUT/api/v1/CoverPhotos/{id}

**HTTP-метод:** PUT
**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/CoverPhotos/37283749284792874
**Заголовки запроса:** text/plain; v=1.0
**Тело запроса:**
```
{
  "id": 0,
  "idBook": 0,
  "firstName": "string",
  "lastName": "string"
}
```
**Статус-код ответа:** 400 Error: Bad Request
**Тело ответа:** 
```
{
  "type": "https://tools.ietf.org/html/rfc7231#section-6.5.1",
  "title": "One or more validation errors occurred.",
  "status": 400,
  "traceId": "00-88e5c3571eb3844c83263e1b4a696032-8efd3cac9cd3ce4e-00",
  "errors": {
    "id": [
      "The value '37283749284792874' is not valid."
    ]
  }
}
```
### 35. DELETE/api/v1/CoverPhotos/{id}

**HTTP-метод:** DELETE
**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/CoverPhotos/1
**Заголовки запроса:**  _/_
**Тело запроса:** -
**Статус-код ответа:** 200 Success
**Тело ответа:** -

### 36. DELETE ​/api/v1/CoverPhotos/{id}

**HTTP-метод:** DELETE
**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/CoverPhotos/123782332365
**Заголовки запроса:** */*
**Тело запроса:** -
**Статус-код ответа:** 400 Error: Bad Request
**Тело ответа:**
```
{
  "type": "https://tools.ietf.org/html/rfc7231#section-6.5.1",
  "title": "One or more validation errors occurred.",
  "status": 400,
  "traceId": "00-51e61d165a1a77478711b5799a7c6e2d-0793c1f9e14a464f-00",
  "errors": {
    "id": [
      "The value '123782332365' is not valid."
    ]
  }
}
```
## Users

### 37. GET /api/v1/Users

**HTTP-метод:** GET
**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Users
**Заголовки запроса:** text/plain; v=1.0
**Тело запроса:** -
**Статус-код ответа:** 200 Success
**Тело ответа:**
```
[
  {
    "id": 1,
    "userName": "User 1",
    "password": "Password1"
  },
  {
    "id": 2,
    "userName": "User 2",
    "password": "Password2"
  },
  {
    "id": 3,
    "userName": "User 3",
    "password": "Password3"
  },
  {
    "id": 4,
    "userName": "User 4",
    "password": "Password4"
  },
  {
    "id": 5,
    "userName": "User 5",
    "password": "Password5"
  },...
```
### 38. POST/api/v1/Users

**HTTP-метод:** POST
**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Users
**Заголовки запроса:** /
**Тело запроса:** 
```
{
  "id": 0,
  "userName": "string",
  "password": "string"
}
```
**Статус-код ответа:**  200 Success
**Тело ответа:** 
```
{
  "id": 0,
  "userName": "string",
  "password": "string"
}
```
### 39. GET/api/v1/Users/{id}

**HTTP-метод:** GET
**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Users/1
**Заголовки запроса:** /
**Тело запроса:** -
**Статус-код ответа:** 200 Success
**Тело ответа:** 
```
{
  "id": 1,
  "userName": "User 1",
  "password": "Password1"
}
```
### 40. GET /api/v1/Users/{id}

**HTTP-метод:** GET
**URL запроса:** : https://fakerestapi.azurewebsites.net/api/v1/Users/2999
**Заголовки запроса:** /
**Тело запроса:** -
**Статус-код ответа:** 404 Error: Not Found
**Тело ответа:** 
```
{
  "type": "https://tools.ietf.org/html/rfc7231#section-6.5.4",
  "title": "Not Found",
  "status": 404,
  "traceId": "00-1693b6879794af408fe19fb0eba3f1be-fdc1682b7892664c-00"
}
```
### 41. PUT/api/v1/Users/{id}

**HTTP-метод:** PUT
**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Users/3
**Заголовки запроса:** /
**Тело запроса:** 
```
{
  "id": 0,
  "userName": "string",
  "password": "string"
}
```
**Статус-код ответа:** 200 Success
**Тело ответа:** 
```
{
  "id": 0,
  "userName": "string",
  "password": "string"
}
```
### 42. PUT /api/v1/Users/{id}

**HTTP-метод:** PUT
**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Users/399942984024
**Заголовки запроса:** /
**Тело запроса:** 
```
{
  "id": 0,
  "userName": "string",
  "password": "string"
}
```
**Статус-код ответа:** 400 Error: Bad Request
**Тело ответа:** 
```
{
  "type": "https://tools.ietf.org/html/rfc7231#section-6.5.1",
  "title": "One or more validation errors occurred.",
  "status": 400,
  "traceId": "00-29c800a9b7bd8e4d8bc15ec0e7044ae1-e74b0b9755e76247-00",
  "errors": {
    "id": [
      "The value '399942984024' is not valid."
    ]
  }
}
```
### 43. DELETE /api/v1/Users/{id}

**HTTP-метод:** DELETE
**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Users/2
**Заголовки запроса:**  _/_
**Тело запроса:** -
**Статус-код ответа:** 200 Success
**Тело ответа:** -

### 44. DELETE ​/api/v1/Users/{id}

**HTTP-метод:** DELETE
**URL запроса:**  https://fakerestapi.azurewebsites.net/api/v1/Users/26374284792
**Заголовки запроса:** */*
**Тело запроса:** -
**Статус-код ответа:** 400 Error: Bad Request
**Тело ответа:** 
```
{
  "type": "https://tools.ietf.org/html/rfc7231#section-6.5.1",
  "title": "One or more validation errors occurred.",
  "status": 400,
  "traceId": "00-6b5e1a646b48294e8f6445d9c975e930-df79bfa8bde7c54a-00",
  "errors": {
    "id": [
      "The value '26374284792' is not valid."
    ]
  }
}

