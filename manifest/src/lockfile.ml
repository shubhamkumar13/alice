[@@@warning "-27"]

open ContainersLabels
open Result

type locked_dep = { name : string }

type t =
  { version : string
  ; resolved_dependencies : locked_dep list
  }

let of_kdl (node : Kdl.node) =
  let parse_child (child : Kdl.node) = Ok { name = child.name } in
  let* deps = List.all_ok (List.map node.children ~f:parse_child) in
  Ok { version = "0.0.1"; resolved_dependencies = deps }
;;
