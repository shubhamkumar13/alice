module Lockfile_types : sig
  type locked_dep = { name : string }

  type t =
    { version : string
    ; resolved_deps : locked_dep list
    }
end
