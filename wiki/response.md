# RESPONSES

## Register Response

```Object
{
    data: User,
    success: boolean
}
```

## Login Response

```Object
{
    jwt: string,
    success: boolean,
    user: User
}
```

## Upload Image Response

```Object
{
    file_name: string; // UUID.[file_type]
    content_type: string;
    alt: string; // UUID (file_name without type)
    success: boolean;
}
```
