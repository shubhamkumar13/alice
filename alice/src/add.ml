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
  exit 0
;;

let subcommand =
  let open Command in
  subcommand "add" ~aliases:[ "i"; "a" ] (singleton ~doc:"Install packages from opam" add)
;;
