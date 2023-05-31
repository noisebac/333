# Tests API in Postman

##  1 GET/api/v1/Activities

**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Activities

**Ожидаемый результат:** Статус код ответа 200 ОК, получен список активностей.

**Заголовки запроса(Request Headers):**

 User-Agent: PostmanRuntime/7.32.2
Accept: */*
Cache-Control: no-cache
Postman-Token: 5f4c8386-c46e-49b1-9a64-24fac4b79157
Host: fakerestapi.azurewebsites.net
Accept-Encoding: gzip, deflate, br
Connection: keep-alive

**Заголовки ответа(Response Headers):**

Content-Type: application/json; charset=utf-8; v=1.0
Date: Wed, 24 May 2023 12:40:27 GMT
Server: Kestrel
Transfer-Encoding: chunked
api-supported-versions: 1.0

**Тело ответа(Response Body):**

 {
        "id": 1,
        "title": "Activity 1",
        "dueDate": "2023-05-24T14:16:09.2030883+00:00",
        "completed": false
    },
    {
        "id": 2,
        "title": "Activity 2",
        "dueDate": "2023-05-24T15:16:09.2030908+00:00",
        "completed": true
    },
    {
        "id": 3,
        "title": "Activity 3",
        "dueDate": "2023-05-24T16:16:09.2030912+00:00",
        "completed": false
    },.......

**Статус код ответа:** 200 OK

##  2 POST/api/v1/Activities (valid)

**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Activities

**Ожидаемый результат:** Статус код ответа 200 

**Заголовки запроса(Request Headers):**

Content-Type: application/json
User-Agent: PostmanRuntime/7.32.2
Accept: */*
Cache-Control: no-cache
Postman-Token: 3ce096c3-3264-47e8-bd41-7372edcd7230
Host: fakerestapi.azurewebsites.net
Accept-Encoding: gzip, deflate, br
Connection: keep-alive

**Тело запроса(Request Body)**

{
 "id": 1,
 "title": "new",
 "dueDate": "2023-05-21T07:13:41.465Z",
 "completed": true
}

**Заголовки ответа(Response Headers):**

Content-Type: application/json; charset=utf-8; v=1.0
Date: Thu, 25 May 2023 13:46:02 GMT
Server: Kestrel
Transfer-Encoding: chunked
api-supported-versions: 1.0
 
**Тело ответа(Response Body):**

{
    "id": 1,
    "title": "new",
    "dueDate": "2023-05-21T07:13:41.465Z",
    "completed": true
   } 

**Статус код ответа:** 200 OK

##  3 GET/api/v1/Activities/{id} (valid)

**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Activities/1

**Ожидаемый результат:** Запрос успешно отправлен. Статус код ответа 200 ОК.

**Заголовки запроса(Request Headers):**


 User-Agent: PostmanRuntime/7.32.2
Accept: */*
Accept-Encoding: gzip, deflate, br
Connection: keep-alive

**Заголовки ответа(Response Headers):**

Content-Type: application/json; charset=utf-8; v=1.0
Date: Wed, 24 May 2023 13:41:54 GMT
Server: Kestrel
Transfer-Encoding: chunked
api-supported-versions: 1.0
 
**Тело ответа(Response Body):**

  {
"id":1,
"title":"Activity 1",
"dueDate":"2023-05-24T14:41:54.9840605+00:00",
"completed":false
}

**Статус код ответа:** 200 OK

##  4 PUT/api/v1/Activities/{id} (valid)

**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Activities/1

**Ожидаемый результат:** Запрос успешно отправлен. Статус код ответа 200 ОК.

**Заголовки запроса(Request Headers):**

 Content-Type: application/json
User-Agent: PostmanRuntime/7.32.2
Accept: */*
Cache-Control: no-cache
Postman-Token: d8893f4c-8d73-487d-89dc-b9b67fbf1ea7
Host: fakerestapi.azurewebsites.net
Accept-Encoding: gzip, deflate, br
Connection: keep-alive

**Тело запроса(Request Body)**
{

 "id": 1,

 "title": "New title",

 "dueDate": "2023-05-23T12:17:00.757Z",

 "completed": true

}

**Заголовки ответа(Response Headers):**

Content-Type: application/json; charset=utf-8; v=1.0
Date: Wed, 24 May 2023 13:54:00 GMT
Server: Kestrel
Transfer-Encoding: chunked
api-supported-versions: 1.0
 
**Тело ответа(Response Body):**

  {
"id":1,
"title":"New title",
"dueDate":"2023-05-23T12:17:00.757Z",
"completed":true
}

**Статус код ответа:** 200 OK

##  5 POST/api/v1/Activities (empty title)

**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Activities

**Ожидаемый результат:** Статус-код ответа 400

**Заголовки запроса(Request Headers):**

Content-Type: application/json
User-Agent: PostmanRuntime/7.32.2
Accept: */*
Cache-Control: no-cache
Postman-Token: e6f375ef-b31b-457f-b628-7f9bb1defd2d
Host: fakerestapi.azurewebsites.net
Accept-Encoding: gzip, deflate, br
Connection: keep-alive

**Тело запроса(Request Body)**
{
 "id": 1,
 "title": ,
 "dueDate": "2023-05-21T07:13:41.465Z",
 "completed": true
}

**Заголовки ответа(Response Headers):**

Content-Type: application/problem+json; charset=utf-8
Date: Thu, 25 May 2023 13:51:41 GMT
Server: Kestrel
Transfer-Encoding: chunked
 
**Тело ответа(Response Body):**

{
    "type": "https://tools.ietf.org/html/rfc7231#section-6.5.1",
    "title": "One or more validation errors occurred.",
    "status": 400,
    "traceId": "00-ab3357557e79d04e8f46cb4aba5cb8f6-b350d84d3cc9db47-00",
    "errors": {
        "$.title": [
            "',' is an invalid start of a value. Path: $.title | LineNumber: 4 | BytePositionInLine: 10."
        ]
    }
}

**Статус код ответа:** 400 Bad Request

##  6 GET/api/v1/Activities/{id} (zero id)

**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Activities/0

**Ожидаемый результат:** Запрос успешно отправлен. Статус код ответа 404.

**Заголовки запроса(Request Headers):**

 User-Agent: PostmanRuntime/7.32.2
Accept: */*
Cache-Control: no-cache
Postman-Token: dd5a137d-3397-44ff-9764-221a8ff71957
Host: fakerestapi.azurewebsites.net
Accept-Encoding: gzip, deflate, br
Connection: keep-alive

**Заголовки ответа(Response Headers):**

Content-Type: application/problem+json; charset=utf-8; v=1.0
Date: Wed, 24 May 2023 14:00:31 GMT
Server: Kestrel
Transfer-Encoding: chunked
api-supported-versions: 1.0
 
**Тело ответа(Response Body):**

  {
    "type": "https://tools.ietf.org/html/rfc7231#section-6.5.4",
    "title": "Not Found",
    "status": 404,
    "traceId": "00-c925691d0e1be54bb075fa1c50fbb077-7e079d014c67034d-00"
}

**Статус код ответа:** 404 Not Found

##  7 PUT/api/v1/Activities/{id} (invalid)

**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Activities/1

**Ожидаемый результат:** Запрос успешно отправлен. Статус код ответа 400.

**Заголовки запроса(Request Headers):**

 Content-Type: application/json
User-Agent: PostmanRuntime/7.32.2
Accept: */*
Cache-Control: no-cache
Postman-Token: 51949149-b698-4454-b3aa-235dc6690a56
Host: fakerestapi.azurewebsites.net
Accept-Encoding: gzip, deflate, br
Connection: keep-alive

**Тело запроса(Request Body)**

{

 "id": 1,

 "title": ,

 "dueDate": "2023-05-21T11:03:28.571Z",

 "completed": true

}

**Заголовки ответа(Response Headers):**

Content-Type: application/problem+json; charset=utf-8
Date: Wed, 24 May 2023 14:08:31 GMT
Server: Kestrel
Transfer-Encoding: chunked
 
**Тело ответа(Response Body):**

  {
    "type": "https://tools.ietf.org/html/rfc7231#section-6.5.1",
    "title": "One or more validation errors occurred.",
    "status": 400,
    "traceId": "00-aef49f14df612741b9a2275c982634ca-dc1d0b4c938f9749-00",
    "errors": {
        "$.title": [
            "',' is an invalid start of a value. Path: $.title | LineNumber: 4 | BytePositionInLine: 10."
        ]
    }
}

**Статус код ответа:** 400 Bad Request

##  8 DELETE/api/v1/Activities/{id}

**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Activities/1

**Ожидаемый результат:** Запрос успешно отправлен. Статус код ответа 200 ОК.

**Заголовки запроса(Request Headers):**

 User-Agent: PostmanRuntime/7.32.2
Accept: */*
Cache-Control: no-cache
Postman-Token: b37faa1d-97e2-4a6c-8a5e-d939b2a91875
Host: fakerestapi.azurewebsites.net
Accept-Encoding: gzip, deflate, br
Connection: keep-alive

**Заголовки ответа(Response Headers):**

Content-Length: 0
Date: Wed, 24 May 2023 14:14:10 GMT
Server: Kestrel
api-supported-versions: 1.0
 
**Статус код ответа:** 200 OK

##  9 GET/api/v1/Authors

**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Authors

**Ожидаемый результат:** Статус код ответа 200 ОК, получен список авторов.

**Заголовки запроса(Request Headers):**

 User-Agent: PostmanRuntime/7.32.2
Accept: */*
Cache-Control: no-cache
Postman-Token: 0ba0c81a-f74c-4aaa-9854-61f911306b10
Host: fakerestapi.azurewebsites.net
Accept-Encoding: gzip, deflate, br
Connection: keep-alive

**Заголовки ответа(Response Headers):**

Content-Type: application/json; charset=utf-8; v=1.0
Date: Wed, 24 May 2023 14:16:29 GMT
Server: Kestrel
Transfer-Encoding: chunked
api-supported-versions: 1.0
 
**Тело ответа(Response Body):**

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
...


**Статус код ответа:** 200 OK


##  10 POST/api/v1/Authors

**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Authors

**Ожидаемый результат:** Статус код ответа 200 ОK.

**Заголовки запроса(Request Headers):**

 Content-Type: application/json
User-Agent: PostmanRuntime/7.32.2
Accept: */*
Cache-Control: no-cache
Postman-Token: 6e29e357-a18b-449c-97b0-af8bfd9f7898
Host: fakerestapi.azurewebsites.net
Accept-Encoding: gzip, deflate, br
Connection: keep-alive

**Тело запроса(Request Body)**
{

 "id": 1,

 "idBook": 1,

 "firstName": "Name",

 "lastName": "Surname"

}

**Заголовки ответа(Response Headers):**

Content-Type: application/json; charset=utf-8; v=1.0
Date: Wed, 24 May 2023 14:26:21 GMT
Server: Kestrel
Transfer-Encoding: chunked
api-supported-versions: 1.0
 
**Тело ответа(Response Body):**

  {
    "id": 1,
    "idBook": 1,
    "firstName": "Name",
    "lastName": "Surname"
}


**Статус код ответа:** 200 OK

##  11 POST/api/v1/Authors (invalid)

**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Authors

**Ожидаемый результат:** Статус код ответа 400.

**Заголовки запроса(Request Headers):**

 Content-Type: application/json
User-Agent: PostmanRuntime/7.32.2
Accept: */*
Cache-Control: no-cache
Postman-Token: 7747e738-294a-4c92-94fb-a48d282d26bd
Host: fakerestapi.azurewebsites.net
Accept-Encoding: gzip, deflate, br
Connection: keep-alive

**Тело запроса(Request Body)**

{

 "id": 1,

 "idBook": 1,

 "firstName": ,

 "lastName": "Surname"

}

**Заголовки ответа(Response Headers):**

Content-Type: application/problem+json; charset=utf-8
Date: Wed, 24 May 2023 14:39:38 GMT
Server: Kestrel
Transfer-Encoding: chunked
 
**Тело ответа(Response Body):**

 {
    "type": "https://tools.ietf.org/html/rfc7231#section-6.5.1",
    "title": "One or more validation errors occurred.",
    "status": 400,
    "traceId": "00-f734a34eb1eab94392e6e4b32f397699-5c537dfbd92c9a4d-00",
    "errors": {
        "$.firstName": [
            "',' is an invalid start of a value. Path: $.firstName | LineNumber: 6 | BytePositionInLine: 14."
        ]
    }
}

**Статус код ответа:** 400 Bad Request

##  12 GET/api/v1/Authors/authors/books/1.

**URL запроса:** ttps://fakerestapi.azurewebsites.net/api/v1/Authors/authors/books/1

**Ожидаемый результат:** Статус код ответа 200 ОК.

**Заголовки запроса(Request Headers):**

 User-Agent: PostmanRuntime/7.32.2
Accept: */*
Cache-Control: no-cache
Postman-Token: 60c3e56a-ed3f-4574-b521-078a810f3f42
Host: fakerestapi.azurewebsites.net
Accept-Encoding: gzip, deflate, br
Connection: keep-alive

**Заголовки ответа(Response Headers):**

Content-Type: application/json; charset=utf-8; v=1.0
Date: Wed, 24 May 2023 14:46:56 GMT
Server: Kestrel
Transfer-Encoding: chunked
api-supported-versions: 1.0
 
**Тело ответа(Response Body):**

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
    }
]

**Статус код ответа:** 200 OK

##  13 GET/api/v1/Authors/authors/books/0 `(ПРОВАЛ)`

**URL запроса:** ttps://fakerestapi.azurewebsites.net/api/v1/Authors/authors/books/0

**Ожидаемый результат:** `Статус код ответа 404 (книга с нулевым id не найдена)`

**Заголовки запроса(Request Headers):**

 User-Agent: PostmanRuntime/7.32.2
Accept: */*
Cache-Control: no-cache
Postman-Token: 530a574d-8cb8-405f-bd81-0db996f03251
Host: fakerestapi.azurewebsites.net
Accept-Encoding: gzip, deflate, br
Connection: keep-alive

**Заголовки ответа(Response Headers):**

Content-Type: application/json; charset=utf-8; v=1.0
Date: Wed, 24 May 2023 14:49:31 GMT
Server: Kestrel
Transfer-Encoding: chunked
api-supported-versions: 1.0

**Тело ответа(Response Body):** 

[]

**Статус код ответа:** `200 OK`   

##  14 GET/api/v1/Authors/1

**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Authors/1

**Ожидаемый результат:** Статус код ответа 200 ОК.

**Заголовки запроса(Request Headers):**

 User-Agent: PostmanRuntime/7.32.2
Accept: */*
Cache-Control: no-cache
Postman-Token: 955fff3f-548b-41e5-97e7-0142cf28bf04
Host: fakerestapi.azurewebsites.net
Accept-Encoding: gzip, deflate, br
Connection: keep-alive

**Заголовки ответа(Response Headers):**

Content-Type: application/json; charset=utf-8; v=1.0
Date: Wed, 24 May 2023 14:54:01 GMT
Server: Kestrel
Transfer-Encoding: chunked
api-supported-versions: 1.0
 
**Тело ответа(Response Body):**

  {
    "id": 1,
    "idBook": 1,
    "firstName": "First Name 1",
    "lastName": "Last Name 1"
}

**Статус код ответа:** 200 OK

##  15 GET/api/v1/Authors/0

**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Authors/0

**Ожидаемый результат:** Статус код ответа 404.

**Заголовки запроса(Request Headers):**

 User-Agent: PostmanRuntime/7.32.2
Accept: */*
Cache-Control: no-cache
Postman-Token: 722a7343-4cf2-49fe-8d49-ca4782f77344
Host: fakerestapi.azurewebsites.net
Accept-Encoding: gzip, deflate, br
Connection: keep-alive

**Заголовки ответа(Response Headers):**

Content-Type: application/problem+json; charset=utf-8; v=1.0
Date: Wed, 24 May 2023 14:56:51 GMT
Server: Kestrel
Transfer-Encoding: chunked
api-supported-versions: 1.0

**Тело ответа(Response Body):**

 {
    "type": "https://tools.ietf.org/html/rfc7231#section-6.5.4",
    "title": "Not Found",
    "status": 404,
    "traceId": "00-88c2df0a3339d44ba0541b274135f15b-264c295552d01249-00"
}

**Статус код ответа:** 404 Not Found

##  16 PUT/api/v1/Authors/1

**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Authors/1

**Ожидаемый результат:** Статус код ответа 200 ОK.

**Заголовки запроса(Request Headers):**

 Content-Type: application/json
User-Agent: PostmanRuntime/7.32.2
Accept: */*
Cache-Control: no-cache
Postman-Token: 4898657c-dbd7-45ce-b673-663fa6c10bc5
Host: fakerestapi.azurewebsites.net
Accept-Encoding: gzip, deflate, br
Connection: keep-alive

**Тело запроса(Request Body)**
{

 "id": 1,

 "idBook": 1,

 "firstName": "New",

 "lastName": "New"

}

**Заголовки ответа(Response Headers):**

Content-Type: application/json; charset=utf-8; v=1.0
Date: Wed, 24 May 2023 15:01:40 GMT
Server: Kestrel
Transfer-Encoding: chunked
api-supported-versions: 1.0
 
**Тело ответа(Response Body):**

  {
    "id": 1,
    "idBook": 1,
    "firstName": "New",
    "lastName": "New"
}

**Статус код ответа:** 200 OK

##  17 PUT/api/v1/Authors/1 (invalid)

**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Authors/1

**Ожидаемый результат:** Статус код ответа 400.

**Заголовки запроса(Request Headers):**

 Content-Type: application/json
User-Agent: PostmanRuntime/7.32.2
Accept: */*
Cache-Control: no-cache
Postman-Token: c2b74d60-85c7-4b34-8e21-d85f45d30abb
Host: fakerestapi.azurewebsites.net
Accept-Encoding: gzip, deflate, br
Connection: keep-alive

**Тело запроса(Request Body)**
{

 "id": 1,

 "idBook": 1,

 "firstName": ,

 "lastName": "New"

}

**Заголовки ответа(Response Headers):**

Content-Type: application/problem+json; charset=utf-8
Date: Wed, 24 May 2023 15:05:34 GMT
Server: Kestrel
Transfer-Encoding: chunked
 
**Тело ответа(Response Body):**
  {
    "type": "https://tools.ietf.org/html/rfc7231#section-6.5.1",
    "title": "One or more validation errors occurred.",
    "status": 400,
    "traceId": "00-9330236d3887d641938bc98cef94bdc7-2a67785831aff24a-00",
    "errors": {
        "$.firstName": [
            "',' is an invalid start of a value. Path: $.firstName | LineNumber: 6 | BytePositionInLine: 14."
        ]
    }
}

**Статус код ответа:** 400 Bad Request

##  18 DELETE/api/v1/Authors/1

**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Authors/1

**Ожидаемый результат:** Статус код ответа 200 ОК.

**Заголовки запроса(Request Headers):**

 User-Agent: PostmanRuntime/7.32.2
Accept: */*
Cache-Control: no-cache
Postman-Token: a2239cdc-4cd8-44d5-bc1f-aecf039cf293
Host: fakerestapi.azurewebsites.net
Accept-Encoding: gzip, deflate, br
Connection: keep-alive

**Заголовки ответа(Response Headers):**

Content-Length: 0
Date: Wed, 24 May 2023 15:08:16 GMT
Server: Kestrel
api-supported-versions: 1.0
 
**Статус код ответа:** 200 OK

##  19 GET/api/v1/Books

**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/

**Ожидаемый результат:** Статус код ответа 200 ОК.

**Заголовки запроса(Request Headers):**

User-Agent: PostmanRuntime/7.32.2
Accept: */*
Cache-Control: no-cache
Postman-Token: 8039016e-f586-4e3f-83b7-1bcba57520fa
Host: fakerestapi.azurewebsites.net
Accept-Encoding: gzip, deflate, br
Connection: keep-alive

**Заголовки ответа(Response Headers):**

Content-Type: application/json; charset=utf-8; v=1.0
Date: Thu, 25 May 2023 10:29:45 GMT
Server: Kestrel
Transfer-Encoding: chunked
api-supported-versions: 1.0
 
**Тело ответа(Response Body):**
  
   {
        "id": 1,
        "title": "Book 1",
        "description": "Lorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\n",
        "pageCount": 100,
        "excerpt": "Lorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\n",
        "publishDate": "2023-05-24T10:29:46.0866985+00:00"
    },
    {
        "id": 2,
        "title": "Book 2",
        "description": "Lorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\n",
        "pageCount": 200,
        "excerpt": "Lorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\n",
        "publishDate": "2023-05-23T10:29:46.0867131+00:00"
    },..................

**Статус код ответа:** 200 OK

##  20 GET/api/v1/Books/34

**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/

**Ожидаемый результат:** Статус код ответа 200 ОК.

**Заголовки запроса(Request Headers):**

User-Agent: PostmanRuntime/7.32.2
Accept: */*
Cache-Control: no-cache
Postman-Token: 22981310-2169-459a-9d93-9c9f8998cd31
Host: fakerestapi.azurewebsites.net
Accept-Encoding: gzip, deflate, br
Connection: keep-alive
 
**Заголовки ответа(Response Headers):**

Content-Type: application/json; charset=utf-8; v=1.0
Date: Thu, 25 May 2023 10:31:26 GMT
Server: Kestrel
Transfer-Encoding: chunked
api-supported-versions: 1.0
 
**Тело ответа(Response Body):**
  
"id": 34,
    "title": "Book 34",
    "description": "Lorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\n",
    "pageCount": 3400,
    "excerpt": "Lorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\n",
    "publishDate": "2023-04-21T10:31:27.2463924+00:00"
}

**Статус код ответа:** 200 OK

##  21 GET/api/v1/Books/234

**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/

**Ожидаемый результат:** Статус-код ответа 404, книга не найдена .

**Заголовки запроса(Request Headers):**

User-Agent: PostmanRuntime/7.32.2
Accept: */*
Cache-Control: no-cache
Postman-Token: 08898b78-825d-4215-a9c6-ff7ff33ff728
Host: fakerestapi.azurewebsites.net
Accept-Encoding: gzip, deflate, br
Connection: keep-alive
 

**Заголовки ответа(Response Headers):**

Content-Type: application/problem+json; charset=utf-8; v=1.0
Date: Thu, 25 May 2023 10:32:25 GMT
Server: Kestrel
Transfer-Encoding: chunked
api-supported-versions: 1.0

 **Тело ответа(Response Body):**
  
{
    "type": "https://tools.ietf.org/html/rfc7231#section-6.5.4",
    "title": "Not Found",
    "status": 404,
    "traceId": "00-fe9bd2e52ddd5840bd63fa2e677fec82-b4c59e1156a0ab41-00"
}

**Статус код ответа:** 404 Not Found

##  22 PUT/api/v1/Books/22 (valid)

**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/

**Ожидаемый результат:** Статус код ответа 200 ОК.

**Заголовки запроса(Request Headers):**

Content-Type: application/json
User-Agent: PostmanRuntime/7.32.2
Accept: */*
Cache-Control: no-cache
Postman-Token: e80c78ff-a158-4a75-ac63-c6f652915723
Host: fakerestapi.azurewebsites.net
Accept-Encoding: gzip, deflate, br
Connection: keep-alive

**Тело запроса(Request Body)** 

{
  "id": 22,
  "title": "Chapter" ,
  "description": "string",
  "pageCount": 1,
  "excerpt": "string",
  "publishDate": "2023-05-25T09:33:15.238Z"
}

**Заголовки ответа(Response Headers):**

Content-Type: application/json; charset=utf-8; v=1.0
Date: Thu, 25 May 2023 10:37:34 GMT
Server: Kestrel
Transfer-Encoding: chunked
api-supported-versions: 1.0

**Тело ответа(Response Body):**
  
{
    "id": 22,
    "title": "Chapter",
    "description": "string",
    "pageCount": 1,
    "excerpt": "string",
    "publishDate": "2023-05-25T09:33:15.238Z"
}

**Статус код ответа:** 200 OK

##  23 PUT/api/v1/Books/22 (empty title)

**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/

**Ожидаемый результат:**  Статус-код ответа 400

**Заголовки запроса(Request Headers):**

Content-Type: application/json
User-Agent: PostmanRuntime/7.32.2
Accept: */*
Cache-Control: no-cache
Postman-Token: a01d2377-650e-45cc-9dbe-c7bfd114b27b
Host: fakerestapi.azurewebsites.net
Accept-Encoding: gzip, deflate, br
Connection: keep-alive

**Тело запроса(Request Body)**

 {
  "id": 22,
 "title":  
 "description": "string",
 "pageCount": 0,
 "excerpt": "string",
 "publishDate": "2023-05-24T05:53:47.094Z"

**Заголовки ответа(Response Headers):**

Content-Type: application/problem+json; charset=utf-8
Date: Thu, 25 May 2023 10:44:00 GMT
Server: Kestrel
Transfer-Encoding: chunked
 
**Тело ответа(Response Body):**
  
{
    "type": "https://tools.ietf.org/html/rfc7231#section-6.5.1",
    "title": "One or more validation errors occurred.",
    "status": 400,
    "traceId": "00-8e0fea72e702df4a8d55feee9f03bf93-892ebf0b7c26884a-00",
    "errors": {
        "$": [
            "The JSON value could not be converted to FakeRestAPI.Models.Book. Path: $ | LineNumber: 0 | BytePositionInLine: 5."
        ]
    }
}

**Статус код ответа:**  400 Bad Request


## 24 POST/api/v1/Books (valid)

**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Books?pageCount=5

**Ожидаемый результат:** Статус код ответа 200.

**Заголовки запроса(Request Headers):**

 Content-Type: application/json
User-Agent: PostmanRuntime/7.32.2
Accept: */*
Cache-Control: no-cache
Postman-Token: eb171503-86e6-444b-abfd-a1386b1fe9ef
Host: fakerestapi.azurewebsites.net
Accept-Encoding: gzip, deflate, br
Connection: keep-alive

**Тело запроса(Request Body)**

{

 "id": 5,

 "title": "string",

 "description": "string",

 "pageCount": 5,

 "excerpt": "string",

 "publishDate": "2023-05-22T19:42:44.056Z"

}

**Заголовки ответа(Response Headers):**

Content-Type: application/json; charset=utf-8; v=1.0
Date: Wed, 24 May 2023 15:20:18 GMT
Server: Kestrel
Transfer-Encoding: chunked
api-supported-versions: 1.0

**Тело ответа(Response Body):**
  {
    "id": 5,
    "title": "string",
    "description": "string",
    "pageCount": 5,
    "excerpt": "string",
    "publishDate": "2023-05-22T19:42:44.056Z"
}

**Статус код ответа:** 200 OK

## 25 POST/api/v1/Books (zero id)

**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Books

**Ожидаемый результат:** Статус код ответа 400.

**Заголовки запроса(Request Headers):**

 Content-Type: application/json
User-Agent: PostmanRuntime/7.32.2
Accept: */*
Cache-Control: no-cache
Postman-Token: 128bb19c-b846-499a-b9c9-982532360d93
Host: fakerestapi.azurewebsites.net
Accept-Encoding: gzip, deflate, br
Connection: keep-alive

**Тело запроса(Request Body)**

{

 "id": ,

 "title": "string",

 "description": "string",

 "pageCount": 0,

 "excerpt": "string",

 "publishDate": "2023-05-22T19:47:42.645Z"

}

**Заголовки ответа(Response Headers):**

Content-Type: application/problem+json; charset=utf-8
Date: Wed, 24 May 2023 15:24:50 GMT
Server: Kestrel
Transfer-Encoding: chunked

**Тело ответа(Response Body):**
  {
    "type": "https://tools.ietf.org/html/rfc7231#section-6.5.1",
    "title": "One or more validation errors occurred.",
    "status": 400,
    "traceId": "00-5a0da2f72d8c7747a7f493487a7f5e2c-40f6e0c192ea1a47-00",
    "errors": {
        "$.id": [
            "',' is an invalid start of a value. Path: $.id | LineNumber: 2 | BytePositionInLine: 7."
        ]
    }
}

**Статус код ответа:** 400 Bad Request

##  26 DELETE/api/v1/Books/{id}

**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Books/9

**Ожидаемый результат:** Статус код ответа 200 ОК.

**Заголовки запроса(Request Headers):**

User-Agent: PostmanRuntime/7.32.2
Accept: */*
Cache-Control: no-cache
Postman-Token: 310f3990-aea2-4354-a5d7-312c090634db
Host: fakerestapi.azurewebsites.net
Accept-Encoding: gzip, deflate, br
Connection: keep-alive
 

**Заголовки ответа(Response Headers):**

Content-Length: 0
Date: Wed, 24 May 2023 15:29:07 GMT
Server: Kestrel
api-supported-versions: 1.0

**Статус код ответа:** 200 OK

## 27 GET/api/v1/CoverPhotos/12

**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/CoverPhotos/12

**Ожидаемый результат:** Статус код ответа 200 ОК.

**Заголовки запроса(Request Headers):**

 User-Agent: PostmanRuntime/7.32.2
Accept: */*
Cache-Control: no-cache
Postman-Token: 1295588c-d83f-4c90-bba6-b53513c89aee
Host: fakerestapi.azurewebsites.net
Accept-Encoding: gzip, deflate, br
Connection: keep-alive

**Заголовки ответа(Response Headers):**

Content-Type: application/json; charset=utf-8; v=1.0
Date: Wed, 24 May 2023 15:32:56 GMT
Server: Kestrel
Transfer-Encoding: chunked
api-supported-versions: 1.0
 
**Тело ответа(Response Body):**
  {
    "id": 12,
    "idBook": 12,
    "url": "https://placeholdit.imgix.net/~text?txtsize=33&txt=Book 12&w=250&h=350"
}

**Статус код ответа:** 200 OK

## 28 GET/api/v1/CoverPhotos/books/covers/124658735775

**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/CoverPhotos/books/covers/124658735775

**Ожидаемый результат:** Статус код ответа 400.

**Заголовки запроса(Request Headers):**

 User-Agent: PostmanRuntime/7.32.2
Accept: */*
Cache-Control: no-cache
Postman-Token: 56d31df3-7549-441a-b76a-957cbdb6ab27
Host: fakerestapi.azurewebsites.net
Accept-Encoding: gzip, deflate, br
Connection: keep-alive

**Заголовки ответа(Response Headers):**

Content-Type: application/problem+json; charset=utf-8
Date: Wed, 24 May 2023 15:36:49 GMT
Server: Kestrel
Transfer-Encoding: chunked

 
**Тело ответа(Response Body):**
  
{
    "type": "https://tools.ietf.org/html/rfc7231#section-6.5.1",
    "title": "One or more validation errors occurred.",
    "status": 400,
    "traceId": "00-402fc04815963445b61796b67164c0ed-1b8629538773f645-00",
    "errors": {
        "idBook": [
            "The value '124658735775' is not valid."
        ]
    }
}

**Статус код ответа:** 400 Bad Request

## 29 GET/api/v1/CoverPhotos

**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/CoverPhotos

**Ожидаемый результат:** Статус код ответа 200 ОК.

**Заголовки запроса(Request Headers):**

User-Agent: PostmanRuntime/7.32.2
Accept: */*
Cache-Control: no-cache
Postman-Token: e112c871-c8d3-4b06-a077-f95279984f54
Host: fakerestapi.azurewebsites.net
Accept-Encoding: gzip, deflate, br
Connection: keep-alive
 
**Заголовки ответа(Response Headers):**

Content-Type: application/json; charset=utf-8; v=1.0
Date: Wed, 24 May 2023 15:38:09 GMT
Server: Kestrel
Transfer-Encoding: chunked
api-supported-versions: 1.0

**Тело ответа(Response Body):**

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


**Статус код ответа:** 200 OK

## 30 GET/api/v1/CoverPhotos/books/covers/124

**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/CoverPhotos/books/covers/124

**Ожидаемый результат:** Статус код ответа 200 ОК.

**Заголовки запроса(Request Headers):**

User-Agent: PostmanRuntime/7.32.2
Accept: */*
Cache-Control: no-cache
Postman-Token: 83eb1da4-77b7-41d2-8711-a7b4ba394f02
Host: fakerestapi.azurewebsites.net
Accept-Encoding: gzip, deflate, br
Connection: keep-alive
 
**Заголовки ответа(Response Headers):**

Content-Type: application/json; charset=utf-8; v=1.0
Date: Wed, 24 May 2023 15:42:35 GMT
Server: Kestrel
Transfer-Encoding: chunked
api-supported-versions: 1.0

**Тело ответа(Response Body):**

  [
    {
        "id": 124,
        "idBook": 124,
        "url": "https://placeholdit.imgix.net/~text?txtsize=33&txt=Book 124&w=250&h=350"
    }
]

**Статус код ответа:** 200 OK

## 31 GET/api/v1/CoverPhotos/0

**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/CoverPhotos/0

**Ожидаемый результат:** Статус код ответа 404.

**Заголовки запроса(Request Headers):**

User-Agent: PostmanRuntime/7.32.2
Accept: */*
Cache-Control: no-cache
Postman-Token: 1ab6277e-c43b-4525-bae6-bfe0a80f9c8c
Host: fakerestapi.azurewebsites.net
Accept-Encoding: gzip, deflate, br
Connection: keep-alive
 
**Заголовки ответа(Response Headers):**

Content-Type: application/problem+json; charset=utf-8; v=1.0
Date: Wed, 24 May 2023 15:44:35 GMT
Server: Kestrel
Transfer-Encoding: chunked
api-supported-versions: 1.0

**Тело ответа(Response Body):**

  {
    "type": "https://tools.ietf.org/html/rfc7231#section-6.5.4",
    "title": "Not Found",
    "status": 404,
    "traceId": "00-c7df3d7122011748b5145cfbcc50e2f9-7620357aa60ed54a-00"
}

**Статус код ответа:** 404 Not Found

## 32 PUT/api/v1/CoverPhotos/14534

**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/CoverPhotos/14534

**Ожидаемый результат:** Статус код ответа 400.

**Заголовки запроса(Request Headers):**

 Content-Type: application/json
User-Agent: PostmanRuntime/7.32.2
Accept: */*
Cache-Control: no-cache
Postman-Token: ba74cc97-4a3b-4859-b07f-73df8902ac84
Host: fakerestapi.azurewebsites.net
Accept-Encoding: gzip, deflate, br
Connection: keep-alive

**Тело запроса(Request Body)**

{

 "id": book,

 "idBook": 6/1,

 "url": "string"

}

**Заголовки ответа(Response Headers):**

Content-Type: application/problem+json; charset=utf-8
Date: Wed, 24 May 2023 15:47:50 GMT
Server: Kestrel
Transfer-Encoding: chunked

**Тело ответа(Response Body):**

  {
    "type": "https://tools.ietf.org/html/rfc7231#section-6.5.1",
    "title": "One or more validation errors occurred.",
    "status": 400,
    "traceId": "00-d52f893a89e5e44faf6dcb3e6e617943-10abe0edc8e47a47-00",
    "errors": {
        "$.id": [
            "'b' is an invalid start of a value. Path: $.id | LineNumber: 2 | BytePositionInLine: 7."
        ]
    }
}

**Статус код ответа:** 400 Bad Request

## 33 PUT/api/v1/CoverPhotos/22

**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/CoverPhotos/22

**Ожидаемый результат:** Статус код ответа 200.

**Заголовки запроса(Request Headers):**

Content-Type: application/json
User-Agent: PostmanRuntime/7.32.2
Accept: */*
Cache-Control: no-cache
Postman-Token: 280f7d4e-8e6e-454c-86c7-32aaeacc23b4
Host: fakerestapi.azurewebsites.net
Accept-Encoding: gzip, deflate, br
Connection: keep-alive
 
**Тело запроса(Request Body)**

{

 "id": 22,

 "idBook": 22,

 "url": "string"

}

**Заголовки ответа(Response Headers):**

Content-Type: application/json; charset=utf-8; v=1.0
Date: Wed, 24 May 2023 15:52:32 GMT
Server: Kestrel
Transfer-Encoding: chunked
api-supported-versions: 1.0

**Тело ответа(Response Body):**

  {
    "id": 22,
    "idBook": 22,
    "url": "string"
}

**Статус код ответа:** 200 OK

## 34 POST/api/v1/CoverPhotos (invalid)

**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/CoverPhotos

**Ожидаемый результат:** Статус код ответа 400.

**Заголовки запроса(Request Headers):**

Content-Type: application/json
User-Agent: PostmanRuntime/7.32.2
Accept: */*
Cache-Control: no-cache
Postman-Token: 872c2a46-9cd8-432a-9b75-3b03d9a7dff8
Host: fakerestapi.azurewebsites.net
Accept-Encoding: gzip, deflate, br
Connection: keep-alive

**Тело запроса(Request Body)**

{

 "id": ,

 "idBook": 0,

 "url": "string"

}

**Заголовки ответа(Response Headers):**

Content-Type: application/problem+json; charset=utf-8
Date: Wed, 24 May 2023 15:54:49 GMT
Server: Kestrel
Transfer-Encoding: chunked

**Тело ответа(Response Body):**

  {
    "type": "https://tools.ietf.org/html/rfc7231#section-6.5.1",
    "title": "One or more validation errors occurred.",
    "status": 400,
    "traceId": "00-72ba2850bc8ff240b9d6ae91fc235c42-03c7090cbf9aeb42-00",
    "errors": {
        "$.id": [
            "',' is an invalid start of a value. Path: $.id | LineNumber: 2 | BytePositionInLine: 7."
        ]
    }
}

**Статус код ответа:** 400 Bad Request

## 35 POST/api/v1/CoverPhotos 

**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/CoverPhotos

**Ожидаемый результат:** Статус код ответа 200

**Заголовки запроса(Request Headers):**

Content-Type: application/json
User-Agent: PostmanRuntime/7.32.2
Accept: */*
Cache-Control: no-cache
Postman-Token: c8d9d162-2176-4598-8126-de886efcd9d0
Host: fakerestapi.azurewebsites.net
Accept-Encoding: gzip, deflate, br
Connection: keep-alive


**Тело запроса(Request Body)**

{

 "id": 78,

 "idBook": 16,

 "url": "string"

}

**Заголовки ответа(Response Headers):**

Content-Type: application/json; charset=utf-8; v=1.0
Date: Wed, 24 May 2023 15:58:22 GMT
Server: Kestrel
Transfer-Encoding: chunked
api-supported-versions: 1.0

**Тело ответа(Response Body):**

  {
    "id": 78,
    "idBook": 16,
    "url": "string"
}

**Статус код ответа:** 200 OK

## 36 DELETE/api/v1/CoverPhotos/88

**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/CoverPhotos/88

**Ожидаемый результат:** Статус код ответа 200 ОК

**Заголовки запроса(Request Headers):**

User-Agent: PostmanRuntime/7.32.2
Accept: */*
Cache-Control: no-cache
Postman-Token: fcea4657-1a18-415c-970f-225fd7a45b12
Host: fakerestapi.azurewebsites.net
Accept-Encoding: gzip, deflate, br
Connection: keep-alive

**Заголовки ответа(Response Headers):**

Content-Length: 0
Date: Wed, 24 May 2023 16:03:23 GMT
Server: Kestrel
api-supported-versions: 1.0

**Статус код ответа:** 200 OK

## 37 GET/api/v1/Users/0

**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Users/0

**Ожидаемый результат:** Статус код ответа 404

**Заголовки запроса(Request Headers):**

 User-Agent: PostmanRuntime/7.32.2
Accept: */*
Cache-Control: no-cache
Postman-Token: cb171756-0464-4a98-9d69-9cbcffb45640
Host: fakerestapi.azurewebsites.net
Accept-Encoding: gzip, deflate, br
Connection: keep-alive

**Заголовки ответа(Response Headers):**

Content-Type: application/problem+json; charset=utf-8; v=1.0
Date: Wed, 24 May 2023 16:06:38 GMT
Server: Kestrel
Transfer-Encoding: chunked
api-supported-versions: 1.0
 
**Тело ответа(Response Body):**

{
    "type": "https://tools.ietf.org/html/rfc7231#section-6.5.4",
    "title": "Not Found",
    "status": 404,
    "traceId": "00-6d700afbe92ce14eb4df2c77981e204e-6dc73a9cc1893144-00"
}
  
**Статус код ответа:** 404 Not Found

## 38 GET/api/v1/Users

**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Users

**Ожидаемый результат:** Статус код ответа 200 ОК

**Заголовки запроса(Request Headers):**

 User-Agent: PostmanRuntime/7.32.2
Accept: */*
Cache-Control: no-cache
Postman-Token: 24def85c-ec8f-4e36-a487-b90d7fa1b936
Host: fakerestapi.azurewebsites.net
Accept-Encoding: gzip, deflate, br
Connection: keep-alive

**Заголовки ответа(Response Headers):**

Content-Type: application/json; charset=utf-8; v=1.0
Date: Wed, 24 May 2023 16:08:53 GMT
Server: Kestrel
Transfer-Encoding: chunked
api-supported-versions: 1.0
 
**Тело ответа(Response Body):**

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

**Статус код ответа:** 200 OK

## 39 GET/api/v1/Users/4

**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Users/4

**Ожидаемый результат:** Статус код ответа 200 ОК

**Заголовки запроса(Request Headers):**

User-Agent: PostmanRuntime/7.32.2
Accept: */*
Cache-Control: no-cache
Postman-Token: b7ec05b3-bb3c-4094-8910-4477d5a7289f
Host: fakerestapi.azurewebsites.net
Accept-Encoding: gzip, deflate, br
Connection: keep-alive
 

**Заголовки ответа(Response Headers):**

Content-Type: application/json; charset=utf-8; v=1.0
Date: Wed, 24 May 2023 16:10:08 GMT
Server: Kestrel
Transfer-Encoding: chunked
api-supported-versions: 1.0

**Тело ответа(Response Body):**

  {
    "id": 4,
    "userName": "User 4",
    "password": "Password4"
}

**Статус код ответа:** 200 OK

## 40 PUT/api/v1/Users/56

**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Users/56

**Ожидаемый результат:** Статус код ответа 200 ОК

**Заголовки запроса(Request Headers):**

Content-Type: application/json
User-Agent: PostmanRuntime/7.32.2
Accept: */*
Cache-Control: no-cache
Postman-Token: 8ac3e378-a139-44d5-8e3c-cd99648522f8
Host: fakerestapi.azurewebsites.net
Accept-Encoding: gzip, deflate, br
Connection: keep-alive

**Тело запроса(Request Body)**

 {

 "id": 56,

 "userName": "string",

 "password": "string"

}

**Заголовки ответа(Response Headers):**

Content-Type: application/json; charset=utf-8; v=1.0
Date: Wed, 24 May 2023 16:12:30 GMT
Server: Kestrel
Transfer-Encoding: chunked
api-supported-versions: 1.0
 
**Тело ответа(Response Body):**

  {
    "id": 56,
    "userName": "string",
    "password": "string"
}

**Статус код ответа:** 200 OK

## 41 PUT/api/v1/Users/5657393

**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Users/5657393

**Ожидаемый результат:** Статус код ответа 400

**Заголовки запроса(Request Headers):**

Content-Type: application/json
User-Agent: PostmanRuntime/7.32.2
Accept: */*
Cache-Control: no-cache
Postman-Token: 7afaaa19-f5d0-4cd4-b47c-6530808b61ff
Host: fakerestapi.azurewebsites.net
Accept-Encoding: gzip, deflate, br
Connection: keep-alive
 
**Тело запроса(Request Body)**

{

 "id": 56573е93,

 "userName": "string",

 "password": "string"

}

**Заголовки ответа(Response Headers):**

Content-Type: application/problem+json; charset=utf-8
Date: Wed, 24 May 2023 16:14:40 GMT
Server: Kestrel
Transfer-Encoding: chunked
 
**Тело ответа(Response Body):**
  {
    "type": "https://tools.ietf.org/html/rfc7231#section-6.5.1",
    "title": "One or more validation errors occurred.",
    "status": 400,
    "traceId": "00-a2d4d31c2daf4648991fa011cba41662-505770712603344f-00",
    "errors": {
        "$.id": [
            "'0xD0' is an invalid end of a number. Expected a delimiter. Path: $.id | LineNumber: 2 | BytePositionInLine: 12."
        ]
    }
}

**Статус код ответа:** 400 Bad Request

## 42 POST/api/v1/Users 

**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Users 

**Ожидаемый результат:** Статус код ответа 200

**Заголовки запроса(Request Headers):**

Content-Type: application/json
User-Agent: PostmanRuntime/7.32.2
Accept: */*
Cache-Control: no-cache
Postman-Token: 4bf76a84-683b-4a93-a7a3-67f31fbd4440
Host: fakerestapi.azurewebsites.net
Accept-Encoding: gzip, deflate, br
Connection: keep-alive
 
**Тело запроса(Request Body)**

{

 "id": 11,

 "userName": "Name-11",

 "password": "password-11"

}

**Заголовки ответа(Response Headers):**

Content-Type: application/json; charset=utf-8; v=1.0
Date: Thu, 25 May 2023 11:11:57 GMT
Server: Kestrel
Transfer-Encoding: chunked
api-supported-versions: 1.0
 
**Тело ответа(Response Body):**

  {
    "id": 11,
    "userName": "Name-11",
    "password": "password-11"
}

**Статус код ответа:** 200 ОК


## 43 POST/api/v1/Users (invalid)

**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Users 

**Ожидаемый результат:** Статус код ответа 400 

**Заголовки запроса(Request Headers):**

Content-Type: application/json
User-Agent: PostmanRuntime/7.32.2
Accept: */*
Cache-Control: no-cache
Postman-Token: a49f9a30-d6ef-4afb-bcbd-8893b35def76
Host: fakerestapi.azurewebsites.net
Accept-Encoding: gzip, deflate, br
Connection: keep-alive
 
**Тело запроса(Request Body)**

{

 "id": ,

 "userName": "string",

 "password": "string"

}

**Заголовки ответа(Response Headers):**

Content-Type: application/problem+json; charset=utf-8
Date: Thu, 25 May 2023 11:06:23 GMT
Server: Kestrel
Transfer-Encoding: chunked
 
**Тело ответа(Response Body):**

  {
    "type": "https://tools.ietf.org/html/rfc7231#section-6.5.1",
    "title": "One or more validation errors occurred.",
    "status": 400,
    "traceId": "00-7a6b74e7bd17e14b82cbe7773f0d83c3-199e275e6984f94b-00",
    "errors": {
        "$.id": [
            "',' is an invalid start of a value. Path: $.id | LineNumber: 2 | BytePositionInLine: 7."
        ]
    }
}

**Статус код ответа:** 400 Bad Request

## 44 DELETE/api/v1/Users/58


**URL запроса:** https://fakerestapi.azurewebsites.net/api/v1/Users/58

**Ожидаемый результат:** Статус код ответа 200 

**Заголовки запроса(Request Headers):**

Content-Type: application/json
User-Agent: PostmanRuntime/7.32.2
Accept: */*
Cache-Control: no-cache
Postman-Token: a49f9a30-d6ef-4afb-bcbd-8893b35def76
Host: fakerestapi.azurewebsites.net
Accept-Encoding: gzip, deflate, br
Connection: keep-alive
 
**Тело запроса(Request Body)**

{

 "id": ,

 "userName": "string",

 "password": "string"

}

**Заголовки ответа(Response Headers):**

Content-Type: application/problem+json; charset=utf-8
Date: Thu, 25 May 2023 11:06:23 GMT
Server: Kestrel
Transfer-Encoding: chunked
 
**Тело ответа(Response Body):**

  {
    "type": "https://tools.ietf.org/html/rfc7231#section-6.5.1",
    "title": "One or more validation errors occurred.",
    "status": 400,
    "traceId": "00-7a6b74e7bd17e14b82cbe7773f0d83c3-199e275e6984f94b-00",
    "errors": {
        "$.id": [
            "',' is an invalid start of a value. Path: $.id | LineNumber: 2 | BytePositionInLine: 7."
        ]
    }
}

**Статус код ответа:** 400 Bad Request
