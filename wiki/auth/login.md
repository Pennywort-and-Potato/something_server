# /login

```b
POST /login
```

body: 

```json
{
  "username",
  "password"
}
```

Return:

```json
{
    "jwt": "eyJhbGciOiJIUzI1NiJ9.eyJpZCI6OCwiZW1haWwiOiJzc2RzYXNjQGR4ZGRhc2F4eCIsInJvbGUiOiJtZW1iZXIiLCJleHAiOjE2NzY0NTUzMzh9.ko4HiXmXnDIhxCPPDJkyjEvtKgHMi3Erum1QHQC9Ydw",
    "success": true,
    "user": {
        "id": 8,
        "username": "admin",
        "first_name": "Do Anh",
        "last_name": "Kiet",
        "date_of_birth": "2023-02-02",
        "email": "ssdsasc@dxddasaxx",
        "role": "member",
        "is_deleted": false,
        "created_at": "2023-02-08T10:02:09.551Z",
        "updated_at": "2023-02-08T10:02:09.551Z"
    }
}
```