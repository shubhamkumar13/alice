open Alice_package
open Alice_types
open! ContainersLabels
module Command = Alice_stdlib.Command
module Process = Alice_io.Process.Blocking

module LockfileTy = struct
  module LockfileTy = Alice_manifest.Lockfile.LockfileTy

  type dep_t = LockfileTy.dep_t
  type deps_t = LockfileTy.deps_t
  type t = LockfileTy.t

  let names lines = LockfileTy.names lines
  let create version deps = LockfileTy.create version deps
end

module PackageTy = struct
  module Package = Alice_package.Package

  type t = Package.t
end

type t =
  { package : Package.t
  ; opam_dependencies : Lockfile_types.t option
  }

let of_package package = { package; opam_dependencies = None }

let resolve { opam_dependencies; _ } =
  match opam_dependencies with
  | None -> Error "No dependencies to lock."
  | Some deps ->
    let env = Alice_env.current_env () in
    let version = deps.version in
    let opam_prog = Command.create "opam" ~args:[ "list" ] env in
    let run_opam prog = Process.run_command_capturing_stdout_lines prog in
    (match run_opam opam_prog with
     | Ok (report, lines) ->
       if Alice_io.Process.Report.is_exit_0 report
       then Ok LockfileTy.(create version (names lines))
       else Error "Failed to resolve dependencies."
     | Error _ -> Error "Failed to execute opam command.")
;;
