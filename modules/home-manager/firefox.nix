{ config
, username
, lib
, ...
}:
let
  cfg = config.local.browsers.firefox;
in
{
  options.local.browsers.firefox = {
    enable = lib.mkEnableOption "Mozilla Firefox browser";
  };
  config = lib.mkIf cfg.enable {
    programs.firefox = {
      enable = true;
      profiles.${username} = {
        name = username;
        extensions = with config.nur.repos.rycee.firefox-addons; [ ublock-origin vimium ];
        extraConfig = ''
              user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
          user_pref("ui.key.menuAccessKeyFocuses", false);
        '';
        userChrome = ''
          /* Source file https://github.com/MrOtherGuy/firefox-csshacks/tree/master/chrome/navbar_tabs_responsive_oneliner.css made available under Mozilla Public License v. 2.0
           See the above repository for updates as well as full license text. */

          /* Make tabs and navbar appear side-by-side tabs on right */

          /* Use page_action_buttons_on_hover.css to hide page-action-buttons to save more space for the address */

          /* Toolbars will be shown normally if window width goes below the value below */



          /* Modify it to suit your needs */
          @media screen and (min-width: 1100px){
            :root[tabsintitlebar][sizemode="normal"]{
                --uc-window-drag-space-width: 24px;
            }
            :root[uidensity="compact"]{
                --tab-block-margin: 2px !important;
            }

            /* Modify these to change relative widths or default height */
          #navigator-toolbox{
              --uc-navigationbar-width: 45vw;
              --uc-toolbar-height: 40px;
              --uc-urlbar-min-width: 50vw; /* minimum width for opened urlbar */
          }

          #scrollbutton-up,
          #scrollbutton-down{ border-block-width: 2px !important; }

          /* prevent urlbar overflow on narrow windows */
          /* Dependent on how many items are in navigation toolbar ADJUST AS NEEDED */
          @media screen and (max-width: 1500px){
          #urlbar-container{
              min-width: 300px !important;
              flex-shrink: 1 !important;
          }
          }

          /* Override for other densities */
          :root[uidensity="compact"] #navigator-toolbox{ --uc-toolbar-height: 34px; }
          :root[uidensity="touch"] #navigator-toolbox{ --uc-toolbar-height: 44px; }

          #TabsToolbar{
              margin-left: var(--uc-navigationbar-width);
              --tabs-navbar-shadow-size: 0px;
          }
          #tabbrowser-tabs{
              --tab-min-height: calc(var(--uc-toolbar-height) - 2 * var(--tab-block-margin,0px)) !important;
          }

          /* This isn't useful when tabs start in the middle of the window */
          .titlebar-spacer[type="pre-tabs"]{ display: none }

          #navigator-toolbox > #nav-bar{
              margin-right:calc(100vw - var(--uc-navigationbar-width));
              margin-top: calc(0px - var(--uc-toolbar-height));
          }

          /* Window drag space  */
          :root[tabsintitlebar="true"] #nav-bar{ padding-left: var(--uc-window-drag-space-width) !important }

          /* Rules for window controls on left layout */

          @media (-moz-gtk-csd-reversed-placement),
              (-moz-platform: macos){
                  .titlebar-buttonbox-container{
          position: fixed;
          display: flex;
          left: 0px;
                z-index: 3;
          height: var(--uc-toolbar-height);
                  align-items: center
                  }
                  :root[tabsintitlebar="true"] #nav-bar{ padding-inline: calc(var(--uc-window-drag-space-width,0px) + 84px) 0px !important; }
              }
          @media (-moz-platform: macos){
              :root[tabsintitlebar="true"] #nav-bar{ padding-inline: calc(var(--uc-window-drag-space-width,0px) + 72px) 0px !important; }
          }

          /* 1px margin on touch density causes tabs to be too high */
          .tab-close-button{ margin-top: 0 !important }

          /* Make opened urlbar overlay the toolbar */
          #urlbar[open]:focus-within{ min-width: var(--uc-urlbar-min-width,none) !important; }

          /* Hide dropdown placeholder */
          #urlbar-container:not(:hover) .urlbar-history-dropmarker{ margin-inline-start: -28px; }

          }
          /* Fix customization view */
          #customization-panelWrapper > .panel-arrowbox > .panel-arrow{ margin-inline-end: initial !important; }

        '';
        userContent = ''
          @-moz-document url-prefix("about:newtab"),
              url-prefix("about:home") {
                  /*Hides the cog button to customize the new tab*/
                  [data-l10n-id="newtab-personalize-icon-label"] {
          display: none !important;
                  }
        '';
      };
    };
  };
}