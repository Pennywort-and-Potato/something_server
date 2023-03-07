# INSTRUCTION FOR RAILS

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