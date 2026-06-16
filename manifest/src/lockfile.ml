[@@@warning "-27"]

open ContainersLabels

module LockfileTy = struct
  include Alice_types

  type dep_t = Lockfile_types.locked_dep
  type deps_t = Lockfile_types.locked_dep list
  type t = Lockfile_types.t

  let create (version : string) (deps : deps_t) : t = { version; resolved_deps = deps }
end

(* type t = *)
(* { meta : Package_meta.t *)
(* ; opam_deps : Lockfile_types.t option *)
(* } *)

let ( let* ) = Containers.Result.( let* )
let create version deps = LockfileTy.create

let of_kdl (node : Kdl.node) : (LockfileTy.t, 'a) result =
  let parse_child (child : Kdl.node) : (LockfileTy.dep_t, 'a) result =
    Ok { name = child.name }
  in
  let* deps = node.children |> List.map ~f:parse_child |> List.all_ok in
  Ok (LockfileTy.create "0.0.1" deps)
;;
