Create a project with opam_dependencies:
  $ cat > Alice.kdl <<EOF
  > package {
  >   name test_opam
  >   version "0.1.0"
  >   opam_dependencies {
  >     base
  >     stdio
  >   }
  > }
  > EOF

Build the project:
  $ alice build
  
  Package "test_opam v0.1.0" defines contains neither an executable nor a library.
  [1]
