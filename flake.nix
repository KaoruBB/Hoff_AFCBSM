{
  description = "Julia environment for Hoff exercises";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
        juliaVersion = pkgs.julia-bin;
        juliaPackages = [
          # 必要なJuliaパッケージがあれば追加
        ];
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            juliaVersion
            pkgs.nodejs
            pkgs.python3
          ];

          shellHook = ''
            echo "Julia development environment is ready!"
            echo "Julia v$(julia --version | cut -d' ' -f3)"

            export JULIA_DEPOT_PATH="$PWD/.julia"
            export JULIA_PROJECT="@."

            julia -e 'using Pkg; Pkg.instantiate()'
            # julia -e 'using Pkg; Pkg.add(["Package1", "Package2"])'
          '';
        };
      }
    );
}
