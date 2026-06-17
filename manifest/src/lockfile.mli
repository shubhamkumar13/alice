module LockfileTy : sig
  type dep_t
  type deps_t
  type t

  val names : string list -> deps_t
  val create : string -> deps_t -> t
end

val of_kdl : Kdl.node -> (LockfileTy.t, 'a) result
val create : string -> LockfileTy.deps_t -> LockfileTy.t
