{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.modules.zsh;
in
{
  options.modules.zsh = {
    enable = mkEnableOption "zsh";
  };
  config = mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      #   prezto.enable = true;
      #   prezto.tmux.autoStartRemote = true;
      initExtra = '''';
      oh-my-zsh = {
        enable = true;
        plugins = [ "tmux" ];
      };
      shellAliases = {
        ncg = "nix-collect-garbage && nix-collect-garbage -d && sudo nix-collect-garbage && sudo nix-collect-garbage -d && sudo rm /nix/var/nix/gcroots/auto/*";
        n = "clear && neofetch";
        v = "nvim";
        record = "wf-recorder --audio=alsa_output.pci-0000_08_00.6.analog-stereo.monitor -f $HOME/Videos/$(date +'%Y%m%d%H%M%S_1.mp4')";
        ls = "eza --icons --long";
        startbg = " nohup ~/flake2/backgrounds/swww_randomize.sh ~/flake2/backgrounds > output.log 2>&1 &";
        # nixos
        fl = "cd ~/flake2/ && v";
        notes = "cd ~/notes/ && v";
        music = "ncspot";
        vm = "sudo virsh net-start default";
      };
    };
  };
}
