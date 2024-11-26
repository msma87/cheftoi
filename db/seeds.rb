# Limpando o banco de dados
User.destroy_all

# Criando usuários
puts "Criando usuários..."

# Somente atributos existentes no schema
users = [
  { email: "alice@gmail.com", password: "password" },
  { email: "bruno@gmail.com", password: "password" },
  { email: "carla@gmail.com", password: "password" },
  { email: "daniel@gmail.com", password: "password" },
  { email: "fernanda@gmail.com", password: "password" }
]

# Criando usuários no banco
users.each do |user_data|
  begin
    User.create!(user_data)
  rescue ActiveModel::UnknownAttributeError => e
    puts "Erro ao criar usuário: #{e.message}"
  end
end

puts "#{User.count} usuários criados com sucesso!"
