# DOCUMENT

Using params or request body is both ok

## APIs

**USER ENDPOINT**
- **GET** [/users](#users)
- **POST** [/users/create || /register](#register)
- **GET** [/users/get/:id](#get-user)
- **PUT** [/users/update"](#update-user)

**POST ENDPOINT**
- GET [/posts](#posts)
- GET "/post/get/:id", to: "posts#show"
- POST "/post/create", to: "posts#create"
- PUT "/post/update", to: "posts#update"
#### /users <a name="users"></a>

```b
GET /users
```

**Return**:

```json
[
    {
        "id": 1,
        "username": "realkhoa",
        "first_name": "Do Anh ",
        "last_name": "Kiet",
        "date_of_birth": "2023-02-02",
        "email": "c@d",
        "role": "member",
        "is_deleted": false,
        "created_at": "2023-02-03T08:17:38.736Z",
        "updated_at": "2023-02-03T08:17:38.736Z"
    }
]
```

#### /register <a name="register"></a>

```b
POST /register
```

or

```b
POST /users/create
```

with body or params

```json
{
    "username": "realkhoax",
    "first_name": "Do Anh",
    "last_name": "Kiet",
    "date_of_birth": "2023-02-02",
    "email": "c@d",
    "password": "password"
}
```

**Return**:

```json
{
    "id": 1,
    "username": "realkhoa",
    "first_name": "Do Anh",
    "last_name": "Kiet",
    "date_of_birth": "2023-02-02",
    "email": "c@d",
    "role": "member",
    "is_deleted": false,
    "created_at": "2023-02-06T05:03:24.816Z",
    "updated_at": "2023-02-06T05:03:24.816Z"
}
```

#### /users/get/:id <a name="get-user"></a>

```b
GET /users/get/:id
```

**Return:**

```json
{
    "id": 1,
    "username": "realkhoa",
    "first_name": "Do Anh ",
    "last_name": "Kiet",
    "date_of_birth": "2023-02-02",
    "email": "c@d",
    "role": "member",
    "is_deleted": false,
    "created_at": "2023-02-03T08:17:38.736Z",
    "updated_at": "2023-02-03T08:17:38.736Z"
}
```

#### /users/update <a name="update-user"></a>

```b
PUT /users/update
```

Update these attribute: 
```json
{
  "id": 1
  "username": "", 
  "first_name", 
  "last_name", 
  "date_of_birth", 
  "email",
}
```

Note: only id is require
