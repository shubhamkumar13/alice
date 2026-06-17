module PackageMeta = Alice_package_meta.Package_meta
module LockfileTy = Alice_types.Lockfile_types

type t = {
  meta : PackageMeta.t;
  opam_deps : LockfileTy.t option
}

val create : meta:PackageMeta.t -> opam_deps:LockfileTy.t option -> t