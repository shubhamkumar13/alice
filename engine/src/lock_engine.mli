module LockfileTy : sig
  type dep_t
  type deps_t
  type t

  val names : string list -> deps_t
  val create : string -> deps_t -> t
end

module PackageTy : sig
  type t
end

type t

val of_package : PackageTy.t -> t
val resolve : t -> (LockfileTy.t, string) result
