# /register <a name="register"></a>

```b
POST /register
```

or

```b
POST /users/create
```

body:

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
