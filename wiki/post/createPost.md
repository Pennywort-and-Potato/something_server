# /post/create

```b
POST /post/create
```

body: 

```json
{
    "title": "Khoa pro",
    "body": "test",
    "contents": [
        {"alt": "1", "src": "2", "content_type": "image"},
        {"alt": "2", "src": "3", "content_type": "image"}
    ]
}
```

Return:
```json
{
    "data": {
        "id": 6,
        "user_id": 8,
        "title": "Khoa pro",
        "body": "test",
        "view": 0,
        "like": 0,
        "dislike": 0,
        "rating": 0.0,
        "created_at": "2023-02-08T10:02:41.878Z",
        "updated_at": "2023-02-08T10:02:41.878Z",
        "is_deleted": false,
        "content": [
            {
                "id": 9,
                "post_id": 6,
                "alt": "1",
                "src": "2dd",
                "content_type": "image",
                "view": 0,
                "like": 0,
                "dislike": 0,
                "rating": 0.0,
                "created_at": "2023-02-08T10:02:41.886Z",
                "updated_at": "2023-02-08T10:02:41.886Z",
                "is_deleted": false
            },
            {
                "id": 10,
                "post_id": 6,
                "alt": "2",
                "src": "dd3",
                "content_type": "image",
                "view": 0,
                "like": 0,
                "dislike": 0,
                "rating": 0.0,
                "created_at": "2023-02-08T10:02:41.948Z",
                "updated_at": "2023-02-08T10:02:41.948Z",
                "is_deleted": false
            }
        ]
    },
    "success": true
}
```