let tarefa nome =
  for i = 1 to 5 do
    Printf.printf "[%s] Executando etapa %d\n%!" nome i;
    Thread.delay 0.2
  done

let () =
  Printf.printf "Iniciando programa...\n";

  let thread1 = Thread.create tarefa "Thread 1" in
  let thread2 = Thread.create tarefa "Thread 2" in

  Thread.join thread1;
  Thread.join thread2;

  Printf.printf "Todas as threads foram finalizadas.\n"