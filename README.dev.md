# Bet do Elefantinho Branco

## Visão Geral

Aplicação web gamificada com saldo fictício, autenticação por CPF e dois modos de jogo. O sistema simula operações financeiras (depósito e saque) sem processar pagamentos reais.

**Objetivos principais:**

* Exercitar arquitetura Rails organizada por domínios
* Implementar autenticação segura com JWT
* Trabalhar com regras de negócio envolvendo saldo e sorteios
* Utilizar jobs assíncronos (workers)

---

## Funcionalidades Principais

### Autenticação e Usuários

* Cadastro e login utilizando **CPF**
* Validação de CPF:

  * Frontend
  * Backend
* Autenticação via **JWT**
* Sessão expira em **1 hora**
* Roles:

  * `user`
  * `admin`

**Dados básicos do usuário:**

* CPF (único)
* Email (obrigatoriedade a definir)
* Senha criptografada
* Role

---

## Wallet (Saldo Fictício)

### Depósito (Simulado)

* Usuário pode cadastrar dados de cartão de crédito.
* Sistema valida:

  * Número do cartão (algoritmo de Luhn)
  * Opcional: validação externa de existência do cartão (caso seja integrada alguma API)
  * Data de validade
  * CVV (formato)
* Não ocorre transação real.
* Valor é creditado automaticamente após validação.

### Saque

* Permitido apenas acima de um valor mínimo configurável.
* Processo apenas reduz o saldo fictício.

### Regras Técnicas

* Ledger de transações como fonte da verdade.
* Cada operação gera registro:

**transactions**

* `amount`
* `type` (`credit` / `debit`)
* `reference_type`
* `reference_id`

---

## Jogos

### 1. Jackpot

**Funcionamento:**

* Usuário aposta um valor.
* Sistema executa sorteio gerando **3 números aleatórios**.
* Regras de premiação (definição inicial):

  * Combinação total gera prêmio máximo.
  * Combinação parcial pode gerar prêmio menor (a definir detalhamento).
  * Probabilidade de ganho proporcional ao valor apostado.

**Dados principais:**

**jackpots**

* `status`
* `total_amount`
* `draw_at`

**jackpot_entries**

* `user_id`
* `amount`
* `generated_numbers`

---

### 2. Jogo em Sala (Number Room)

**Funcionamento:**

* Sala com no mínimo **2 jogadores**.
* Cada jogador:

  * Escolhe de **1 até N números**
  * N deve ser menor que a quantidade total de números disponíveis.
  * Define valor da aposta.
* **Não é permitido escolher números já selecionados por outro jogador.**
* Um número é sorteado.
* Quem acertar recebe o prêmio total.

**Regras definidas:**

* Intervalo de números (exemplo inicial): 1–50 (configurável)
* Não existe empate, pois números não podem se repetir.

**Dados principais:**

**rooms**

* `status` (`waiting`, `running`, `finished`)
* `max_players`
* `draw_at`
* `numbers_range`

**room_bets**

* `user_id`
* `chosen_numbers`
* `amount`

**room_results**

* `winning_number`
* `winner_user_id`

---

## Arquitetura Técnica

### Tipo

* Monólito modular em Rails

### Stack

* Ruby on Rails
* PostgreSQL
* Redis
* Sidekiq (workers)

### Domínios (Namespaces)

* Auth / Users
* Wallet
* Jackpot
* Rooms
* Leaderboard (futuro)

Cada domínio terá:

* Models
* Services
* Jobs

---

## Workers (Jobs)

* `JackpotDrawJob`
* `RoomDrawJob`
* `LeaderboardUpdateJob` (futuro)

**Responsabilidades:**

* Gerar números aleatórios
* Determinar vencedor
* Creditar prêmios

---

## Segurança e Consistência

* Todas operações de saldo devem ser transacionais.
* Jobs de sorteio devem ser idempotentes.
* Registrar seed ou dados do sorteio para auditoria.
* CPF validado antes de persistir.
* Dados de cartão não devem ser armazenados integralmente (usar apenas validação momentânea ou dados mascarados).

---

## Fluxo Básico do Usuário

1. Cadastro com CPF.
2. Login gera JWT válido por 1 hora.
3. Adiciona saldo (validação de cartão simulada).
4. Escolhe um dos jogos.
5. Worker executa sorteio.
6. Prêmio creditado ou saldo mantido.
7. Histórico disponível.

---

## Processo de Desenvolvimento

* Repositório único.
* Branch por feature.
* Pull Requests curtos.
* Revisão obrigatória.

### Testes

* RSpec para models e services.
* Testes específicos para regras de saldo.