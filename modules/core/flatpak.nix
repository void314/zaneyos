{pkgs, ...}: {
  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-hyprland];
    configPackages = [pkgs.hyprland];
  };
  services = {
    flatpak = {
      enable = true;

      # List the Flatpak applications you want to install
      # Use the official Flatpak application ID (e.g., from flathub.org)
      # Examples:
      packages = [
        net.nokyan.Resources              # Manage resources
        org.gnome.Showtime                # Video player
        app.zen_browser.zen               # Zen Browser
        
        # Add other Flatpak IDs here, e.g., "org.mozilla.firefox"
      ];

      # Optional: Automatically update Flatpaks when you run `nixos-rebuild switch`
      update.onActivation = true;
    };
  };
}
