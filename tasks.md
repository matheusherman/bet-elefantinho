# Tasks - Bet do Elefantinho Branco

**Equipe:** 4 pessoas  
**Distribuição:** 3 Backend + 1 Frontend  
**Modelo:** Sprints por features (5 tasks/dev por sprint)  
**Última atualização:** 10/02/2026

---

## 📋 Legenda de Status

- [ ] **TODO** - Não iniciado
- [🔄] **IN PROGRESS** - Em andamento
- [✅] **DONE** - Concluído
- [🔒] **BLOCKED** - Bloqueado (aguardando outra task)

---

## 🚀 SPRINT 1 - POC (Proof of Concept)

**Objetivo:** Ter uma aplicação funcional end-to-end para demonstração  
**Duração:** 1-2 semanas  
**Entregas:** 20 tasks (5 por desenvolvedor)

---

## 👨‍💻 DEV 1 - Feature: Autenticação

**Responsável:** [Nome do Dev 1]

- [ ] **S1.D1.T1** - Setup Rails API + Docker (PostgreSQL) + criar migration de users
- [ ] **S1.D1.T2** - Criar User model (cpf, email, password_digest) + validação de CPF
- [ ] **S1.D1.T3** - Implementar JWT helper (encode/decode tokens)
- [ ] **S1.D1.T4** - Criar endpoint de signup (POST /api/auth/signup) com validações
- [ ] **S1.D1.T5** - Criar endpoint de login (POST /api/auth/login) retornando JWT

**Entrega:** API de autenticação funcionando + documentar endpoints

---

## 👨‍💻 DEV 2 - Feature: Carteira (Wallet)

**Responsável:** [Nome do Dev 2]

- [ ] **S1.D2.T1** - Criar models Wallet e Transaction + migrations
- [ ] **S1.D2.T2** - Criar concern Authenticable (middleware JWT) para proteger rotas
- [ ] **S1.D2.T3** - Implementar Wallet::DepositService (lógica transacional atômica)
- [ ] **S1.D2.T4** - Criar endpoint GET /api/wallet (retorna saldo do usuário autenticado)
- [ ] **S1.D2.T5** - Criar endpoint POST /api/wallet/deposit (adiciona saldo fictício)

**Entrega:** Sistema de carteira funcional + saldo persistente

**Dependências:** S1.D1.T5 (precisa de autenticação)

---

## 👨‍💻 DEV 3 - Feature: Jogo Jackpot

**Responsável:** [Nome do Dev 3]

- [ ] **S1.D3.T1** - Criar models Jackpot e JackpotEntry + migrations
- [ ] **S1.D3.T2** - Criar seed para ter um Jackpot ativo na POC
- [ ] **S1.D3.T3** - Implementar Games::JackpotBetService (debita wallet, cria entry)
- [ ] **S1.D3.T4** - Criar endpoint GET /api/jackpots (lista jackpots ativos)
- [ ] **S1.D3.T5** - Criar endpoint POST /api/jackpots/:id/bet (fazer aposta)

**Entrega:** Sistema de apostas no jackpot funcionando

**Dependências:** S1.D2.T3 e S1.D2.T5 (precisa de wallet)

---

## 👨‍💻 DEV 4 - Feature: Interface Web

**Responsável:** [Nome do Dev 4]

- [ ] **S1.D4.T1** - Setup projeto frontend (React/Vue/Vanilla) + configurar Vite/Webpack
- [ ] **S1.D4.T2** - Criar páginas de Login e Signup com formulários + validação CPF
- [ ] **S1.D4.T3** - Implementar auth service (localStorage JWT + interceptor HTTP)
- [ ] **S1.D4.T4** - Criar Dashboard com header (saldo) + página de depósito
- [ ] **S1.D4.T5** - Criar página de Jackpot (listar e formulário para apostar)

**Entrega:** Interface completa conectada com backend

**Dependências:** S1.D1.T5, S1.D2.T5, S1.D3.T5 (precisa dos endpoints)

---

## 📊 Progresso Sprint 1 - POC

| Dev | Feature | Tasks | Concluídas | Progresso |
|-----|---------|-------|------------|-----------|
| Dev 1 | Autenticação | 5 | 0 | 0% |
| Dev 2 | Wallet | 5 | 0 | 0% |
| Dev 3 | Jackpot | 5 | 0 | 0% |
| Dev 4 | Frontend | 5 | 0 | 0% |
| **TOTAL** | **POC** | **20** | **0** | **0%** |

---

## 🎯 Definition of Done - Sprint 1

**POC estará completa quando:**

✅ Usuário consegue se cadastrar com CPF  
✅ Usuário consegue fazer login e receber token  
✅ Usuário consegue adicionar saldo fictício  
✅ Usuário consegue ver seu saldo  
✅ Usuário consegue apostar em um jackpot  
✅ Frontend mostra todas essas funcionalidades  
✅ Sistema não quebra e todas integrações funcionam

---

## 🚀 SPRINT 2 - Completar MVP (Backlog Futuro)

**Objetivo:** Adicionar features restantes para MVP completo  
**A definir após Sprint 1**

### Dev 1 - Melhorias Auth
- [ ] **S2.D1.T1** - Adicionar expiração de token (1 hora)
- [ ] **S2.D1.T2** - Implementar sistema de roles (user/admin)
- [ ] **S2.D1.T3** - Criar endpoint GET /api/users/me (perfil)
- [ ] **S2.D1.T4** - Adicionar logout (blacklist de tokens)
- [ ] **S2.D1.T5** - Testes RSpec para auth

### Dev 2 - Completar Wallet
- [ ] **S2.D2.T1** - Implementar validação de cartão (algoritmo de Luhn)
- [ ] **S2.D2.T2** - Criar Wallet::WithdrawService
- [ ] **S2.D2.T3** - Criar endpoint POST /api/wallet/withdraw
- [ ] **S2.D2.T4** - Criar endpoint GET /api/wallet/transactions (histórico)
- [ ] **S2.D2.T5** - Testes RSpec para wallet

### Dev 3 - Sistema de Sorteio + Rooms
- [ ] **S2.D3.T1** - Configurar Sidekiq + Redis
- [ ] **S2.D3.T2** - Criar Games::JackpotDrawJob (sortear 3 números)
- [ ] **S2.D3.T3** - Implementar lógica de premiação simples
- [ ] **S2.D3.T4** - Criar models Room e RoomBet
- [ ] **S2.D3.T5** - Criar endpoints básicos de Room

### Dev 4 - Melhorias Frontend
- [ ] **S2.D4.T1** - Adicionar validação de cartão no frontend
- [ ] **S2.D4.T2** - Criar página de histórico de transações
- [ ] **S2.D4.T3** - Criar página de Rooms (listar e apostar)
- [ ] **S2.D4.T4** - Implementar feedback visual (loading, erros, success)
- [ ] **S2.D4.T5** - Adicionar responsividade mobile

---

## 🚀 SPRINT 3 - Features Avançadas (Backlog Futuro)

**Objetivo:** Polimento, testes e features secundárias  
**A definir após Sprint 2**

- [ ] Sistema de notificações em tempo real
- [ ] WebSockets para atualização de salas
- [ ] Leaderboard
- [ ] Dashboard admin
- [ ] Testes E2E completos
- [ ] Deploy em produção

---

## � Como Trabalhar com Sprints

### Fluxo de Trabalho

1. **Pegar sua task:** Mude `[ ]` para `[🔄]` ao iniciar
2. **Criar branch:** `git checkout -b feature/S1-D1-T1-setup-rails`
3. **Desenvolver:** Faça commits pequenos e frequentes
4. **Concluir:** Mude `[🔄]` para `[✅]` quando terminar
5. **Pull Request:** Abra PR, peça review de outro dev
6. **Merge:** Após aprovação, merge na main
7. **Atualizar tasks.md:** Sempre commite o tasks.md atualizado

### Comunicação

- 🚨 **Bloqueado?** Mude para `[🔒]` e avise no grupo
- 💬 **Dependência pronta?** Avise quem está esperando
- ✅ **Task concluída?** Poste no grupo + endpoint/feature funcionando

---

## 📝 Notas da Sprint 1 - POC

**O que DEVE funcionar:**
- ✅ Cadastro e login com CPF
- ✅ Adicionar saldo fictício
- ✅ Ver saldo atual
- ✅ Apostar em jackpot
- ✅ Frontend consumindo todas APIs

**O que NÃO precisa funcionar ainda:**
- ❌ Sorteio automático (pode ser manual por enquanto)
- ❌ Validação de cartão real
- ❌ Sistema de roles/admin
- ❌ Saque de dinheiro
- ❌ Histórico completo
- ❌ Rooms (fica para Sprint 2)

**Dicas Importantes:**
- Mantenha simples! É uma POC, não precisa ser perfeito
- Use seeds para criar dados de teste
- Foque em fazer funcionar, não em otimizar
- Teste manualmente com Postman/Insomnia/curl
- Frontend pode ser básico, foco na funcionalidade

---

## 📅 Timeline Sugerida - Sprint 1

**Dia 1-2:** Setup inicial  
- Dev 1: T1 (Rails + Docker + User model)
- Outros devs: Ajudam no setup, preparam ambiente

**Dia 3-5:** Desenvolvimento paralelo  
- Dev 1: T2, T3, T4 (Auth endpoints)
- Dev 2: T1, T2, T3 (Wallet models e concern)
- Dev 3: T1, T2 (Jackpot models)
- Dev 4: T1, T2, T3 (Frontend setup)

**Dia 6-8:** Integrações  
- Dev 1: T5 (Login funcionando) + ajuda outros
- Dev 2: T4, T5 (Wallet endpoints)
- Dev 3: T3, T4, T5 (Jackpot funcionando)
- Dev 4: T4, T5 (UI conectada)

**Dia 9-10:** Testes e Demo  
- Todos: Testam integração completa
- Ajustam bugs e problemas
- Preparam demo da POC

---

## 🎯 Checklist Final POC

Antes de considerar Sprint 1 completa, testar:

- [ ] Consigo criar conta com CPF válido
- [ ] Consigo fazer login e receber token
- [ ] Token funciona nas requisições autenticadas
- [ ] Consigo adicionar R$ 100,00 ao saldo
- [ ] Saldo aparece corretamente
- [ ] Consigo apostar R$ 10,00 no jackpot
- [ ] Saldo diminui para R$ 90,00
- [ ] Aposta fica registrada no banco
- [ ] Frontend mostra tudo funcionando
- [ ] Não há erros 500 nas requisições normais

**Quando todos os 10 itens acima estiverem ✅, a POC está pronta! 🎉**

---

## 🔗 Recursos Úteis

**Para Backend Devs:**
- Documentar endpoints no README ou criar collection Postman/Insomnia
- Usar `rails console` para testar models rapidamente
- Seeds: `db/seeds.rb` para criar dados de teste

**Para Frontend Dev:**
- Endpoints vão estar em `http://localhost:3000/api/...`
- Guardar token JWT no `localStorage`
- Usar `Authorization: Bearer <token>` nas requisições

**Para Todos:**
- Usar este tasks.md como fonte da verdade
- Avisar no grupo quando começar/terminar tasks
- Fazer code review uns dos outros
- Não ter vergonha de pedir ajuda!
