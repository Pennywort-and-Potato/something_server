require 'bcrypt'

# user = User.create(username: "realkhoa", password: BCrypt::Password.create("test"), name: "NGUYEN BA KHOA", email: "a@b", role: "admin")
# user2 = User.create(username: "fakeduy", password: BCrypt::Password.create("test2"), name: "DUY", email: "a@b", role: "admin")

User.create(
  username: "realkhoa", 
  first_name: "Nguyen Ba", 
  last_name: "Khoa", 
  date_of_birth: Time.now, 
  email: "a@b", 
  role: "admin",
  is_deleted: false,
  password: "password"
)

User.create(
  username: "fakeduy", 
  first_name: "Do Le", 
  last_name: "Duy", 
  date_of_birth: Time.now, 
  email: "b@a", 
  role: "admin",
  is_deleted: false,
  password: "test"
)