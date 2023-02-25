# WIKI

## HEADER

```FORM DATA
Authorization:<TOKEN>
Content-Type:application/json
```

## HOW TO GET TOKEN

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

### AUTH

|METHOD|ENDPOINT|PAYLOAD|RETURNS|TOKEN REQUIRE|
|---|---|---|---|---|
|POST|[/login](./endpoints/auth/login.md)|[Login Payload](./payload.md#login-payload)|[Login Response](#)||
|POST|[/register](./endpoints/auth/register.md)|[Register Payload](./payload.md#register-payload)|[Register Response](#)||
|GET|[/me](./endpoints/auth/me.md)||[User](./models.md#user)|:heavy_check_mark:|

### USER

|METHOD|ENDPOINT|PAYLOAD|RETURNS|TOKEN REQUIRE|
|---|---|---|---|---|
|GET|[/v2/getUserByID/:id](./endpoints/user/getUserByID.md)|NONE|[User](./models.md#user)|:heavy_check_mark:|
|GET|[/v2/getUserBy](./endpoints/user/getUserBy.md)|[Find User Payload](./payload.md#find-user-payload)|[User](./models.md#user)[]|:heavy_check_mark:|
|PUT/PATCH|[/v2/updateUser](./endpoints/user/updateUser.md)|[Update User Payload](./payload.md#update-user-payload)|[User](./models.md#user)|:heavy_check_mark:|
|DELETE|[/v2/deactiveUser](./endpoints/user/deactiveUser.md)|[Deactive User Payload](./payload.md#deactive-user-payload)|[User](./models.md#user)|:heavy_check_mark:|

### POST

|METHOD|ENDPOINT|PAYLOAD|RETURNS|TOKEN REQUIRE|
|---|---|---|---|---|
|GET|[/v2/getPostByID/:id](./endpoints/post/getPostByID.md)|NONE|[Post](./models.md#post)|
|GET|[/v2/getPostByUserID/:id](./endpoints/post/getPostByUserID.md)|NONE|[Post](./models.md#post)[]|
|GET|[/v2/getPostBy](./endpoints/post/getPostBy.md)|[Find Post Payload](./payload.md#find-post-payload)|[Post](./models.md#post)[]|
|PUT/PATCH|[/v2/updatePost](./endpoints/post/updatePost.md)|[Update Post Payload](./payload.md#update-post-payload)|[Post](./models.md#post)|:heavy_check_mark:|
|DELETE|[/v2/deactivePost](./endpoints/post/deactivePost.md)|[Deactive Post Payload](./payload.md#deactive-post-payload)|[Post](./models.md#post)|:heavy_check_mark:|
|POST|[/v2/createPost](./endpoints/post/createPost.md)|[Create Post Payload](./payload.md#create-post-payload)|[Post](./models.md#post)|:heavy_check_mark:|

### CONTENT

|METHOD|ENDPOINT|PAYLOAD|RETURNS|TOKEN REQUIRE|
|---|---|---|---|---|
|GET|[/v2/getContentByID/:id](./endpoints/content/getContentByID.md)|NONE|[Content](./models.md#content)|
|GET|[/v2/getContentByPostID/:id](./endpoints/content/getContentByPostID.md)|NONE|[Content](./models.md#content)[]|
|GET|[/v2/getContentBy](./endpoints/content/getContentBy.md)|[Find Content Payload](./payload.md#find-content-payload)|[Content](./models.md#content)[]|
|DELETE|[/v2/deactiveContent](./endpoints/content/deactiveContent.md)|[Deactive Content Payload](./payload.md#deactive-content-payload)|[Content](./models.md#content)|:heavy_check_mark:|
