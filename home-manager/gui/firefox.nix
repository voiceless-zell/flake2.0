{
  isNIXOS,
  ...
}:

{
  programs.firefox = {
    enable = isNIXOS;
    profiles = {
      default = {
        id = 0;
        name = "zell";
        search = {
          force = true;
          default = "Google";
          engines = {
            "NixOS Search" = {
              urls = [
                {
                  template = "https://search.nixos.org/packages?channel=unstable&from=0&size=50&sort=relevance&type=packages&query={searchTerms}";
                }
              ];
              iconUpdateURL = "https://nixos.wiki/favicon.png";
              definedAliases = [ "@ns-packages" ];
            };
            "NixOS Opt Search" = {
              urls = [
                {
                  template = "https://search.nixos.org/options?channel=unstable&from=0&size=50&sort=relevance&type=packages&query={searchTerms}";
                }
              ];
              iconUpdateURL = "https://nixos.wiki/favicon.png";
              definedAliases = [ "@ns-options" ];
            };
            "Home-Manager Search" = {
              urls = [
                { template = "https://mipmip.github.io/home-manager-option-search/?query={searchTerms}"; }
              ];
              iconUpdateURL = "https://nixos.wiki/favicon.png";
              definedAliases = [ "@hm" ];
            };
            "Wikipedia (en)".metaData.alias = "@wiki";
            "Amazon.com".metaData.hidden = true;
            "Bing".metaData.hidden = true;
            "eBay".metaData.hidden = true;
          };
        };
        settings = {
          "general.smoothScroll" = false;
        };
      };
    };
  };
}
