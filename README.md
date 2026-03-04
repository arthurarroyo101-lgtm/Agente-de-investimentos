# 🤖 Agente de Investimentos — Rico (XP) + Discord

Agente automatizado em Node.js que monitora ações da B3 e envia alertas no Discord quando um ativo cai **5% ou mais em relação ao preço médio de compra**, solicitando confirmação antes de executar uma ordem de compra.

---

## 📋 Funcionalidades

- 📉 Monitoramento de ações em tempo real (B3) via Yahoo Finance
- 🚨 Alerta de queda ≥ 5% com base no preço médio de compra (não variação do dia)
- 💬 Notificação via **Discord Webhook** com card detalhado
- ✅ Confirmação de compra pelo terminal (`COMPRAR XXXXX` ou `CANCELAR XXXXX`)
- ⏱ Verificação automática a cada 5 minutos (Seg–Sex, 10h–18h)
- 🏦 Suporte a ações e fundos de investimento
- 🤖 Dashboard visual com chatbot integrado (IA + comandos ao agente)

---

## 📁 Estrutura do Projeto

```
agente-investimentos/
├── agent.js        # Código principal do agente
├── .env            # Credenciais e configurações (não versionar)
├── .gitignore      # Ignora .env e node_modules
└── package.json    # Dependências do projeto
```

---

## 🚀 Como Usar

### 1. Clone o repositório
```bash
git clone https://github.com/seu-usuario/agente-investimentos.git
cd agente-investimentos
```

### 2. Instale as dependências
```bash
npm install
```

### 3. Configure o `.env`
Crie um arquivo `.env` na raiz do projeto:
```env
DISCORD_WEBHOOK_URL=https://discord.com/api/webhooks/SEU_ID/SEU_TOKEN
RICO_API_TOKEN=seu_token_aqui
RICO_ACCOUNT_ID=sua_conta_aqui
```

### 4. Configure o Discord Webhook
- Abra um canal no Discord
- Clique em **Editar Canal → Integrações → Webhooks → Novo Webhook**
- Copie a URL e cole no `.env`

### 5. Rode o agente
```bash
node agent.js
```

---

## 📊 Ativos Monitorados

| Ticker | Nome | Tipo | Qtd |
|---|---|---|---|
| CXSE3 | Caixa Seguridade ON | Ação | 15 |
| TAEE4 | Taesa PN | Ação | 33 |
| BBAS3 | Banco do Brasil ON | Ação | 31 |
| TREND DI | Trend DI FIC RF Simples RL | Fundo | — |
| ABS. ATENAS | Absolute Atenas Advisory FIC FIF RF CP RL | Fundo | — |

---

## ⚙️ Configurações do Agente

| Parâmetro | Valor |
|---|---|
| Threshold de queda | ≥ 5% vs preço de compra |
| Intervalo de verificação | A cada 5 minutos |
| Horário de funcionamento | Seg–Sex, 10h–18h (B3) |
| Timeout de confirmação | 5 minutos |

---

## 🔄 Fluxo de Funcionamento

```
1. Agente verifica cotações a cada 5 minutos
        ↓
2. Detecta queda ≥ 5% vs preço de compra
        ↓
3. Envia alerta no Discord com detalhes do ativo
        ↓
4. Usuário digita no terminal: COMPRAR XXXXX
        ↓
5. Agente executa ordem de compra na Rico (XP)
        ↓
6. Confirmação enviada no Discord
```

---

## 🛠 Tecnologias

- [Node.js](https://nodejs.org)
- [axios](https://axios-http.com) — requisições HTTP
- [node-cron](https://www.npmjs.com/package/node-cron) — agendamento de tarefas
- [dotenv](https://www.npmjs.com/package/dotenv) — variáveis de ambiente
- [Yahoo Finance API](https://finance.yahoo.com) — cotações em tempo real (B3)
- [Discord Webhooks](https://discord.com/developers/docs/resources/webhook) — notificações

---

## ⚠️ Aviso

> A Rico/XP não possui API pública oficial para pessoas físicas. A integração de ordens é experimental. Utilize com cautela e sempre confirme as operações manualmente.

---

## 🔒 Segurança

- **Nunca versione o arquivo `.env`**
- Adicione `.env` e `node_modules/` ao `.gitignore`
- Não compartilhe seu token da Rico ou URL do Webhook publicamente

---

## .gitignore recomendado

```
node_modules/
.env
```
