# #######################################################################################
# HYPRLAND CONFIG CUSTOM
# #######################################################################################

{...}:
{

wayland.windowManager.hyprland.enable = true;
wayland.windowManager.hyprland.settings = {

  ###################
  ### MY PROGRAMS ###
  ###################
  "$terminal" = "kitty";
  "$fileManager" = "dolphin";
  "$menu" = "wofi --show drun";

  "$mainMod" = "SUPER";

  ################
  ### MONITORS ###
  ################
  monitor=[
    "Virtual-1,1920x1080,0x0,1"
  ];

  #################
  ### AUTOSTART ###
  #################
  exec-once = ["$terminal"];

  #############################
  ### ENVIRONMENT VARIABLES ###
  #############################
  env = [
    "XCURSOR_SIZE,24"
  "HYPRCURSOR_SIZE,24"
  ];

  #####################
  ### LOOK AND FEEL ###
  #####################
  general = {
      gaps_in = 5;
      gaps_out = 20;
      border_size = 2;

      col.active_border = "rgba(33ccffee) rgba(00ff99ee) 45deg";
      col.inactive_border = "rgba(595959aa)";

      resize_on_border = false;
      allow_tearing = false;

      layout = "floating";
  };

  decoration = {
      rounding = 10;
      rounding_power = 2;

      active_opacity = 1.0;
      inactive_opacity = 1.0;

      shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
      };

      blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
      };
  };

  animations = {
      enabled = true;

      bezier = [
        "easeOutQuint,0.23,1,0.32,1"
        "easeInOutCubic,0.65,0.05,0.36,1"
      ];

      animation =[
        "global,1,10,default"
        "windows,1,4.79,easeOutQuint"
      ];
      # animation = fade,1,3.03,quick
  };

  misc = {
      force_default_wallpaper = -1;
      disable_hyprland_logo = false;
  };

  #############
  ### INPUT ###
  #############
  input = {
      kb_layout = "fr";
      follow_mouse = 1;
      sensitivity = 0;

      touchpad = {
          natural_scroll = false;
      };
  };

  ###################
  ### KEYBINDINGS ###
  ###################

  bind = [
    # Apps
    "$mainMod, Q, exec, $terminal"
    "CTRL ALT, T, exec, $terminal"
    "$mainMod, E, exec, $fileManager"
    "$mainMod, R, exec, $menu"

    # Window management
    "$mainMod, C, killactive,"
    "$mainMod, V, togglefloating,"
    "$mainMod, M, exit,"

    # FULLSCREEN
    "$mainMod, up, fullscreen, 1"

    # SNAP WINDOWS
    "$mainMod, left, movewindow, l"
    "$mainMod, right, movewindow, r"

    # WORKSPACES (CTRL)
    "CTRL, right, workspace, e+1"
    "CTRL, left, workspace, e-1"

    # MOVE WINDOW WITH WORKSPACE
    "CTRL SHIFT, right, movetoworkspace, e+1"
    "CTRL SHIFT, left, movetoworkspace, e-1"

    # ALT TAB
    "ALT, TAB, cyclenext,"
    "ALT SHIFT, TAB, cyclenext, prev"

    # Workspaces direct
    "$mainMod, 1, workspace, 1"
    "$mainMod, 2, workspace, 2"
    "$mainMod, 3, workspace, 3"
    "$mainMod, 4, workspace, 4"
    "$mainMod, 5, workspace, 5"
    "$mainMod, 6, workspace, 6"
    "$mainMod, 7, workspace, 7"
    "$mainMod, 8, workspace, 8"
    "$mainMod, 9, workspace, 9"
    "$mainMod, 0, workspace, 10"

    # Move window to workspace
    "$mainMod SHIFT, 1, movetoworkspace, 1"
    "$mainMod SHIFT, 2, movetoworkspace, 2"
    "$mainMod SHIFT, 3, movetoworkspace, 3"
    "$mainMod SHIFT, 4, movetoworkspace, 4"
    "$mainMod SHIFT, 5, movetoworkspace, 5"
    "$mainMod SHIFT, 6, movetoworkspace, 6"
    "$mainMod SHIFT, 7, movetoworkspace, 7"
    "$mainMod SHIFT, 8, movetoworkspace, 8"
    "$mainMod SHIFT, 9, movetoworkspace, 9"
    "$mainMod SHIFT, 0, movetoworkspace, 10"

  ];

  # Mouse move/resize
  bindm = [
    "$mainMod, mouse:272, movewindow"
    "$mainMod, mouse:273, resizewindow"
  ];

  ##############################
  ### WINDOWS RULES ###
  ##############################
  windowrule = [
    "suppressevent maximize, class:.*"
    "nofocus,class:^$,title:^$,xwayland:1,floating:1"
  ];
};
}