[@@@warning "-27"]

module LockfileTy = Alice_types.Lockfile_types
module PackageMeta = Alice_package_meta.Package_meta

let ( let* ) = Containers.Option.( let* )

type t =
  { meta : PackageMeta.t
  ; opam_deps : LockfileTy.t option
  }

let create ~meta ~opam_deps = { meta; opam_deps }
