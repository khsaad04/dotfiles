{ writeShellApplication }:
writeShellApplication {
  name = "powermenu";
  text = ''
    entries="󰗼 Exit\n Shutdown\n⏾ Suspend\n󰒲 Hibernate\n Reboot"

    selected=$(echo -e "$entries"|tofi| awk '{print tolower($2)}')

    case "$selected" in
        exit)
            swaymsg exit;;
        shutdown)
            systemctl poweroff;;
        suspend)
            systemctl suspend;;
        hibernate)
            systemctl hibernate;;
        reboot)
            systemctl reboot;;
    esac
  '';
}
