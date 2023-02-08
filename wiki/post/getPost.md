# /post/get/:id

```b
GET /post/get/:id
```

Return:

```json
{
    "data": {
        "view": 20,
        "user_id": 7,
        "id": 5,
        "title": "Khoa pro",
        "body": "test",
        "like": 0,
        "dislike": 0,
        "rating": 0.0,
        "created_at": "2023-02-08T07:04:05.956Z",
        "updated_at": "2023-02-08T09:42:16.547Z",
        "is_deleted": false,
        "content": [
            {
                "id": 7,
                "post_id": 5,
                "alt": "1",
                "src": "2",
                "content_type": "image",
                "view": 0,
                "like": 0,
                "dislike": 0,
                "rating": 0.0,
                "created_at": "2023-02-08T07:04:06.032Z",
                "updated_at": "2023-02-08T07:04:06.032Z",
                "is_deleted": false
            },
            {
                "id": 8,
                "post_id": 5,
                "alt": "2",
                "src": "3",
                "content_type": "image",
                "view": 0,
                "like": 0,
                "dislike": 0,
                "rating": 0.0,
                "created_at": "2023-02-08T07:04:06.044Z",
                "updated_at": "2023-02-08T07:04:06.044Z",
                "is_deleted": false
            }
        ]
    },
    "success": true
}
```
