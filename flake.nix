# ************************************************************************** #
#                                                                            #
#                                                        :::      ::::::::   #
#   flake.nix                                          :+:      :+:    :+:   #
#                                                    +:+ +:+         +:+     #
#   By: pageblanche <pageblanche@student.42.fr>    #+#  +:+       +#+        #
#                                                +#+#+#+#+#+   +#+           #
#   Created: 2026-05-10 17:24:09 by pageblanche       #+#    #+#             #
#   Updated: 2026-05-10 17:24:09 by pageblanche      ###   ########.fr       #
#                                                                            #
# ************************************************************************** #

{
  description = "Nixos and home-manager config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

	sops-nix = {
	  url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
	};

  home-manager = {
    url = "github:nix-community/home-manager/release-25.11";
    inputs.nixpkgs.follows = "nixpkgs";
  };

	nixos-hardware.url = "github:NixOS/nixos-hardware/master";

	firefox-addons = {
	  url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
	  inputs.nixpkgs.follows = "nixpkgs";
	};

  };

  outputs = { nixpkgs, home-manager, nixos-hardware, ... }@inputs:
	let
	  pkgs = import nixpkgs { system = "x86_64-linux"; config.allowUnfree = true; };

      osConfig = {flakeName, extraModules ? []}: nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; flakeName = flakeName; };
        modules = nixpkgs.lib.concatLists [
		  [
		    ./os/os.nix
			./os/hosts/${flakeName}.nix
			inputs.sops-nix.nixosModules.sops
		  ]
		  extraModules
		];
      };

	  homeConfig = {flakeName, sops ? true, extraModules ? [], username ? "pageblanche", homeDir ? "/home/pageblanche"}: home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
	    extraSpecialArgs = { inherit inputs; username = username; homeDir = homeDir; isOs = false; configSops = sops; };
        modules = nixpkgs.lib.concatLists [
		  [
		    ./home/home.nix
			./home/hosts/${flakeName}.nix
			inputs.sops-nix.homeManagerModules.sops
		  ]
		  extraModules
		];
	  };

	in {

      nixosConfigurations = {
        # server = osConfig {flakeName = "server";};
        # vbox = osConfig {flakeName = "vbox";};
        laptop = osConfig {flakeName = "laptop";};
        # desktop = osConfig {flakeName = "desktop";};
      };

      homeConfigurations = {
	    # default = homeConfig { flakeName = "default";};
	    # ft = homeConfig { flakeName = "ft"; username = "axdubois"; homeDir = "/home/axdubois"; sops = false;};
	    laptop = homeConfig { flakeName = "laptop"; };
	    # desktop = homeConfig { flakeName = "desktop"; };
	    # server = homeConfig { flakeName = "server"; };
	  };

    };
}