source core/User.sh

UserGUI(){

    while true; do
        local op=$(dialog --title "Administración de usuarios" \
            --stdout \
            --menu "Opciones" 12 50 5 \
            1 "Crear" \
            2 "Modificar" \
            3 "Información" \
            0 "Regresar")
        clear
        case $op in
            1)
                User
                save
                ;;
            2)
                name=$(dialog --title "Aministración de usuario" --stdout --inputbox "Ingrese el nombre del usuario:" 0 0 "")
                User "$name"
                save
                ;;
            3)
                name=$(dialog --title "Aministración de usuario" --stdout --inputbox "Ingrese el nombre del usuario:" 0 0 "")
                User "$name"
                show
                ;;
            0)
                clear
                Manager
                break
                ;;
            *)
                clear
                break
                ;;
        esac
    done

}