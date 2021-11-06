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

#puts "Tarea 18, Hecho."

