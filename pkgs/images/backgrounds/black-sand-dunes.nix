{
  pkgs,
  utility,
  ...
}:
utility.custom.mkImageDerivationSet {
  inherit pkgs;
  pname = "black-sand-dunes";
  type = "backgrounds";
  url = "https://images.pexels.com/photos/2387793/pexels-photo-2387793.jpeg";
  sha256 = "sha256-2S9foYfeuFQOPA+Nqkk7Zvlcz+P9mOBzUQ+I4+kLeAc=";
} { }
