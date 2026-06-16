type t

val of_package : Alice_package.Package.t -> t
val resolve : t -> unit
