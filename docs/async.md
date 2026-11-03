# Async em OCaml

Async é uma biblioteca desenvolvida pela Jane Street
para programação assíncrona.

## Principais recursos

- Deferred: representa resultados futuros.
- Scheduler: gerencia a execução das tarefas.
- Clock: permite operações relacionadas ao tempo.
- Async_unix: integra o escalonador com recursos Unix.

## Modelo de concorrência

Async utiliza tarefas cooperativas (user-level threads)
e operações assíncronas representadas por Deferred.

## Compatibilidade

Async_kernel possui componentes portáveis, mas
Async ainda não disponibiliza um scheduler nativo
para Windows.

Por esse motivo, não foi executada uma demonstração
prática dessa biblioteca no ambiente Windows nativo.

## Comparação

Lwt foi utilizado nas demonstrações executáveis
de promises e operações assíncronas.