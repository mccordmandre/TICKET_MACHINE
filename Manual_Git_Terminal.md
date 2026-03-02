# Manual Git para Terminal

---

## 0. Abrir o Terminal numa pasta (macOS)

Há duas formas rápidas:

**Opção A — Finder + atalho:**
1. Abre o Finder e navega até à pasta do projecto
2. Clica com o botão direito na pasta (ou `Control + clique`)
3. Escolhe **"Open Terminal at Folder"** (ou **"Abrir Terminal na Pasta"**)

> Se não aparece essa opção: System Settings → Keyboard → Keyboard Shortcuts → Services → activa "New Terminal at Folder".

**Opção B — Arrastar pasta para o Terminal:**
1. Abre o Terminal (Spotlight: `Cmd + Espaço` → escreve `Terminal`)
2. Escreve `cd` seguido de espaço
3. Arrasta a pasta do Finder para a janela do Terminal
4. Carrega `Enter`

---

## 1. Instalar o Git (só uma vez)

Abre o Terminal e escreve:

```bash
git --version
```

Se não estiver instalado, o macOS sugere instalar automaticamente. Aceita e espera.

Depois configura o teu nome e email (só uma vez):

```bash
git config --global user.name "O Teu Nome"
git config --global user.email "o.teu.email@exemplo.com"
```

---

## 2. Clonar o repositório (só na primeira vez)

Isto faz download do projecto para o teu computador.

```bash
cd ~/Documents
git clone https://github.com/utilizador/nome-do-projecto.git
cd nome-do-projecto
```

> Só precisas de fazer o clone **uma vez**. Depois usas `git pull` para actualizar.

---

## 3. Workflow diário — os comandos que vais usar sempre

Cada vez que fores trabalhar no projecto, segue estes passos por esta ordem:

### Passo 1 — Actualizar (antes de começar)

```bash
git pull
```

Faz download das alterações que os outros fizeram. Faz **sempre** isto antes de começar a editar.

### Passo 2 — Trabalhar nos ficheiros

Edita os teus ficheiros normalmente (Quartus, VS Code, IntelliJ, etc.).

### Passo 3 — Ver o que mudou

```bash
git status
```

Mostra quais ficheiros foram modificados, adicionados ou apagados. Ficheiros a vermelho ainda não estão preparados para commit.

### Passo 4 — Adicionar ficheiros ao commit

Para adicionar tudo o que mudou:

```bash
git add .
```

Para adicionar só um ficheiro específico:

```bash
git add nome_do_ficheiro.vhd
```

### Passo 5 — Fazer commit (guardar no histórico)

```bash
git commit -m "descrição do que fizeste"
```

Exemplos de boas mensagens:

```bash
git commit -m "Adicionado módulo KeyScan"
git commit -m "Corrigido bug no contador"
git commit -m "Actualizado testbench do decoder"
```

> A mensagem entre aspas é obrigatória. Sem ela o commit não funciona.

### Passo 6 — Enviar para o GitHub

```bash
git push
```

Envia os teus commits para o repositório online. Os outros vêem as tuas alterações quando fizerem `git pull`.

---

## Resumo rápido

| Comando | O que faz |
|---------|-----------|
| `git clone <url>` | Download do projecto (só 1x) |
| `git pull` | Actualiza com alterações dos outros |
| `git status` | Mostra o que mudou |
| `git add .` | Prepara tudo para commit |
| `git commit -m "msg"` | Grava no histórico local |
| `git push` | Envia para o GitHub |
| `git log --oneline` | Ver histórico de commits |

---

## Problemas comuns

### "Não consigo fazer push"

Provavelmente alguém fez push antes de ti:

```bash
git pull
git push
```

### "Tenho conflitos"

Acontece quando tu e outra pessoa editaram o mesmo ficheiro na mesma zona. O Git marca o ficheiro com:

```
<<<<<<< HEAD
  (o teu código)
=======
  (o código do outro)
>>>>>>> origin/main
```

Abre o ficheiro, escolhe qual versão manter (ou junta as duas), apaga as linhas com `<<<`, `===`, `>>>`. Depois:

```bash
git add .
git commit -m "Resolvido conflito"
git push
```

### "Quero desfazer as minhas alterações"

Para descartar alterações num ficheiro (volta à última versão guardada):

```bash
git checkout -- nome_do_ficheiro.vhd
```

> Cuidado: isto apaga as tuas alterações sem possibilidade de recuperar.

### "Erro de autenticação / password"

O GitHub já não aceita passwords. Precisas de um Personal Access Token:

1. Vai a GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
2. Gera um token com a permissão "repo"
3. Quando o Git pedir password, cola o token em vez da password

---

## Regra de ouro

> **PULL antes de trabalhar. PUSH quando acabares.**
> Se toda a gente seguir esta regra, 90% dos problemas desaparecem.
