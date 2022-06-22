{
  inputs.flake-utils.url = "github:numtide/flake-utils";
  outputs = { nixpkgs, flake-utils, self }:
    let
      perSystem = system:
        let pkgs = nixpkgs.legacyPackages.${system}; in
        {
          devShell = pkgs.mkShell {
            packages = [ pkgs.racket ];
          };
        };
    in
    flake-utils.lib.eachDefaultSystem perSystem;
}
