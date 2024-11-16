find manager -type f -exec dos2unix {} \\; # Cambiar formato de archivos a unix
awk -F: '$3 > 1000 {print}' /etc/passwd # Mostrar usuarios creados
