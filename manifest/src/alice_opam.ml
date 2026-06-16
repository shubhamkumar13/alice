[@@@warning "-27"]

open Alice_types
module Package_meta = Alice_package_meta.Package_meta

let ( let* ) = Containers.Option.( let* )

type t =
  { meta : Package_meta.t
  ; opam_deps : Lockfile_types.t option
  }

(* let opam = *)
(* Alice_opam.create *)
(* ~meta *)
(* ~opam_deps:(Some { version = "0.0.1"; resolved_dependencies = deps }) *)
(* in *)
let create ~meta ~opam_deps = { meta; opam_deps }
