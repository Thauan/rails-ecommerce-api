# API de E-commerce em Ruby on Rails

Esta é uma API de e-commerce desenvolvida em Ruby on Rails que possui como principais funcionalidades o cadastro de produtos, categorias, marcas e variantes. É possível utilizar essa API para desenvolver uma plataforma de e-commerce completa, incluindo a criação de lojas virtuais, carrinhos de compras, processos de pagamento e muito mais.
Configuração

Antes de começar a utilizar a API, é necessário realizar algumas configurações. Primeiramente, você deve ter instalado em sua máquina o Ruby e o Rails. Caso ainda não tenha, acesse a documentação oficial do Ruby on Rails para realizar a instalação.

Após a instalação, clone o repositório em sua máquina:

```bash
git clone https://github.com/seu-usuario/nome-do-repositorio.git
```

Em seguida, acesse a pasta do projeto e execute o seguinte comando para instalar as dependências:

```bash
bundle install
```

Por fim, execute o seguinte comando para criar o banco de dados e as tabelas necessárias:

```bash
rails db:create db:migrate
```