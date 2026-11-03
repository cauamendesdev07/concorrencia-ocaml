open Lwt.Infix

let rec tarefa nome quantidade =
  if quantidade = 0 then
    Lwt.return_unit
  else
    (
      Printf.printf "[%s] Executando etapa\n%!" nome;

      Lwt.pause () >>= fun () ->

      tarefa nome (quantidade - 1)
    )

let main () =
  let tarefa1 = tarefa "Corrotina A" 5 in
  let tarefa2 = tarefa "Corrotina B" 5 in

  Lwt.join [tarefa1; tarefa2]

let () =
  Lwt_main.run (main ())