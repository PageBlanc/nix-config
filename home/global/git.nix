/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   git.nix                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: pageblanche <pageblanche@student.42.fr>    #+#  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2026-05-11 18:48:52 by pageblanche       #+#    #+#             */
/*   Updated: 2026-05-11 18:48:52 by pageblanche      ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */


{...} :
{
  programs.git.enable = true;
  programs.git.settings = 
    {
      user.email = "PageBlanchePro@proton.me";
      user.name = "PageBlanche";
      push.autoSetUpRemote = true;
      help.autocorrect = 1;
      pull.rebase = true;
    };
}