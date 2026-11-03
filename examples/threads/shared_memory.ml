let counter = ref 0
let mutex = Mutex.create ()

let increment_without_mutex () =
  for _ = 1 to 1000 do
    let current = !counter in
    Thread.delay 0.0001;
    counter := current + 1
  done

let increment_with_mutex () =
  for _ = 1 to 1000 do
    Mutex.lock mutex;

    counter := !counter + 1;

    Mutex.unlock mutex
  done

let execute task =
  let t1 = Thread.create task () in
  let t2 = Thread.create task () in

  Thread.join t1;
  Thread.join t2

let () =
  Printf.printf "=== SEM MUTEX ===\n";

  counter := 0;
  execute increment_without_mutex;

  Printf.printf "Resultado: %d\n" !counter;
  Printf.printf "Esperado: 2000\n\n";

  Printf.printf "=== COM MUTEX ===\n";

  counter := 0;
  execute increment_with_mutex;

  Printf.printf "Resultado: %d\n" !counter;
  Printf.printf "Esperado: 2000\n"