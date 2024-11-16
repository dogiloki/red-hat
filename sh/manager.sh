#!/bin/bash

source adapters/UserGUI.sh

Manager(){

    while true; do
        op=$(dialog --title "Aministrador" \
            --stdout \
            --menu "¿Qué desea administrar?" 12 20 5 \
            1 "Usuarios" \
            0 "Salir")
        clear
        case $op in
            1)
                clear
                UserGUI
                ;;
            0)
                # Salir del menú
                clear
                break;
                ;;
            *)
                # Salir del menú
                clear
                break;
                ;;
        esac
    done

}

Manager
