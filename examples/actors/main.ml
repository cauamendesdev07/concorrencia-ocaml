open Lwt.Infix

type message =
  | Print of string
  | Stop

let rec actor mailbox =
  Lwt_mvar.take mailbox >>= function

  | Print mensagem ->
      Printf.printf "[ATOR] Mensagem recebida: %s\n%!" mensagem;
      actor mailbox

  | Stop ->
      Printf.printf "[ATOR] Encerrando...\n%!";
      Lwt.return_unit

let main () =
  let mailbox = Lwt_mvar.create_empty () in

  Printf.printf "Iniciando ator...\n";

  let processo = actor mailbox in

  Lwt_mvar.put mailbox (Print "Primeira mensagem") >>= fun () ->

  Lwt_mvar.put mailbox (Print "Segunda mensagem") >>= fun () ->

  Lwt_mvar.put mailbox (Print "Terceira mensagem") >>= fun () ->

  Lwt_mvar.put mailbox Stop >>= fun () ->

  processo

let () =
  Lwt_main.run (main ())