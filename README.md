
<h1>Cadastro de Usuários</h1>
<p>Este projeto é uma aplicação para cadastro e edição de usuários, permitindo que você gerencie informações de usuários como nome, email, telefone, foto de perfil e nível de permissão. A aplicação foi construída utilizando o framework Spring Boot no back-end e React no front-end.</p>

<h2>Funcionalidades</h2>
<ul>
    <li><strong>Cadastro de Usuários</strong>: Permite criar novos usuários com as informações necessárias.</li>
    <li><strong>Edição de Usuários</strong>: Permite editar as informações de usuários já existentes.</li>
    <li><strong>Upload de Foto de Perfil</strong>: É possível adicionar ou alterar a foto de perfil do usuário.</li>
    <li><strong>Gerenciamento de Níveis de Permissão</strong>: Atribuição de níveis de permissão aos usuários.</li>
</ul>

<h2>Tecnologias Utilizadas</h2>
<ul>
    <li><strong>Back-end</strong>: Spring Boot (Java)</li>
    <li><strong>Front-end</strong>: React.js (com Material UI)</li>
    <li><strong>Banco de Dados</strong>: MySQL</li>
</ul>

<h2>Requisitos</h2>
<ul>
    <li><strong>Java</strong>: 11 ou superior</li>
    <li><strong>Node.js</strong>: 16 ou superior</li>
    <li><strong>MySQL</strong>: Para banco de dados</li>
</ul>

<h2>Instruções de Execução</h2>

<h3>1. Configuração do Banco de Dados</h3>
<p>1. Importe o arquivo SQL <code>dump-desafio-202412102251.sql</code> para o seu banco de dados MySQL. Este arquivo contém a estrutura das tabelas e os dados iniciais para o projeto.</p>

<h3>2. Executando o Back-end</h3>
<ol>
    <li>Abra o <strong>terminal</strong> e navegue até a pasta do <strong>back-end</strong> do projeto. Para isso, utilize o comando:</li>
    <pre><code>cd backend</code></pre>
    <li>Execute o comando abaixo para inicializar o servidor Spring Boot:</li>
    <pre><code>mvn spring-boot:run</code></pre>
    <p>Isso iniciará o servidor back-end, que ficará disponível na URL <code>http://localhost:8080</code>.</p>
</ol>

<h3>3. Executando o Front-end</h3>
<ol>
    <li>Abra outro <strong>terminal</strong> e navegue até a pasta do <strong>front-end</strong> do projeto. Para isso, utilize o comando:</li>
    <pre><code>cd frontend</code></pre>
    <li>Execute o comando abaixo para iniciar o servidor de desenvolvimento:</li>
    <pre><code>npm run dev</code></pre>
    <p>Isso iniciará o servidor front-end, que ficará disponível na URL <code>http://localhost:5173</code>.</p>
</ol>

<h3>4. Acesso à Aplicação</h3>
<p>Acesse a aplicação no seu navegador através do endereço <code>http://localhost:5173</code>.</p>
<p>Você poderá visualizar as telas de cadastro e edição de usuários, onde será possível interagir com a aplicação.</p>

