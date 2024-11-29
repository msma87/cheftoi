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
# Criando serviços


    service1 = Service.create!(title: "Jantar Gourmet", category: "Italiana", price: 450.00, description: "Pizza artesanal em forno a lenha", user: user_records[0])
    service1_url = "https://res.cloudinary.com/dq3bwy9sm/image/upload/v1732821675/Jantar_Gourmet_icl7as.jpg"
    service1.photo.attach(io: URI.open(service1_url), content_type: "image/png", filename: File.basename(service1_url))


    service2 = Service.create!(title: "Buffet Vegano", category: "Vegano", price: 700.00, description: "Buffet completo com opções veganas criativas.", user: user_records[1])
    service2_url = "https://res.cloudinary.com/dq3bwy9sm/image/upload/v1732821676/Buffet_Vegano_dfqk9o.jpg"
    service2.photo.attach(io: URI.open(service2_url), content_type: "image/png", filename: File.basename(service2_url))


    service3 = Service.create!(title: "Churrasco Premium", category: "Churrasco", price: 800.00, description: "Churrasco completo com cortes nobres.", user: user_records[2])
    service3_url = "https://res.cloudinary.com/dq3bwy9sm/image/upload/v1732821676/Churrasco_fwwtyh.jpg"
    service3.photo.attach(io: URI.open(service3_url), content_type: "image/png", filename: File.basename(service3_url))


    service4 = Service.create!(title: "Sobremesas Exclusivas", category: "Sobremesas", price: 300.00, description: "Seleção de sobremesas finas.", user: user_records[0])
    service4_url = "https://res.cloudinary.com/dq3bwy9sm/image/upload/v1732821675/Sobremesas_exclusivas_swccyh.jpg"
    service4.photo.attach(io: URI.open(service4_url), content_type: "image/png", filename: File.basename(service4_url))


    service5 = Service.create!(title: "Cozinha Internacional", category: "Internacional", price: 600.00, description: "Menu internacional com pratos típicos.", user: user_records[1])
    service5_url = "https://res.cloudinary.com/dq3bwy9sm/image/upload/v1732821676/BuffetInternacional_fmrq6x.jpg"
    service5.photo.attach(io: URI.open(service5_url), content_type: "image/png", filename: File.basename(service5_url))


    service6 = Service.create!(title: "Rodízio de Sushi", category: "Japonesa", price: 750.00, description: "Rodízio de sushi fresco e servido em casa", user: user_records[1])
    service6_url = "https://res.cloudinary.com/dq3bwy9sm/image/upload/v1732821676/Sushis_s8s5tf.jpg"
    service6.photo.attach(io: URI.open(service6_url), content_type: "image/png", filename: File.basename(service6_url))


    service7 = Service.create!(title: "Paella Tradicional", category: "Espanhola", price: 750.00, description: "Autêntica paella valenciana para 10 pessoas.", user: user_records[1])
    service7_url = "https://res.cloudinary.com/dq3bwy9sm/image/upload/v1732821676/Aesthetic_Spanish_Paella_Dish_axdpnr.jpg"
    service7.photo.attach(io: URI.open(service7_url), content_type: "image/png", filename: File.basename(service7_url))


    service8 = Service.create!(title: "Feijoada Completa", category: "Brasileira", price: 600.00, description: "Feijoada tradicional com todas as guarnições.", user: user_records[2])
    service8_url = "https://res.cloudinary.com/dq3bwy9sm/image/upload/v1732821676/Feijoada_ujbrja.jpg"
    service8.photo.attach(io: URI.open(service8_url), content_type: "image/png", filename: File.basename(service8_url))


    service9 = Service.create!(title: "Pizza Napolitana", category: "Italiana", price: 450.00, description: "Pizza artesanal em forno a lenha", user: user_records[0])
    service9_url = "https://res.cloudinary.com/dq3bwy9sm/image/upload/v1732821676/Aut%C3%A9ntica_pizza_napolitana_msukjp.jpg"
    service9.photo.attach(io: URI.open(service9_url), content_type: "image/png", filename: File.basename(service9_url))


    service10 = Service.create!(title: "Café da Manhã Deluxe", category: "Café da Manhã", price: 350.00, description: "Café da manhã completo com produtos artesanais.", user: user_records[1])
    service10_url = "https://res.cloudinary.com/dq3bwy9sm/image/upload/v1732821676/Cafe_da_manha_pwbnzr.jpg"
    service10.photo.attach(io: URI.open(service10_url), content_type: "image/png", filename: File.basename(service10_url))


puts "#{User.count} usuários criados!"
puts "#{Service.count} serviços criados!"
