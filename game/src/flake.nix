{
  description = "Flake for DOOM development";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs } :
   
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
      {
        devShells.${system}.default = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            pkg-config
          ];

          buildInputs = with pkgs; [
            git
            slade
            uzdoom
          ];

          UZDOOM_BIN = "${pkgs.uzdoom}/bin/uzdoom";

          shellHook = ''
          echo "EACH in DOOM Flake.nix is ready"
          '';
        };
      };
      
}
