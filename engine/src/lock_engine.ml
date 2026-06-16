open Alice_package
open Alice_types

type t =
  { package : Package.t
  ; opam_dependencies : Lockfile_types.t option
  }

let of_package package =
  { package; opam_dependencies = None }
;;

let resolve { opam_dependencies; _ } =
  match opam_dependencies with
  | None -> print_endline "No dependencies to lock."
  | Some _deps ->
    (* Placeholder: Here we will invoke opam *)
    print_endline "Resolving opam dependencies..."
;;
