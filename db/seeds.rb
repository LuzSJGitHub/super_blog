# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Tarea 10, crear 5 usuarios.
5.times do |nusuario|
  us = User.new
  us.first_name = "Usuario #{1 + nusuario}"
  us.last_name = "App 1"
  us.email_address = "email 1"  
  us.save
end
# 1er => first_name Usuario 1
# 2do => first_name Usuario 2
# 3er => first_name Usuario 3
# 4er => first_name Usuario 4
# 5er => first_name Usuario 5
puts "N usuarios: #{User.all.count}"
puts "Tarea 10, Hecho."

# Tarea 11, crear 5 blogs.
1.upto(5) do |nblog|
  bl = Blog.new
  bl.name = "Blog #{nblog}"
  bl.description = "Description"
  bl.save
end
# 1er => Blog 1
# 2do => Blog 2
# 3er => Blog 3
# 4er => Blog 4
# 5er => Blog 5
puts "N Blogs: #{Blog.all.count}"
puts "Tarea 11, Hecho."

# Tarea 12, Establecer que los primeros 3 blogs, pertenezcan al primer usuario.
1.upto(3) do |nblog|
  ow = Owner.new
  ow.user = User.where(first_name: "Usuario 1").first
  ow.blog = Blog.where(name: "Blog #{nblog}").first
  ow.save()
end
puts User.where(first_name: "Usuario 1").first.owner.count
puts "Tarea 12, Hecho."

# Tarea 13, Establecer que el blog 4, pertenezcan al segundo usuario.
ow = Owner.new
ow.user = User.where(first_name: "Usuario 2").first
ow.blog = Blog.where(name: "Blog 4").first
ow.save()
puts User.where(first_name: "Usuario 2").first.owner.count
puts User.where(first_name: "Usuario 2")
.first.owner.where(blog: Blog.where(name: "Blog 4").first)
.count

puts "# de propiedades: #{User.where(first_name: "Usuario 2").first.owner.count}"
## de propiedades: 3

puts "El blog 4 esta asignado #{User
  .where(first_name: "Usuario 2")
  .first.owner
  .where(blog: Blog.where(name: "Blog 4").first)
  .count}"

puts "Tarea 13, Hecho."

# Tarea 14, Establecer que el blog 5, pertenezca al ultimo usuario.
ow = Owner.new
ow.user = User.where(first_name: "Usuario 5").first
ow.blog = Blog.where(name: "Blog 5").first  
ow.save()

puts User.where(first_name: "Usuario 5").first.owner.count

puts User.where(first_name: "Usuario 5")
  .first.owner
  .where(blog: Blog.where(name: "Blog 5").first).count

puts "Tarea 14, Hecho."

# Tarea 15, Establecer que el tercer usuario sea propietario de todos los los Blogs.
1.upto(5) do |nblog|
  ow = Owner.new
  ow.user = User.where(first_name: "Usuario 3").first
  ow.blog = Blog.where(name: "Blog #{nblog}").first
  ow.save()
end
# comprobación simple
puts User.where(first_name: "Usuario 3").first.owner.count

# comprobación avanzada
puts User.where(first_name: "Usuario 3").first.owner
  .where(blog: Blog
    .where(name: [
      "Blog 1", "Blog 2", "Blog 3", "Blog 4", "Blog 5"])).count

puts "Tarea 15, Hecho."

# Tarea 16, Obtenga todos los mensajes escritos por el tercer usuario.

1.upto(3) do |npost|
  p = Post.new
  p.title = "Post #{npost}"
  p.content = "Contenido"
  p.blog = Blog.where(name: "Blog 2").first
  p.user = User.where(first_name: "Usuario 1").first
  p.save
end

ue = User.where(first_name: "Usuario 1").first
be = Blog.where(name: "Blog 2").first

puts "Posts: #{Post.where(user: ue, blog: be).count}"

puts "Tarea 16, Hecho."


#Tarea 17.
us2 = User.where(first_name: "Usuario 2").first
ulb = Blog.where(name: "Blog 5").first

1.upto(5) do |npost|
p = Post.new
p.title = "Post #{npost}"
p.content = "Contenido"
p.user = us2
p.blog = ulb
p.save
end

puts "Post: #{Post.where(blog: ulb, user: us2).count}"
puts "Tarea 17. Hecho."


# Tarea 18, .
us3 = User.where(first_name: "Usuario 3").first

Blog.all.each do |t|
  p = Post.new
  # p.blog = Blog.find(t.id)
  # p.blog = Blog.where(id: t.id).first
  p.blog = t
  p.user = us3
  p.title = "Un título"
  p.content = "Un contenido cualquiera"
  p.save
end
# Contar el numero de posts que tiene el usuario 3
puts "#{Post.where(user: us3).count}"
puts "#{us3.post.count}"
puts "Tarea 18, Hecho."


# Tarea 19, Haz que el tercer usuario cree 2 mensajes para la primera publicación creada y 3 mensajes para la segunda publicación creada.
#primpub = Post.all.first
primpub = Post.all[0]
secpub = Post.all[1]

1.upto(2) do |t|
  m = Message.new
  m.post = primpub
  m.user = us3
  m.author = "algun author"
  m.message = "Aquí va algun mensaje"
  m.save
end

1.upto(3) do |t|
  m = Message.new
  m.post = secpub
  m.user = us3
  m.author = "algun author"
  m.message = "Aquí va algun mensaje"
  m.save
end
# Contar el número de mensajes del usuario 3
puts us3.message.count
puts Message.where(user: us3).count
puts "Tarea 19, Hecho."


# Tarea 20, Haz que el cuarto usuario cree 3 mensajes para la última publicación que tu creaste.

us4 = User.where(first_name: "Usuario 4").first
ulpub = Post.all.last

1.upto(3) do |t|
  m = Message.new
  m.post = ulpub
  m.user = us4
  m.author = "Algun author"
  m.message = "Algun mensaje x"
  m.save
end
# Contar los mensajes del usuario 4
puts "Mensajes: #{us4.message.count}"
puts Message.where(user: us4).count
puts "Tarea 20, Hecho."


# Tarea 21, Cambie el propietario de la 2 publicación para que sea el último usuario..
#Captura al segundo Post en la variable po2
po2 = Post.all[1]
puts "Antes => #{po2.user.first_name}"
#Captura al ultimo usuario en la variable ulu
ulu = User.all.last
#Actualizar usuario
po2.user = ulu
po2.save
puts "Después => #{po2.user.first_name}"
puts "Tarea 21, Hecho."


# Tarea 22, Cambie el contenido de la segunda publicación por algo diferente.
po2 = Post.all[1]
po2.content = "Un nuevo contenido modificado"
po2.save
puts po2.errors.full_messages
puts "Content: #{po2.content}"
puts "Tarea 22, Hecho."


# Tarea 23, Obtenga todos los blog que son propiedad del tercer usuario (haz que esto funcione con un simple Usuario.find(3).blogs).
us3 = User.find(3)
owners = us3.owner
blog_ids = owners.pluck(:blog_id) # => [45, 3, 23]
blogs = Blog.where(id: blog_ids)
puts "Blogs del usuario 3: #{blogs}"
puts "Tarea 23, Hecho."


# Tarea 24, Obtenga todas las publicaciones que fueron creadas por el tercer usuario.
us3 = User.find(3)
us3 = User.where(first_name: "Usuario 3").first
puts us3.post #has_many
puts Post.where(user: us3) #belongs_to
puts "Tarea 24, Hecho."


# Tarea 25, Obtenga todos los mensajes escritos por el tercer usuario.
us3 = User.find(3)
us3 = User.where(first_name: "Usuario 3").first
puts us3.message #has_many
puts Message.where(user: us3) #belongs_to
puts "Tarea 25, Hecho."


# Tarea 26, Obtenga todas las publicaciones asociadas al blog con id = 5 y quién dejó cada publicación.
bl5 = Blog.find(5)
posts = Post.where(blog: bl5)
users = posts.pluck(:user_id)
puts User.where(id: users)
puts "Tarea 26, Hecho."


# Tarea 27, Obtenga todos los mensajes asociados al blog con id = 5, junto con toda la información de los usuarios que dejaron mensajes.
bl5 = Blog.find(5)
posts = Post.where(blog: bl5)
msgs = Message.where(post: posts)
users = msgs.pluck(:user_id)
puts User.where(id: users)
puts "Tarea 27, Hecho."


# Tarea 28, Obtenga toda la información de los usuarios que son propietarios del primer blog (haz que esto funcione con un simple Blog.first.propietarios).
owners = Blog.first.owner
users = owners.pluck(:user_id)
User.where(id: users).each do |t|
  puts "#{t.first_name} #{t.last_name} #{t.email_address}"
end
puts "Tarea 28, Hecho."


# Tarea 29, Cámbielo, es decir, el primer usuario ya no es propietario del primer blog.
us1 = User.first
usul = User.last
bl1 = Blog.first
own = Owner.where(user: us1, blog: bl1)
own.update_all(user_id: usul.id)
puts Owner.where(user: us1, blog: bl1).count
puts "Tarea 29, Hecho."