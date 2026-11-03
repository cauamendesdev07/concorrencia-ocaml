let calcular nome inicio fim =
  Printf.printf "[%s] Iniciando processamento...\n%!" nome;

  let resultado = ref 0 in

  for i = inicio to fim do
    resultado := !resultado + i
  done;

  Printf.printf "[%s] Finalizado!\n%!" nome;

  !resultado

let () =
  Printf.printf "Iniciando processamento paralelo...\n";

  let domain1 =
    Domain.spawn (fun () ->
      calcular "Domain 1" 1 10000000
    )
  in

  let domain2 =
    Domain.spawn (fun () ->
      calcular "Domain 2" 10000001 20000000
    )
  in

  let resultado1 = Domain.join domain1 in
  let resultado2 = Domain.join domain2 in

  match resultado1, resultado2 with
  | Ok r1, Ok r2 ->
      Printf.printf "\nResultado Domain 1: %d\n" r1;
      Printf.printf "Resultado Domain 2: %d\n" r2;
      Printf.printf "Resultado total: %d\n" (r1 + r2)

  | Error _, _ | _, Error _ ->
      Printf.printf "Erro durante o processamento.\n"