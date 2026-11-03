# Concorrência na linguagem OCaml

Projeto acadêmico desenvolvido para analisar e demonstrar os principais modelos e mecanismos de concorrência disponíveis no ecossistema OCaml.

## 1. Objetivo

O objetivo deste projeto é estudar como OCaml trabalha com concorrência, compartilhamento de memória, sincronização e execução paralela.

Também são analisadas bibliotecas externas que permitem implementar diferentes modelos de programação concorrente e assíncrona.

## 2. Tecnologias utilizadas

- OCaml 5.x
- OPAM
- Dune
- Lwt
- Eio
- Git

## 3. Estrutura do projeto

```text
concorrencia-ocaml/
│
├── docs/
│   └── async.md
│
├── examples/
│   ├── threads/
│   │   ├── main.ml
│   │   ├── shared_memory.ml
│   │   └── dune
│   │
│   ├── domains/
│   │   ├── main.ml
│   │   └── dune
│   │
│   ├── coroutines/
│   ├── event_loop/
│   ├── promises/
│   ├── actors/
│   ├── eio/
│   └── effects/
│
├── dune-project
└── README.md
```

## 4. Demonstrações desenvolvidas

### 4.1 Threads

Utilização do módulo `Thread` para criar e executar múltiplas threads.

Arquivo: `examples/threads/main.ml`

Conceitos demonstrados:
- Criação de threads com `Thread.create`.
- Execução concorrente.
- Espera pela finalização com `Thread.join`.

### 4.2 Compartilhamento de memória e sincronização

Arquivo: `examples/threads/shared_memory.ml`

Demonstra o compartilhamento de uma referência mutável entre threads e o problema de condição de corrida.

Também apresenta a utilização de Mutex para proteger regiões críticas.

Principais recursos:
- `ref`
- `Mutex.create`
- `Mutex.lock`
- `Mutex.unlock`

### 4.3 Corrotinas

Arquivo: `examples/coroutines/main.ml`

Utiliza a biblioteca Lwt para demonstrar tarefas cooperativas.

As tarefas podem suspender sua execução e permitir que outras tarefas avancem.

OCaml não possui corrotinas tradicionais como recurso nativo, mas bibliotecas externas permitem implementar comportamentos semelhantes.

### 4.4 Event Loop

Arquivo: `examples/event_loop/main.ml`

Demonstra o gerenciamento de tarefas assíncronas utilizando Lwt.

O escalonador administra operações que aguardam determinados eventos, permitindo que outras tarefas continuem.

### 4.5 Promises

Arquivo: `examples/promises/main.ml`

Demonstra a representação de resultados futuros utilizando `Lwt.t`.

São utilizados mecanismos de criação, resolução e encadeamento de operações assíncronas.

### 4.6 Modelo de Atores

Arquivo: `examples/actors/main.ml`

Implementa um exemplo simplificado inspirado no modelo de atores utilizando `Lwt_mvar`.

Cada ator recebe mensagens por meio de uma mailbox e processa essas mensagens sem precisar compartilhar diretamente seu estado.

A implementação demonstra o padrão de atores, não um framework completo de atores.

### 4.7 Domains

Arquivo: `examples/domains/main.ml`

Demonstra paralelismo real utilizando Domains, recurso introduzido no OCaml 5.

Dois Domains executam cálculos independentes e seus resultados são posteriormente combinados.

Principais recursos:
- `Domain.spawn`
- `Domain.join`

### 4.8 Eio

Arquivo: `examples/eio/main.ml`

Utiliza a biblioteca Eio para demonstrar concorrência estruturada.

São criadas duas fibers que alternam suas execuções de maneira cooperativa.

### 4.9 Effect Handlers

Arquivo: `examples/effects/main.ml`

Demonstra a utilização de efeitos personalizados e seus respectivos handlers.

Esse mecanismo permite implementar estruturas avançadas de controle de execução, incluindo sistemas de corrotinas e escalonadores.

### 4.10 Async

Arquivo: `docs/async.md`

Apresenta uma análise da biblioteca Async, desenvolvida pela Jane Street.

São abordados:
- Deferred.
- Scheduler.
- Operações assíncronas.
- Limitações de compatibilidade com Windows.

A demonstração prática não foi executada devido à ausência de um scheduler nativo do Async para Windows.

## 5. Instalação

O ambiente utilizado é Windows, sem necessidade de WSL.

Instale OCaml, OPAM e Git.

Instale o Dune:

```powershell
opam install dune -y
```

Instale Lwt:

```powershell
opam install lwt -y
```

Instale Eio:

```powershell
opam install eio_main -y
```

Inicialize o ambiente OPAM, caso ainda não esteja configurado:

```powershell
opam init
```

## 6. Compilação

Na raiz do projeto, execute:

```powershell
dune build @all
```

Para limpar os arquivos de compilação:

```powershell
dune clean
```

## 7. Execução dos exemplos

Execute cada demonstração individualmente:

**Threads**

```powershell
dune exec ./examples/threads/main.exe
```

**Compartilhamento de memória e Mutex**

```powershell
dune exec ./examples/threads/shared_memory.exe
```

**Corrotinas**

```powershell
dune exec ./examples/coroutines/main.exe
```

**Event Loop**

```powershell
dune exec ./examples/event_loop/main.exe
```

**Promises**

```powershell
dune exec ./examples/promises/main.exe
```

**Atores**

```powershell
dune exec ./examples/actors/main.exe
```

**Domains**

```powershell
dune exec ./examples/domains/main.exe
```

**Eio**

```powershell
dune exec ./examples/eio/main.exe
```

**Effect Handlers**

```powershell
dune exec ./examples/effects/main.exe
```

## 8. Comparação dos modelos

| Modelo | Implementação | Característica |
|---|---|---|
| Threads | Nativo | Concorrência com systhreads |
| Mutex | Nativo | Sincronização de acesso compartilhado |
| Domains | Nativo OCaml 5 | Paralelismo real |
| Corrotinas | Lwt | Tarefas cooperativas |
| Event Loop | Lwt | Gerenciamento de operações assíncronas |
| Promises | Lwt | Representação de resultados futuros |
| Atores | Lwt_mvar | Comunicação por mensagens |
| Eio | Biblioteca externa | Concorrência estruturada |
| Async | Jane Street | Programação assíncrona |
| Effect Handlers | Nativo OCaml 5 | Controle de fluxo e execução personalizado |

## 9. Considerações finais

OCaml oferece diferentes mecanismos para trabalhar com concorrência e paralelismo.

As systhreads permitem executar tarefas concorrentes, enquanto Mutex possibilita controlar o acesso a regiões críticas.

Com a introdução dos Domains no OCaml 5, tornou-se possível executar código OCaml em paralelo utilizando múltiplos núcleos do processador.

Além dos recursos nativos, bibliotecas como Lwt e Eio ampliam as possibilidades de programação assíncrona e concorrência estruturada.

O desenvolvimento das demonstrações permitiu comparar diferentes modelos, identificar suas características e compreender as diferenças entre concorrência cooperativa, compartilhamento de memória e paralelismo.

---

**Projeto acadêmico — Análise de Concorrência na linguagem OCaml.**