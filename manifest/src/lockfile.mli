module LockfileTy : sig
  type t
  type deps_t
end

val of_kdl : Kdl.node -> (LockfileTy.t, _) result
val create : string -> LockfileTy.deps_t -> LockfileTy.t
