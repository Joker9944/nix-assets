{
  pkgs,
  utility,
  ...
}:
utility.custom.mkImageDerivationSet {
  inherit pkgs;
  pname = "misty-forest-with-pine-trees-in-fog";
  type = "backgrounds";
  url = "https://images.pexels.com/photos/31979792/pexels-photo-31979792.jpeg";
  sha256 = "sha256-MJe0ABa4r3b6z4V4Yz8Z0fJ93aRKqdb+WpphF7VHAg8=";
  gravity = "South";
} { }
