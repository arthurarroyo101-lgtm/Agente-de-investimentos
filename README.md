# 🤖 Agente de Investimentos — B3 + Discord

Agente automatizado em Node.js que monitora ações, FIIs e ETFs da B3 e envia alertas no Discord quando um ativo cai **X% ou mais em relação ao preço médio de compra**, solicitando confirmação antes de executar uma ordem de compra na sua corretora.

---

## 📋 Funcionalidades

- 📉 Monitoramento de ativos em tempo real (B3) via Yahoo Finance
- 🚨 Alerta de queda configurável com base no preço médio de compra
- 💬 Notificação via **Discord Webhook** com card detalhado
- ✅ Confirmação de compra pelo terminal (`COMPRAR XXXXX` ou `CANCELAR XXXXX`)
- ⏱ Verificação automática em intervalo configurável (Seg–Sex, horário de mercado)
- 🏦 Suporte a ações, FIIs, ETFs e fundos de investimento
- 🤖 Dashboard visual com chatbot integrado (IA + comandos ao agente)

---

## 📁 Estrutura do Projeto

```
agente-investimentos/
├── agent.js        # Código principal do agente
├── .env            # Credenciais e configurações (não versionar!)
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
Crie um arquivo `.env` na raiz do projeto com as suas credenciais:
```env
DISCORD_WEBHOOK_URL=https://discord.com/api/webhooks/SEU_ID/SEU_TOKEN
RICO_API_TOKEN=seu_token_aqui
RICO_ACCOUNT_ID=sua_conta_aqui
```

### 4. Configure o Discord Webhook
- Abra um canal no Discord
- Clique em **Editar Canal → Integrações → Webhooks → Novo Webhook**
- Copie a URL gerada e cole no `.env`

### 5. Configure sua carteira
No arquivo `agent.js`, edite a `watchlist` com seus próprios ativos:
```js
watchlist: [
  { ticker: "PETR4", type: "acao", name: "Petrobras PN",  qtd: 10, aplicado: 350.00 },
  { ticker: "MXRF11", type: "fii", name: "Maxi Renda FII", qtd: 20, aplicado: 200.00 },
  // adicione quantos ativos quiser...
]
```

### 6. Rode o agente
```bash
node agent.js
```

---

## ⚙️ Configurações do Agente

Todas as configurações ficam no objeto `CONFIG` dentro do `agent.js`:

| Parâmetro | Padrão | Descrição |
|---|---|---|
| `dropThreshold` | `5` | % de queda vs preço de compra para disparar alerta |
| `checkInterval` | `*/5 * * * *` | Frequência de verificação (cron) |
| `confirmTimeout` | `300` | Segundos para o usuário confirmar a ordem |

---

## 🔄 Fluxo de Funcionamento

```
1. Agente verifica cotações no intervalo configurado
          ↓
2. Detecta queda ≥ X% vs preço médio de compra
          ↓
3. Envia alerta no Discord com detalhes do ativo
          ↓
4. Usuário digita no terminal: COMPRAR XXXXX
          ↓
5. Agente executa ordem de compra na corretora
          ↓
6. Confirmação de execução enviada no Discord
```

---

## 💬 Comandos do Terminal

Quando um alerta for disparado, o agente exibirá um código de confirmação no terminal:

```
⚡ [AÇÃO NECESSÁRIA] PETR4 caiu 6.30% vs preço de compra
   ✅ Digite: COMPRAR AB12X  → para executar a compra
   ❌ Digite: CANCELAR AB12X → para ignorar
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

## 🔒 Segurança

> ⚠️ **Nunca suba o arquivo `.env` para o GitHub.**

Adicione ao `.gitignore`:
```
node_modules/
.env
```

Nunca compartilhe publicamente:
- Token de API da corretora
- URL do Discord Webhook
- ID da sua conta

---

## ⚠️ Aviso Legal

Este projeto é experimental e educacional. O autor não se responsabiliza por perdas financeiras decorrentes do uso deste software. Sempre revise as ordens antes de confirmar e consulte um profissional de investimentos.

A integração com corretoras depende da disponibilidade de API oficial de cada instituição. Verifique os termos de uso da sua corretora antes de utilizar automações.

---

## 🤝 Contribuindo

Contribuições são bem-vindas! Sinta-se à vontade para abrir uma _issue_ ou enviar um _pull request_.

1. Fork o projeto
2. Crie uma branch: `git checkout -b minha-feature`
3. Commit suas mudanças: `git commit -m 'feat: minha feature'`
4. Push para a branch: `git push origin minha-feature`
5. Abra um Pull Request

---

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.
