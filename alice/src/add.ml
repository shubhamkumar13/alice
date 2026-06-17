open! Alice_stdlib
open Alice_engine
open Alice_package
open Climate

let add =
  let open Arg_parser in
  let+ () = Common.set_globals_from_flags
  and+ project = Common.parse_project in
  let package = Project.package project in
  let _meta = Package.meta package in
  let lock = Lock_engine.of_package package in
  (match Lock_engine.resolve lock with
  | Ok _ -> print_endline "Dependencies resolved."
  | Error e -> print_endline e);
  exit 0
;;

let subcommand =
  let open Command in
  subcommand "add" ~aliases:[ "i"; "a" ] (singleton ~doc:"Install packages from opam" add)
;;
