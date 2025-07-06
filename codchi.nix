
{ config, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # System packages for development environment
  environment.systemPackages = with pkgs; [
    vscode
    git
    curl
    wget
  ];

  # Enable desktop environment for VSCode GUI
  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = true;
    desktopManager.xfce.enable = true;
  };

  # User configuration
  users.users.codchi = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ];
    shell = pkgs.bash;
  };

  # Enable sound for a complete desktop experience
  sound.enable = true;
  hardware.pulseaudio.enable = true;
}
