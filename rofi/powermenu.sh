#!/usr/bin/env bash

# Опции меню
lock="🔒 Заблокировать"
logout="🚪 Выйти из сессии"
hibernate="💤 Спящий режим"
reboot="🔄 Перезагрузка"
shutdown="⚡ Выключение"

# Собираем их вместе и отправляем в Rofi
chosen=$(printf "$lock\n$logout\n$hibernate\n$reboot\n$shutdown" | rofi -dmenu -i -p "Управление питанием:")

case "$chosen" in
    "$lock")
        hyprlock
        ;;
    "$logout")
        hyprctl dispatch exit
        ;;
    "$hibernate")
        systemctl hibernate
        ;;
    "$reboot")
        systemctl reboot
        ;;
    "$shutdown")
        systemctl poweroff
        ;;
esac
