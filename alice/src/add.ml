open! Alice_stdlib
open Alice_engine
open Climate

let add =
  let open Arg_parser in
  let+ () = Common.set_globals_from_flags
  and+ project = Common.parse_project in
  Project.clean project
;;

let subcommand =
  let open Command in
  subcommand "add" (singleton ~doc:"Install packages from opam" add)
;;
