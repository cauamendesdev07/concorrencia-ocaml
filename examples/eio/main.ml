open Eio.Std

let main _env =
  traceln "Iniciando Eio...";

  Fiber.both
    (fun () ->
      for i = 1 to 5 do
        traceln "Fiber A - Etapa %d" i;
        Fiber.yield ()
      done
    )
    (fun () ->
      for i = 1 to 5 do
        traceln "Fiber B - Etapa %d" i;
        Fiber.yield ()
      done
    );

  traceln "Todas as fibers foram finalizadas."

let () =
  Eio_main.run main