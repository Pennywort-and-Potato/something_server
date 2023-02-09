# /users/update <a name="update-user"></a>

```b
PUT /users/update
```

body: 
```json
{
  "id": 1
  "username": "", 
  "first_name", 
  "last_name", 
  "date_of_birth", 
  "email",
  "password"
}
```

Return:

```json
{
    "data": {
        "username": "khoaquapro",
        "id": 7,
        "first_name": "Do Anh",
        "last_name": "Kiet",
        "date_of_birth": "2023-02-02",
        "email": "ssdsasc@dxdsaxx",
        "role": "admin",
        "is_deleted": false,
        "created_at": "2023-02-06T16:31:01.150Z",
        "updated_at": "2023-02-08T09:48:16.356Z"
    },
    "success": true
}
```

Note: only id, password is require
