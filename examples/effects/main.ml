type _ Effect.t += Yield : unit Effect.t

let yield () =
  Effect.perform Yield

let tarefa nome =
  for i = 1 to 3 do
    Printf.printf "[%s] Executando etapa %d\n%!" nome i;
    yield ()
  done

let executar nome =
  Effect.Deep.try_with
    (fun () -> tarefa nome)
    ()
    {
      retc = (fun resultado -> resultado);
      exnc = (fun erro -> raise erro);

      effc = fun (type a) (efeito : a Effect.t) ->
        match efeito with
        | Yield ->
            Some (fun (continuacao : (a, _) Effect.Deep.continuation) ->
              Printf.printf "  [HANDLER] Yield recebido\n%!";
              Effect.Deep.continue continuacao ()
            )
        | _ -> None;
    }

let () =
  executar "Tarefa A";
  executar "Tarefa B";

  Printf.printf "Execucao concluida!\n"