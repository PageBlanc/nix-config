# ************************************************************************** #
#                                                                            #
#                                                        :::      ::::::::   #
#   os.nix                                           :+:      :+:    :+:   #
#                                                    +:+ +:+         +:+     #
#   By: pageblanche <pageblanche@student.42.fr>    #+#  +:+       +#+        #
#                                                +#+#+#+#+#+   +#+           #
#   Created: 2026-05-10 17:45:31 by pageblanche       #+#    #+#             #
#   Updated: 2026-05-10 17:45:31 by pageblanche      ###   ########.fr       #
#                                                                            #
# ************************************************************************** #

{ lib, flakeName, ... }:

{
  imports = lib.concatLists [
    [ ./hardware-configuration.nix ]
    (lib.fileset.toList ./global)
  ];

  system.stateVersion = "25.11";
  environment.etc.nixosFlakeName.text = "${flakeName}";
}