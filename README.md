


💰 Controle Financeiro Pessoal

Aplicação full stack para registrar receitas e despesas, organizar por categorias e acompanhar o saldo mensal em um dashboard.

🚧 Em desenvolvimento

Funcionalidades

MVP

 Cadastro e login (JWT)
 CRUD de transações (receita/despesa)
 Categorias padrão e personalizadas
 Dashboard mensal (receitas, despesas, saldo, gráfico por categoria)
 Filtros por período e categoria

Próximas versões

 Metas/orçamento por categoria
 Transações recorrentes
 Exportar CSV
 Deploy online
Stack
Camada	Tecnologia
Frontend	React
Backend	Node.js + Express
Banco	PostgreSQL
Testes	Jest + Supertest, Cypress (E2E)
Infra	Docker + GitHub Actions
Como rodar
Pré-requisitos
Node.js 20+
Docker
1. Banco de dados
bash
docker compose up -d db

O schema (backend/db/schema.sql) é aplicado automaticamente na primeira execução.

2. API
bash
cd backend
cp .env.example .env
npm install
npm run dev

API em http://localhost:3001 — teste em /api/health.

3. Testes
bash
cd backend
npm test
Endpoints
Método	Rota	Descrição	Auth
GET	/api/health	Status da API	Não
POST	/api/auth/register	Criar conta	Não
POST	/api/auth/login	Login (retorna token)	Não
GET	/api/auth/me	Dados do usuário	Sim

Rotas protegidas usam o header Authorization: Bearer <token>.

Modelo do banco
users — usuários
categories — categorias (user_id nulo = padrão do sistema)
transactions — receitas e despesas de cada usuário
Autor

Willian — GitHub
