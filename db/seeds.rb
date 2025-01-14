# Limpando o banco de dados
puts "Limpando banco de dados..."
Service.destroy_all
User.destroy_all

# Criando usuários
puts "Criando usuários..."
users_data = [
  { email: "admin@admin.com", password: "123456" },
  { email: "joana.souza@gmail.com", password: "password" },
  { email: "carlos.silva@gmail.com", password: "password" },
  { email: "mariana.gomes@gmail.com", password: "password" }
]
users = users_data.map { |user_data| User.create!(user_data) }
puts "#{User.count} usuários criados!"

# Criando serviços
puts "Criando serviços..."
services_data = [
  {
    title: "Jantar Romântico à Luz de Velas",
    category: "Gastronomia Italiana",
    price: 350.00,
    description: "Prepare-se para uma experiência inesquecível com um menu completo que inclui entrada, prato principal e sobremesa, tudo inspirado na autêntica cozinha italiana. Ideal para ocasiões especiais.",
    photo_url: "https://res.cloudinary.com/ddbg7qknd/image/upload/v1736888657/jantar-romantico_n5fftm.jpg",
    user: users[0]
  },
  {
    title: "Buffet Vegano Criativo",
    category: "Gastronomia Vegana",
    price: 680.00,
    description: "Transforme seu evento com um buffet vegano que combina sabores inovadores e opções nutritivas. Inclui pratos quentes, saladas e sobremesas feitas com ingredientes frescos e locais.",
    photo_url: "https://res.cloudinary.com/ddbg7qknd/image/upload/v1736887191/Vegan-Easter-Buffet_gvqqvl.jpg",
    user: users[1]
  },
  {
    title: "Churrasco Gourmet Premium",
    category: "Churrasco",
    price: 950.00,
    description: "Cortes nobres, acompanhamentos deliciosos e um toque de sofisticação. Ideal para quem deseja transformar o churrasco tradicional em um evento de alta gastronomia.",
    photo_url: "https://res.cloudinary.com/ddbg7qknd/image/upload/v1736888894/pasta-beef-restaurant-gourmet-flavor-italian-specialties-ambiance-chefs-dishes-quality_1246444-74550_f6q7l5.jpg",
    user: users[2]
  },
  {
    title: "Mesa de Sobremesas Personalizadas",
    category: "Sobremesas Finas",
    price: 420.00,
    description: "Uma seleção exclusiva de sobremesas artesanais, desde mousses e tortas até doces finos. Personalize o cardápio para combinar com o tema do seu evento.",
    photo_url: "https://res.cloudinary.com/ddbg7qknd/image/upload/v1736888970/d3bd6c16a48f5918745252708c3634d1_lq0kby.jpg",
    user: users[0]
  },
  {
    title: "Jantar Internacional - Sabores do Mundo",
    category: "Cozinha Internacional",
    price: 750.00,
    description: "Explore sabores autênticos de diferentes culturas em um menu que passa por pratos mexicanos, tailandeses, franceses e mais. Uma viagem gastronômica sem sair de casa.",
    photo_url: "https://res.cloudinary.com/ddbg7qknd/image/upload/v1736889011/gastronomia-enjoy-blog-1024x682_p8zoah.jpg",
    user: users[1]
  },
  {
    title: "Rodízio de Sushi em Casa",
    category: "Culinária Japonesa",
    price: 890.00,
    description: "Sushis frescos preparados ao vivo por um chef especializado. Inclui uma variedade de opções, como nigiris, sashimis e rolls personalizados.",
    photo_url: "https://res.cloudinary.com/ddbg7qknd/image/upload/v1736889057/rodizios-min-1_nd9kas.jpg",
    user: users[1]
  },
  {
    title: "Paella Valenciana Autêntica",
    category: "Gastronomia Espanhola",
    price: 880.00,
    description: "Desfrute de uma paella tradicional valenciana, preparada com ingredientes frescos como frutos do mar, açafrão e arroz importado. Perfeita para jantares em família ou eventos.",
    photo_url: "https://res.cloudinary.com/ddbg7qknd/image/upload/v1736889127/3.-Paella-Valenciana_wakksd.jpg",
    user: users[2]
  },
  {
    title: "Feijoada Completa Gourmet",
    category: "Gastronomia Brasileira",
    price: 600.00,
    description: "Uma feijoada rica e completa, com carnes selecionadas, acompanhamentos como couve, farofa e laranja, e sobremesas típicas brasileiras.",
    photo_url: "https://res.cloudinary.com/ddbg7qknd/image/upload/v1736889224/feijoada-wooden-table-traditional-brazilian-food_123827-26007_nswexr.jpg",
    user: users[2]
  },
  {
    title: "Café da Manhã Colonial",
    category: "Café da Manhã",
    price: 400.00,
    description: "Um café da manhã completo com pães artesanais, bolos caseiros, geleias frescas, sucos naturais e um toque especial de hospitalidade.",
    photo_url: "https://res.cloudinary.com/ddbg7qknd/image/upload/v1736893855/yukiko-kanada-Ou4CQo6jzvU-unsplash-1024x692_owwyaf.jpg",
    user: users[1]
  }
]

services_data.each do |service_data|
  service = Service.create!(
    title: service_data[:title],
    category: service_data[:category],
    price: service_data[:price],
    description: service_data[:description],
    user: service_data[:user]
  )

  # Adicionando fotos
  begin
    service.photo.attach(
      io: URI.open(service_data[:photo_url]),
      filename: File.basename(service_data[:photo_url]),
      content_type: "image/png"
    )
    puts "Foto anexada para o serviço: #{service.title}"
  rescue => e
    puts "Erro ao anexar foto para o serviço: #{service.title} - #{e.message}"
  end
end

puts "#{Service.count} serviços criados!"
