Command(){

    local command=$1

    response=$(dialog --title "¿Ejecutar?" \
        --stdout \
        --yesno "$command" 12 50)
        if [ $? -eq 0 ]; then
            clear
            message=$(eval "$command" 2>&1)
            # Comprobar si el comando fue exitoso
            if [ $? -eq 0 ]; then
                dialog --title "Éxito" --msgbox "Comando éxitoso: $command" 12 50
            else
                dialog --title "Error" --msgbox "$message" 12 50
            fi
        fi

}