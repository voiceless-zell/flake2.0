{
  pkgs,
  isNIXOS,
  ...
}:
let
  Tokyo-Night = pkgs.fetchFromGitHub {
    owner = "Fausto-Korpsvart";
    repo = "Tokyo-Night-GTK-Theme";
    rev = "e9790345a6231cd6001f1356d578883fac52233a";
    hash = "sha256-Q9UnvmX+GpvqSmTwdjU4hsEsYhA887wPqs5pyqbIhmc=";
  };
in
{
  xdg.dataFile."themes/Tokyo-Night".source = Tokyo-Night;
  gtk = {
    enable = isNIXOS;
    iconTheme = {
      package = Tokyo-Night;
      name = "Tokyo-Night";
    };
    theme = {
      package = Tokyo-Night;
      name = "Tokyo-Night";
    };
  };
}
