{ home-manager
, pkgs
, user
, ... 
}:

let
  nixosModule = { home }: home-manager.nixosModules.home-manager {
    home-manager.extraSpecialArgs = {
      inherit pkgs;
    };

    home-manager.users.${user} = { pkgs, ... }: {
      imports = [
        ./shared.nix
        home
      ];
    };
  };

in {
  desktop = nixosModule {
    home = ./desktop;
  };

  laptop = home-manager.nixosModules.home-manager {
    home-manager.extraSpecialArgs = {
      inherit pkgs;
    };

    home-manager.users.${user} = { pkgs, ... }: {
      imports = [
        ./shared.nix
        ./laptop
      ];
    };
  };

  vbox = nixosModule {
    home = ./vbox;
  };

  wsl = nixosModule {
    home = ./wsl;
  };
}