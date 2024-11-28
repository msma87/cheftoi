# Limpando o banco de dados
Service.destroy_all
User.destroy_all

# Criando usuários
users = [
  { email: "admin@admin.com", password: "123456" },
  { email: "aliceveiga@gmail.com", password: "password" },
  { email: "brunomartins@gmail.com", password: "password" },
  { email: "carlaprieto@gmail.com", password: "password" }
]

user_records = users.map { |user_data| User.create!(user_data) }

services = [
  {
    title: "Jantar Gourmet",
    category: "Gastronomia",
    price: 500.00,
    description: "Menu personalizado de 5 pratos com harmonização de vinhos.",
    user: user_records[0]
  },
  {
    title: "Buffet Vegano",
    category: "Vegano",
    price: 700.00,
    description: "Buffet completo com opções veganas criativas.",
    user: user_records[1]
  },
  {
    title: "Churrasco Premium",
    category: "Churrasco",
    price: 800.00,
    description: "Churrasco completo com cortes nobres.",
    user: user_records[2]
  },
  {
    title: "Sobremesas Exclusivas",
    category: "Sobremesas",
    price: 300.00,
    description: "Seleção de sobremesas finas.",
    user: user_records[0]
  },
  {
    title: "Cozinha Internacional",
    category: "Internacional",
    price: 600.00,
    description: "Menu internacional com pratos típicos.",
    user: user_records[1]
  },
  {
    title: "Sushi Deluxe",
    category: "Japonesa",
    price: 900.00,
    description: "Experiência premium de sushi com 40 peças.",
    user: user_records[0]
  },
  {
    title: "Paella Tradicional",
    category: "Espanhola",
    price: 750.00,
    description: "Autêntica paella valenciana para 10 pessoas.",
    user: user_records[1]
  },
  {
    title: "Feijoada Completa",
    category: "Brasileira",
    price: 600.00,
    description: "Feijoada tradicional com todas as guarnições.",
    user: user_records[2]
  },
  {
    title: "Pizza Napolitana",
    category: "Italiana",
    price: 450.00,
    description: "Pizza artesanal em forno a lenha.",
    user: user_records[0]
  },
  {
    title: "Café da Manhã Deluxe",
    category: "Café da Manhã",
    price: 350.00,
    description: "Café da manhã completo com produtos artesanais.",
    user: user_records[1]
  }
]

services.each { |service| Service.create!(service) }

puts "#{User.count} usuários criados!"
puts "#{Service.count} serviços criados!"
