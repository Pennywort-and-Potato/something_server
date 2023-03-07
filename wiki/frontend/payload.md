# PAYLOADS

## Note

- All number type can be string
- ? mark is optional. Field with this mark can be null or empty.

## Register Payload

```Object
{
    username: string,
    first_name: string,
    last_name: string,
    date_of_birth: Date,
    email: string,
    password: string
}
```

## Login Payload

```Object
{
    username: string,
    password: string
}
```

## Find User Payload

```Object
{
    chunk?: number; // DEFAULT = 30
    page?: number; // DEFAULT = 1
    id?: number;
    email?: number;
    username?: number;
    first_name?: string;
    last_name?: string;
}
```

## Update User Payload

```Object
{
    id: number;
    password: string;
    username?: string;
    first_name?: string;
    last_name?: string;
}
```

## Deactive User Payload

```Object
{
    id: number;
    password: string;
}
```

## Find Post Payload

```Object
{
    chunk?: number; // DEFAULT = 30
    page?: number; // DEFAULT = 1
    title?: string;
    body?: string;
    id?: string;
}
```

## Update Post Payload

```Object
{
    title?: string;
    body?: string;
}
```

## Deactive Post Payload

```Object
{
    id: number;
}
```

## Create Post Payload

```Object
{
    title: string;
    body?: string;
    contents: [Content]
}
```

## Find Content Payload

```Object
{
    alt?: string;
    src?: string;
    id?: number;
}
```

## Deactive Content Payload

```Object
{
    id: number;
}
```
