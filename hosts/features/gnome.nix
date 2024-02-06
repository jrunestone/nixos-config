{ inputs, lib, pkgs, config, outputs, ... }: {
  environment.gnome.excludePackages = with pkgs.gnome; [
    cheese      # photo booth
    epiphany    # web browser
    simple-scan # document scanner
    yelp        # help viewer
    geary       # email client
    
    gnome-characters 
    gnome-contacts
    gnome-maps 
    gnome-music 
    gnome-weather 
    pkgs.gnome-tour
    pkgs.gnome-photos
    pkgs.gnome-connections
  ];
}