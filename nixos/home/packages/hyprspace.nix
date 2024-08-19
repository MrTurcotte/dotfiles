{ pkgs, ... }:

let
  hyprspace = pkgs.callPackage (pkgs.fetchFromGitHub {
    owner = "KZDKM";
    repo = "Hyprspace";
    rev = "e8662093ae5b6e13a3cf1145d21d4804a3e84aeb";  # Replace with desired commit or branch
    sha256 = "sha256-9aM4MCBJn4UstcsSdukOFTxg79keUMTw9Kmqr7Wsfmw=";  # Add hash for security
  }) {};
in
{
  environment.systemPackages = with pkgs; [
    hyprspace
  ];
}
