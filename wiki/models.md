# MODELS

## USER

```Object
{
  id: number;
  username: string;
  first_name: string;
  last_name: string;
  date_of_birth: date;
  email?: string;
  role?: string;
  is_deleted: boolean;
  created_at: date;
  updated_at: date;
}
```

## POST

```Object
{
  id: number;
  user_id: number;
  title: string;
  body: string;
  view: number;
  like: number;
  dislike: number;
  rating: number; //FLOAT
  created_at: date;
  updated_at: date;
  is_deleted: boolean;
  thumbnail: string;
  content?: [Content]
}
```

## CONTENT

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
