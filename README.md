# DOCUMENT

## HEADER
```FORM DATA
Authorization:<TOKEN>
Content-Type:application/json
```

##### HOW TO GET TOKEN

```R
POST /login
```

BODY

```JSON
{
  "username",
  "password"
}
```

Copy jwt, paste to Authorization header

## APIs

### USER

|METHOD|ENDPOINT|RESULT|RETURNS|TOKEN REQUIRE|
|---|---|---|---|---|
|GET|[/v2/getUserByID/:id](#getUserByID)|An User|[User](#User)|:heavy_check_mark:|
|GET|[/v2/getUserBy](#getUserBy)|An User Array|[User](#User)[]|:heavy_check_mark:|
|PUT/PATCH|[/v2/updateUser](#updateUser)|An User|[User](#User)|:heavy_check_mark:|
|DELETE|[/v2/deactiveUser](#deactiveUser)|An User|[User](#User)|:heavy_check_mark:|

### POST

|METHOD|ENDPOINT|RESULT|RETURNS|TOKEN REQUIRE|
|---|---|---|---|---|
|GET|[/v2/getPostByID/:id](#getPostByID)|A Post|[Post](#Post)|
|GET|[/v2/getPostByUserID/:id](#getPostByUserID)|A Post Array|[Post](#Post)[]|
|GET|[/v2/getPostBy](#getPostBy)|A Post Array|[Post](#Post)[]|
|PUT/PATCH|[/v2/updatePost](#updatePost)|A Post|[Post](#Post)|:heavy_check_mark:|
|DELETE|[/v2/deactivePost](#deactivePost)|A Post|[Post](#Post)|:heavy_check_mark:|
|POST|[/v2/createPost](#createPost)|A Post|[Post](#Post)|:heavy_check_mark:|

### CONTENT

|METHOD|ENDPOINT|RESULT|RETURNS|TOKEN REQUIRE
|---|---|---|---|---|
|GET|[/v2/getContentByID/:id](#getContentByID)|A Content|[Content](#Content)|
|GET|[/v2/getContentByPostID/:id](#getContentByPostID)|A Content Array|[Content](#Content)[]|
|GET|[/v2/getContentBy](#getContentBy)|A Content Array|[Content](#Content)[]|
|DELETE|[/v2/deactiveContent](#deactiveContent)|A Content|[Content](#Content)|:heavy_check_mark:|

### API REF

#### /v2/deactiveContent

<a name="deactiveContent"></a>

```R
GET /v2/deactiveContent
```

BODY

```JSON
{
  id
}
```

RETURN

```json
{
    "data": {
        "post_id": 10,
        "is_deleted": true,
        "id": 29,
        "alt": "POM4iSx",
        "src": "https://i.imgur.com/POM4iSx.jpeg",
        "content_type": "image/jpeg",
        "view": 15,
        "like": 0,
        "dislike": 0,
        "rating": 0.0,
        "created_at": "2023-02-09T11:14:36.126Z",
        "updated_at": "2023-02-13T17:18:08.435Z"
    }
}
```

#### /v2/getContentBy

<a name="getContentBy"></a>

```R
GET /v2/getContentBy
```

BODY

```JSON
{
  chunk?,
  page?,
  alt?,
  src?,
  id?
}
```

RETURN

```json
{
    "data": [
        {
            "id": 29,
            "post_id": 10,
            "alt": "POM4iSx",
            "src": "https://i.imgur.com/POM4iSx.jpeg",
            "content_type": "image/jpeg",
            "view": 15,
            "like": 0,
            "dislike": 0,
            "rating": 0.0,
            "created_at": "2023-02-09T11:14:36.126Z",
            "updated_at": "2023-02-10T04:45:14.672Z",
            "is_deleted": false,
            "post": {
                "id": 10,
                "user_id": 1,
                "title": "Khoa dep trai hon Hieu",
                "body": "Hieu dep trai",
                "view": 29,
                "like": 0,
                "dislike": 0,
                "rating": 0.0,
                "created_at": "2023-02-09T11:14:35.990Z",
                "updated_at": "2023-02-13T16:51:34.756Z",
                "is_deleted": false
            }
        }
    ],
    "success": true
}
```

#### /v2/getContentByPostID/:id

<a name="getContentByPostID"></a>

```R
GET /v2/getContentByPostID/:id
```

BODY

```JSON
{
  chunk?,
  page?
}
```

RETURN

```json
{
    "data": [
        {
            "id": 31,
            "post_id": 12,
            "alt": "AQ9reDP",
            "src": "https://i.imgur.com/AQ9reDP.jpeg",
            "content_type": "image/jpeg",
            "view": 10,
            "like": 0,
            "dislike": 0,
            "rating": 0.0,
            "created_at": "2023-02-09T11:14:41.649Z",
            "updated_at": "2023-02-10T07:24:47.316Z",
            "is_deleted": true,
            "post": {
                "id": 12,
                "user_id": 1,
                "title": "Title",
                "body": "Hieu dep trai",
                "view": 16,
                "like": 0,
                "dislike": 0,
                "rating": 0.0,
                "created_at": "2023-02-09T11:14:41.519Z",
                "updated_at": "2023-02-10T17:45:07.588Z",
                "is_deleted": false
            }
        }
    ],
    "success": true
}
```

#### /v2/getContentByID/:id

<a name="getContentByID"></a>

```R
GET /v2/getContentByID/:id
```

RETURN

```json
{
    "data": {
        "id": 52,
        "post_id": 14,
        "alt": "oD8wPWl",
        "src": "https://i.imgur.com/oD8wPWl.jpeg",
        "content_type": "image/jpeg",
        "view": 4,
        "like": 0,
        "dislike": 0,
        "rating": 0.0,
        "created_at": "2023-02-09T11:40:50.415Z",
        "updated_at": "2023-02-10T04:14:15.673Z",
        "is_deleted": false,
        "post": {
            "id": 14,
            "user_id": 1,
            "title": "Em yeu dui gio 2",
            "body": "12345677654321",
            "view": 9,
            "like": 0,
            "dislike": 0,
            "rating": 0.0,
            "created_at": "2023-02-09T11:40:49.430Z",
            "updated_at": "2023-02-10T17:45:08.788Z",
            "is_deleted": false
        }
    },
    "success": true
}
```

#### /v2/createPost

<a name="createPost"></a>

```R
POST /v2/createPost
```

BODY

```json
{
  title,
  body,
  contents: [
    {alt, src, content_type},
  ]
}
```

RETURN

```json
{
    "data": {
        "id": 12,
        "user_id": 1,
        "title": "Title",
        "body": "Hieu dep trai",
        "view": 0,
        "like": 0,
        "dislike": 0,
        "rating": 0.0,
        "created_at": "2023-02-09T11:14:41.519Z",
        "updated_at": "2023-02-10T17:45:07.588Z",
        "is_deleted": false,
        "content": [
            {
                "id": 31,
                "post_id": 12,
                "alt": "AQ9reDP",
                "src": "https://i.imgur.com/AQ9reDP.jpeg",
                "content_type": "image/jpeg",
                "view": 0,
                "like": 0,
                "dislike": 0,
                "rating": 0.0,
                "created_at": "2023-02-09T11:14:41.649Z",
                "updated_at": "2023-02-10T07:24:47.316Z",
                "is_deleted": true
            }
        ]
    },
    "success": true
}
```

#### /v2/deactivePost

<a name="deactivePost"></a>

```R
DELETE /v2/deactivePost
```

BODY

```json
{
  id
}
```

RETURN

```json
{
    "data": {
        "title": "Khoa dep trai hon Hieu",
        "user_id": 1,
        "id": 10,
        "body": "Hieu dep trai",
        "view": 29,
        "like": 0,
        "dislike": 0,
        "rating": 0.0,
        "created_at": "2023-02-09T11:14:35.990Z",
        "updated_at": "2023-02-13T16:51:34.756Z",
        "is_deleted": true
    },
    "success": true
}
```

#### /v2/updatePost

<a name="updatePost"></a>

```R
PUT /v2/updatePost
```

BODY

```json
{
  id,
  title?,
  body?,
}
```

RETURN

```json
{
    "data": {
        "title": "Khoa dep trai hon Hieu",
        "user_id": 1,
        "id": 10,
        "body": "Hieu dep trai",
        "view": 29,
        "like": 0,
        "dislike": 0,
        "rating": 0.0,
        "created_at": "2023-02-09T11:14:35.990Z",
        "updated_at": "2023-02-13T16:51:34.756Z",
        "is_deleted": false
    },
    "success": true
}
```

#### /v2/getPostBy

<a name="getPostBy"></a>

```R
GET /v2/getPostBy
```

BODY

```json
{
  chunk?,
  page?,
  title?,
  body?,
  id?
}
```

RETURN

```json
{
    "data": [
        {
            "id": 10,
            "user_id": 1,
            "title": "Title",
            "body": "Hieu dep trai",
            "view": 29,
            "like": 0,
            "dislike": 0,
            "rating": 0.0,
            "created_at": "2023-02-09T11:14:35.990Z",
            "updated_at": "2023-02-10T17:45:08.121Z",
            "is_deleted": false,
            "content": [
                {
                    "id": 29,
                    "post_id": 10,
                    "alt": "POM4iSx",
                    "src": "https://i.imgur.com/POM4iSx.jpeg",
                    "content_type": "image/jpeg",
                    "view": 15,
                    "like": 0,
                    "dislike": 0,
                    "rating": 0.0,
                    "created_at": "2023-02-09T11:14:36.126Z",
                    "updated_at": "2023-02-10T04:45:14.672Z",
                    "is_deleted": false
                }
            ]
        }
    ],
    "success": true
}
```

#### /v2/getPostByUserID/:id

<a name="getPostByUserID"></a>

```R
GET /v2/getPostByUserID/:id
```

BODY

```json
{
  chunk?,
  page?
}
```

RETURN

```json
{
    "data": [
        {
            "id": 10,
            "user_id": 1,
            "title": "Title",
            "body": "Hieu dep trai",
            "view": 29,
            "like": 0,
            "dislike": 0,
            "rating": 0.0,
            "created_at": "2023-02-09T11:14:35.990Z",
            "updated_at": "2023-02-10T17:45:08.121Z",
            "is_deleted": false,
            "content": [
                {
                    "id": 29,
                    "post_id": 10,
                    "alt": "POM4iSx",
                    "src": "https://i.imgur.com/POM4iSx.jpeg",
                    "content_type": "image/jpeg",
                    "view": 15,
                    "like": 0,
                    "dislike": 0,
                    "rating": 0.0,
                    "created_at": "2023-02-09T11:14:36.126Z",
                    "updated_at": "2023-02-10T04:45:14.672Z",
                    "is_deleted": false
                }
            ]
        },
        {
            "id": 11,
            "user_id": 1,
            "title": "Not Title",
            "body": "Khoa dep trai",
            "view": 16,
            "like": 0,
            "dislike": 0,
            "rating": 0.0,
            "created_at": "2023-02-09T11:14:38.569Z",
            "updated_at": "2023-02-10T17:45:08.343Z",
            "is_deleted": false,
            "content": [
                {
                    "id": 30,
                    "post_id": 11,
                    "alt": "EBNnfm1",
                    "src": "https://i.imgur.com/EBNnfm1.png",
                    "content_type": "image/png",
                    "view": 10,
                    "like": 0,
                    "dislike": 0,
                    "rating": 0.0,
                    "created_at": "2023-02-09T11:14:38.701Z",
                    "updated_at": "2023-02-10T04:45:12.688Z",
                    "is_deleted": false
                }
            ]
        }
    ],
    "success": true
}
```

#### /v2/getPostByID/:id

<a name="getPostByID"></a>

```R
GET /v2/getPostByID/:id
```

RETURN

```json
{
    "data": {
        "id": 12,
        "user_id": 1,
        "title": "Title",
        "body": "Hieu dep trai",
        "view": 16,
        "like": 0,
        "dislike": 0,
        "rating": 0.0,
        "created_at": "2023-02-09T11:14:41.519Z",
        "updated_at": "2023-02-10T17:45:07.588Z",
        "is_deleted": false,
        "content": [
            {
                "id": 31,
                "post_id": 12,
                "alt": "AQ9reDP",
                "src": "https://i.imgur.com/AQ9reDP.jpeg",
                "content_type": "image/jpeg",
                "view": 10,
                "like": 0,
                "dislike": 0,
                "rating": 0.0,
                "created_at": "2023-02-09T11:14:41.649Z",
                "updated_at": "2023-02-10T07:24:47.316Z",
                "is_deleted": true
            }
        ]
    },
    "success": true
}
```

#### /v2/getUserByID/:id

<a name="getUserByID"></a>

```R
GET /v2/getUserByID/:id
```

RETURN

```json
{
    "data": {
        "id": 1,
        "username": "realkhoa",
        "first_name": "Nguyen Ba",
        "last_name": "Khoa",
        "date_of_birth": "2004-01-21",
        "email": "nbk2124.z@gmail.com",
        "role": "admin",
        "is_deleted": false,
        "created_at": "2023-02-09T06:51:24.937Z",
        "updated_at": "2023-02-10T03:12:18.149Z"
    },
    "success": true
}
```

#### /v2/getUserBy

<a name="getUserBy"></a>

```R
GET /v2/getUserBy
```

BODY

```OBJECT
{
  id?,
  username?,
  email?,
  chunk?,
  page?
}
```

RETURN

```JSON
{
    "data": [
        {
            "id": 1,
            "username": "realkhoa",
            "first_name": "Nguyen Ba",
            "last_name": "Khoa",
            "date_of_birth": "2004-01-21",
            "is_deleted": false,
            "created_at": "2023-02-09T06:51:24.937Z",
            "updated_at": "2023-02-10T03:12:18.149Z"
        }
    ],
    "success": true
}
```

#### /v2/updateUser

<a name="updateUser"></a>

```R
PUT /v2/updateUser
```

BODY

```OBJECT
{
  id,
  password,
  username?,
  first_name?,
  last_name?,
  date_of_birth?,
}
```

RETURN

```json
{
    "data": {
        "id": 1,
        "username": "realkhoa",
        "first_name": "Nguyen Ba",
        "last_name": "Khoa",
        "date_of_birth": "2004-01-21",
        "email": "nbk2124.z@gmail.com",
        "role": "admin",
        "is_deleted": false,
        "created_at": "2023-02-09T06:51:24.937Z",
        "updated_at": "2023-02-10T03:12:18.149Z"
    },
    "success": true
}
```

#### /v2/deactiveUser

<a name="deactiveUser"></a>

```R
DELETE /v2/deactiveUser
```

BODY

```OBJECT
{
  id,
  password
}
```

RETURN

```json
{
    "data": {
        "id": 1,
        "username": "realkhoa",
        "first_name": "Nguyen Ba",
        "last_name": "Khoa",
        "date_of_birth": "2004-01-21",
        "email": "nbk2124.z@gmail.com",
        "role": "admin",
        "is_deleted": true,
        "created_at": "2023-02-09T06:51:24.937Z",
        "updated_at": "2023-02-10T03:12:18.149Z"
    },
    "success": true
}
```

### Model

#### User

<a name="User"></a>

```Object
{
  id: number;
  username: string;
  first_name: string;
  last_name: string;
  date_of_birth: date;
  is_deleted: boolean;
  created_at: date;
  updated_at: date;
}
```

#### Post

<a name="Post"></a>

```Object
{
  id: number,
  user_id: number,
  title: string,
  body: string,
  view: number,
  like: number,
  dislike: number,
  rating: number, //FLOAT
  created_at: date,
  updated_at: date,
  is_deleted: boolean,
  content?: [Content]
}
```

#### Content

<a name="Content"></a>

```Object
{
  id: number,
  post_id: number,
  alt: string,
  src: string,
  content_type: string, // Can be replace with custom types
  view: number,
  like: number,
  dislike: number,
  rating: number, // FLOAT
  created_at: date,
  updated_at: date,
  is_deleted: boolean,
  post?: Post
}
```
