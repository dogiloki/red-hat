source app/Command.sh

User(){

    local info
    local name=$1 # Nombre del usuario
    local directory # -d /home/usuario
    local shell # -s /bin/bash
    local _UID # -u UID
    local _GID # -g GID
    local groups# -G grupo1,grupo2
    local comment # -c "Comentario"
    local UMASK=${UMASK:-022} # -K UMASK=valor
    local date_expired=${date_expired:-1} # -e YYYY-MM-DD
    local period_inactivity=${period_inactivity:-30} # -f días
    local other=$2
    local command="" # Comando generado

    # Asignar valores predeterminados
    [[ -z $directory ]] && directory="/home/$name"
    [[ -z $shell ]] && shell="/bin/bash"

    save(){
        info=$(awk -F: -v name="$name" '$1 == name && $3 > 1000 {print}' /etc/passwd)
        IFS=":" read -r name password _UID _GID fullname directory shell <<< "$info"
        while true; do
            # Mostrar el menú con opciones
            local op=$(dialog --title "Usuario: $name" \
                --stdout \
                --menu "Opciones" 12 50 5 \
                1 "Crear comando" \
                2 "Nombre ($name)" \
                3 "Directorio ($directory)" \
                4 "Shell ($shell)" \
                5 "ID ($_UID)" \
                6 "Grupo ID ($GID)" \
                7 "Grupos ($groups)" \
                8 "Comentarios($comment)" \
                9 "UMASK ($UMASK)" \
                10 "Periodo de expiración YYYY-DD-MM ($date_expired)" \
                11 "Expiración despues de inactividad días ($period_inactivity)" \
                12 "Otros ($other)" \
                0 "Salir")

            # Evaluar la opción seleccionada
            case $op in
                1)
                    if [ -n $info ]; then
                        command="usermod $name"
                    else
                        command="useradd $name"
                    fi
                    [[ -n $directory ]] && command+=" -d $directory"
                    [[ -n $shell ]] && command+=" -s $shell"
                    [[ -n $_UID ]] && command+=" -u $_UID"
                    [[ -n $_GID ]] && command+=" -g $_GID"
                    [[ -n $groups ]] && command+=" -G $groups"
                    [[ -n $comment ]] && command+=" -c $comment"
                    [[ -n $UMASK ]] && command+=" -K UMASK=$UMASK"
                    [[ -n $date_expired ]] && command+=" -e $date_expired"
                    [[ -n $period_inactivity ]] && command+=" -f $period_inactivity"
                    [[ -n $other ]] && command+=" $other"
                    clear
                    Command "$command"
                    ;;
                2)
                    # Modificar el nombre del usuario
                    name=$(dialog --title "Administración de usuario" --stdout --inputbox "Ingrese el nombre del usuario:" 0 0 "$name")
                    directory="/home/$name"
                    ;;
                3)
                    # Modificar el directorio del usuario
                    directory=$(dialog --title "Administración de usuario" --stdout --inputbox "Ingrese el directorio:" 0 0 "$directory")
                    ;;
                4)
                    # Modificar el shell del usuario
                    shell=$(dialog --title "Administración de usuario" --stdout --inputbox "Ingrese el shell:" 0 0 "$shell")
                    ;;
                5)
                    # Modificar el UID del usuario
                    _UID=$(dialog --title "Administración de usuario" --stdout --inputbox "Ingrese el UID:" 0 0 "$_UID")
                    ;;
                6)
                    # Modificar el GID del usuario
                    _GID=$(dialog --title "Administración de usuario" --stdout --inputbox "Ingrese el GID:" 0 0 "$_GID")
                    ;;
                7)
                    # Modificar el GID del usuario
                    groups=$(dialog --title "Administración de usuario" --stdout --inputbox "Grupos secundarios (grupo1,grupo2):" 0 0 "$groups")
                    ;;
                8)
                    # Modificar el GID del usuario
                    GID=$(dialog --title "Administración de usuario" --stdout --inputbox "Ingrese el GID:" 0 0 "$GID")
                    ;;
                9)
                    # Modificar el GID del usuario
                    GID=$(dialog --title "Administración de usuario" --stdout --inputbox "Ingrese el GID:" 0 0 "$GID")
                    ;;
                10)
                    # Modificar el GID del usuario
                    GID=$(dialog --title "Administración de usuario" --stdout --inputbox "Ingrese el GID:" 0 0 "$GID")
                    ;;
                11)
                    # Modificar el GID del usuario
                    GID=$(dialog --title "Administración de usuario" --stdout --inputbox "Ingrese el GID:" 0 0 "$GID")
                    ;;
                12)
                    # Modificar el GID del usuario
                    other=$(dialog --title "Administración de usuario" --stdout --inputbox "Otros parámetros:" 0 0 "$other")
                    ;;
                *)
                    # Salir del menú
                    clear
                    break;
                    ;;
            esac
        done
    }

    show(){
        info=$(awk -F: -v name="$name" '$1 == name && $3 > 1000 {print}' /etc/passwd)
        dialog --title "Usuario: $name" --msgbox "$info" 12 50
    }

}