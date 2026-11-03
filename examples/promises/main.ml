open Lwt.Infix

let buscar_dados () =
  let promise, resolver = Lwt.wait () in

  Printf.printf "Iniciando busca de dados...\n%!";

  Lwt.async (fun () ->
    Lwt_unix.sleep 2.0 >>= fun () ->

    Printf.printf "Dados encontrados!\n%!";

    Lwt.wakeup_later resolver "Resultado da operacao";

    Lwt.return_unit
  );

  promise

let main () =
  let dados = buscar_dados () in

  Printf.printf "Enquanto isso, o programa continua...\n%!";

  dados >>= fun resultado ->

  Printf.printf "Resultado recebido: %s\n" resultado;

  Lwt.return_unit

let () =
  Lwt_main.run (main ())