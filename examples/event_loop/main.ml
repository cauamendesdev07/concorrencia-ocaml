open Lwt.Infix

let tarefa nome tempo =
  Printf.printf "[%s] Iniciando...\n%!" nome;

  Lwt_unix.sleep tempo >>= fun () ->

  Printf.printf "[%s] Finalizada!\n%!" nome;

  Lwt.return_unit

let main () =
  let tarefa1 = tarefa "Tarefa A" 3.0 in
  let tarefa2 = tarefa "Tarefa B" 1.0 in
  let tarefa3 = tarefa "Tarefa C" 2.0 in

  Lwt.join [tarefa1; tarefa2; tarefa3]

let () =
  Printf.printf "Iniciando Event Loop...\n";

  Lwt_main.run (main ());

  Printf.printf "Todas as tarefas foram concluídas.\n"