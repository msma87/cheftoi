# Limpando o banco de dados
Service.destroy_all
User.destroy_all

# Criando usuários
puts "Criando usuários..."

users = [
  { email: "aliceveiga@gmail.com", password: "password" },
  { email: "brunomartins@gmail.com", password: "password" },
  { email: "carlaprieto@gmail.com", password: "password" }
]

user_records = users.map { |user_data| User.create!(user_data) }

puts "#{User.count} usuários criados com sucesso!"

# Criando serviços
puts "Criando serviços..."

services = [
  { title: "Jantar Gourmet", category: "Gastronomia", price: 500.00, user: user_records[0] },
  { title: "Buffet Vegano", category: "Vegano", price: 700.00, user: user_records[1] },
  { title: "Churrasco Premium", category: "Churrasco", price: 800.00, user: user_records[2] },
  { title: "Sobremesas Exclusivas", category: "Sobremesas", price: 300.00, user: user_records[0] },
  { title: "Cozinha Internacional", category: "Internacional", price: 600.00, user: user_records[1] }
]

services.each { |service| Service.create!(service) }

puts "#{Service.count} serviços criados com sucesso!"
