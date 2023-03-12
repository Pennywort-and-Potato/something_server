# INSTRUCTION FOR RAILS

## Common Modules

### [Helper Module](./helper.md)

|METHOD|PARAMS|
|---|---|
|get_query_limit|chunk, page|
|send_response|response, status?|
|send_error|errors, status|
|check_user|user, password|
|is_admin|user|
|is_moderator|user|
|validate_password|password|
|validate_admin_permission||

## BASIC

- Using console for create model
- There are some command:

### RAILS G

```bash
rails g [option]
```

or

```bash
bin/rails g [option]
```
params:
- **[option]**: model | controller | channel | scaffold

#### SCAFFOLD

```bash
rails g scaffold <Scaffold Name> [<arg>:<type>]
```

Example:

```bash
rails g scaffold User username:string email:string
```

This command will create model + controller + serializer to /app