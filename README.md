# DOCUMENT

Using params or request body is both ok

## APIs

**USER ENDPOINT**

- **POST** [/user/create || /register](./wiki/auth/register.md)
- **GET** [/user/get/:id](./wiki/user/getUser.md)
- **PUT** [/user/update](./wiki/user/updateUser.md)
- **DELETE** [/user/delete](./wiki/user/deleteUser.md)
- **GET** [/user/me](./wiki/user/me.md)

**POST ENDPOINT**

- GET [/post/get/:id"](./wiki/post/getPost.md)
- POST [/post/create](./wiki/post/createPost.md)
- PUT [/post/update](./wiki/post/updatePost.md)
- GET [/post/me](./wiki/post/currentUserPost.md)
- GET [/post/user/get/:user_id](./wiki/post/getUserPost.md)

**POST CONTENT**

- GET [/post/content/get/:id](./wiki/content/getContent.md)
- POST [/post/content/add](./wiki/content/addContent.md)

**AUTHENTICATE ENDPOINT**

- POST [/login](./wiki/auth/login.md)
- POST [/register](./wiki/auth/register.md)

**ADMIN ENDPOINT**

- GET [/admin/user/all]
- GET [/admin/user/get/:id]
- GET [/admin/post/all]
- GET [/admin/post/content/all]
