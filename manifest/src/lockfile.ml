[@@@warning "-27"]

open ContainersLabels

module LockfileTy = struct
  module LockfileTy = Alice_types.Lockfile_types

  type dep_t = LockfileTy.locked_dep
  type deps_t = dep_t list
  type t = LockfileTy.t

  let create ver deps = { LockfileTy.version = ver; LockfileTy.resolved_deps = deps }
  let name x = { LockfileTy.name = String.trim x }
  let names x = List.map ~f:name x
end

let ( let* ) = Containers.Result.( let* )
let create = LockfileTy.create

let of_kdl (node : Kdl.node) : (LockfileTy.t, 'a) result =
  let parse_child (child : Kdl.node) : (LockfileTy.dep_t, 'a) result =
    Ok { name = child.name }
  in
  let* deps = node.children |> List.map ~f:parse_child |> List.all_ok in
  Ok (LockfileTy.create "0.0.1" deps)
;;
