# 🏢 Agende+ – Sistema de Reserva de Salas para Administradores

![Java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=java&logoColor=white)
![JSP](https://img.shields.io/badge/JSP-blue?style=for-the-badge)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![NetBeans](https://img.shields.io/badge/NetBeans-1B6AC6?style=for-the-badge&logo=apache&logoColor=white)

> Sistema web interno para administração de reservas de salas de reunião, eventos e aulas. Desenvolvido com Java EE, JSP e MySQL, voltado exclusivamente para **usuários autenticados com perfil administrativo**.

---

## 📸 Capturas de Tela

| Login | Menu Principal |
|-------|----------------|
|  ![login](https://github.com/user-attachments/assets/c541372e-8c86-4cdb-a5fb-cd53cbcaafbb) | ![menu](https://github.com/user-attachments/assets/d08cd6e9-9af4-402a-962b-58fe678487fa) | 


---

## 🚀 Funcionalidades

- 🔐 Login e autenticação com filtro de acesso
- 🗓 Cadastro, edição, listagem e exclusão de:
  - **Usuários**
  - **Salas**
  - **Tipos de Sala**
  - **Reservas**
- 🔎 Visualização organizada por módulos
- 📂 Estrutura organizada por camadas (MVC)

---

## 🛠️ Tecnologias Utilizadas

- **Java EE (JSP/Servlet)**
- **HTML + CSS**
- **JDBC**
- **MySQL**
- **DAO Pattern (Data Access Object)**
- **MVC (Model-View-Controller)**

---

## 🧠 Como o projeto foi pensado

O sistema Agende+ foi estruturado com foco em:

- **Escalabilidade**: seguindo princípios de orientação a objetos e design patterns.
- **Modularidade**: separação entre regras de negócio, controle e interface.
- **Acessibilidade**: interface amigável com navegação simples para todos os tipos de usuários.
- **Manutenibilidade**: estrutura clara e reaproveitamento de componentes.

---

## 🗂 Estrutura de Pastas

```bash
📁 Agende+
├── 📁 src
│   ├── 📁 dao
│   ├── 📁 model
│   ├── 📁 filter
│   └── 📁 util
├── 📁 Web Pages
│   ├── 📁 reservas
│   ├── 📁 salas
│   ├── 📁 tiposala
│   ├── 📁 usuarios
│   ├── 📁 css
│   ├── 📁 img
│   ├── login.jsp
│   ├── logout.jsp
│   ├── menu.jsp
│   └── main.html
├── 📁 imagens
│   ├── login.png
│   ├── menu.png
│   └── reservas.png
├── 📄 README.md
└── 📄 banco.sql


```
## ⚙️ Como Executar o Projeto
Clone este repositório:

```bash
Copiar
Editar
git clone https://github.com/seu-usuario/agende-mais.git
Importe o projeto no NetBeans.

Configure o banco de dados MySQL:

Crie o schema (ex: agende_mais)

Execute o script SQL (caso tenha um arquivo banco.sql)

Atualize a conexão no arquivo ConectaDB.java:

java
Copiar
Editar
String url = "jdbc:mysql://localhost:3306/agende_mais";
String user = "root";
String password = "sua_senha";
Execute o projeto no Apache Tomcat.
```
## 🔐 Acesso ao Sistema

| Usuário	 | Senha |
|-------|----------|
| admin@git.com | admin | 


Os usuários devem ser cadastrados previamente pelo administrador.

## 🧠 Arquitetura e Organização
Padrão MVC com camadas bem definidas:

dao/ – Acesso ao banco de dados (Data Access Objects)

model/ – Classes de modelo/entidades

filter/ – Filtros de autenticação

util/ – Utilitários como conexão com o banco (ConectaDB.java)

## 📌 Considerações Finais
Este projeto foi desenvolvido com foco no aprendizado de Java Web com JSP e Servlets, organização em camadas, boas práticas com DAO, MVC e autenticação simples.

📚 Desenvolvido como projeto acadêmico 💻

