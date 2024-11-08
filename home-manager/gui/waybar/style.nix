{
  ...
}:
{
  programs.waybar.style = ''

        /*
    *
    * Base16 Tokyo City Terminal Dark
    * Author: Michaël Ball
    *
    */

    @define-color base00 #171d23;
    @define-color base01 #1d252c;
    @define-color base02 #28323a;
    @define-color base03 #526270;
    @define-color base04 #b7c5d3;
    @define-color base05 #d8e2ec;
    @define-color base06 #f6f6f8;
    @define-color base07 #fbfbfd;
    @define-color base08 #d95468;
    @define-color base09 #ff9e64;
    @define-color base0A #ebbf83;
    @define-color base0B #8bd49c;
    @define-color base0C #70e1e8;
    @define-color base0D #539afc;
    @define-color base0E #b62d65;
    @define-color base0F #dd9d82;
    * #waybar {
        font-family: "SF Pro Display", Cantarell, Noto Sans, sans-serif;
        font-size: 16px;
        border-radius: 20px;
        margin-right: 5px;
        margin-left: 5px;
        margin-top: 30px;
    }

    #window {
        margin-top: 15px;
        padding-left: 16px;
        padding-right: 20px;
    	border-radius: 15px;
    	transition: none;
    	/*
        color: #f8f8f2;
    	background: #282a36;
        */
        color: transparent;
    	background: transparent;
    }

    window#waybar {
        border-radius: 0;
        box-shadow: none;
        text-shadow: none;
        transition-duration: 0s;
        color: rgba(217, 216, 216, 1);
        background: transparent;
    }

    window#waybar.empty #window {
        background-color: transparent;
      }

    #workspaces {
        margin: 0 5px;
        border-radius: 16px;
        background-color: #394b70;
    }

    #workspaces button {
        padding: 0 8px;
        color:  #ff9e64 ;
        border: 1px solid  #ff007c ;
        border-radius: 16px;
        padding-left: 10px;
        padding-right: 10px;
        min-width: 33px;
    }

    #workspaces button.visible {
        color: #a9b1d6;
    }

    #workspaces button.focused {
        border-top: 3px solid #7aa2f7;
        border-bottom: 3px solid #7aa2f7;
    }

    #workspaces button.urgent {
        background-color: #a96d1f;
        color: white;
    }

    #workspaces button:hover {
        box-shadow: inherit;
        border-color: #bb9af7;
        color: #bb9af7;
    }

    /* Repeat style here to ensure properties are overwritten as there's no !important and button:hover above resets the colour */

    #workspaces button.focused {
        color: #7aa2f7;
    }
    #workspaces button.focused:hover {
        color: #bb9af7;
    }

    #pulseaudio {
        /* font-size: 26px; */
           border-radius: 16px;
        background-color: #394b70;

    }


    #tray {
           border-radius: 16px;
        background-color: #1a1b26;
    }
    #mode,
    #battery {
         border-radius: 16px;
        background-color: #394b70;
        padding-left: 10px;
        padding-right: 10px;
    }
    #temperature {
           border-radius: 16px;
        background-color: #394b70;
        padding-right: 10px;
        padding-left: 10px;
    }
    #cpu {
           border-radius: 16px;
        background-color: #394b70;
        padding-left: 10px;
        padding-right: 10px;
    }
    #memory {
           border-radius: 16px;
        background-color: #394b70;
        padding-left: 10px;
        padding-right: 10px;
    }
    #network {
           border-radius: 16px;
        background-color: #394b70;
        padding-left: 10px;
        padding-right: 10px;
    }
    #cpu {
           border-radius: 16px;
        background-color: #394b70;
        padding-left: 10px;
        padding-right: 10px;
    }
    #disk {
           border-radius: 16px;
        background-color: #394b70;
        padding-left: 10px;
        padding-right: 10px;
    }
     #clock {
        margin:     0px 16px 0px 10px;
        min-width:  140px;
           border-radius: 16px;
        background-color: #394b70;
    }

    #battery.warning {
        color: rgba(255, 210, 4, 1);
    }

    #battery.critical {
        color: rgba(238, 46, 36, 1);
    }

    #battery.charging {
        color: rgba(217, 216, 216, 1);
    }

    #custom-storage.warning {
        color: rgba(255, 210, 4, 1);
    }

    #custom-storage.critical {
        color: rgba(238, 46, 36, 1);
    }

    @keyframes blink {
        to {
            background-color: #ffffff;
            color: black;
        }
    }
  '';
}
