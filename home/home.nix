# ************************************************************************** #
#                                                                            #
#                                                        :::      ::::::::   #
#   home.nix                                           :+:      :+:    :+:   #
#                                                    +:+ +:+         +:+     #
#   By: pageblanche <pageblanche@student.42.fr>    #+#  +:+       +#+        #
#                                                +#+#+#+#+#+   +#+           #
#   Created: 2026-05-10 17:45:31 by pageblanche       #+#    #+#             #
#   Updated: 2026-05-10 17:45:31 by pageblanche      ###   ########.fr       #
#                                                                            #
# ************************************************************************** #

{
lib,
username ? "pageblanche",
homeDir ? "/home/pageblanche",
isOs ? false,
configSops ? true,
...
}:

{
  imports = lib.concatLists [
    (lib.fileset.toList ./global)
  ];

  home.username = lib.mkIf (!isOs) "${username}";
  home.homeDirectory = lib.mkIf (!isOs) "${homeDir}";

  #discord
  programs.discord.enable = true;

  home.stateVersion = "25.11";

  # sops = lib.mkIf configSops{
  #   defaultSopsFile = ../secrets/secrets.yaml;
  #   age.keyFile = "${homeDir}/.config/sops/age/keys.txt";
  # };

  services.dunst.enable = true;
  programs.home-manager.enable = true;
}