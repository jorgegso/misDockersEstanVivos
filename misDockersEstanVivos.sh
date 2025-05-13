#!/bin/bash

# Listar todos los contenedores en ejecución con sus puertos
containers=$(docker ps --format '{{.Names}} {{.Ports}}')

if [ -z "$containers" ]; then
    echo "No hay contenedores en ejecución."
else
    while read -r line; do
        # Obtener el nombre del contenedor
        container_name=$(echo $line | awk '{print $1}')
        
        # Obtener los puertos
        container_ports=$(echo $line | awk '{print $2}')
        
        # Si no hay puertos, asignar "Ninguno"
        if [ -z "$container_ports" ]; then
            container_ports="Ninguno"
            container_url="http://localhost"
        else
            # Extraer el primer puerto del host (antes del "->")
            host_port=$(echo $container_ports | sed -E 's/([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+:)?([0-9]+)->.*/\2/')
            
            # Si el puerto está mapeado a localhost, usar localhost como la URL
            if [[ $container_ports == *"0.0.0.0"* ]] || [[ $container_ports == *"localhost"* ]]; then
                container_url="http://localhost:$host_port"
            else
                # Obtener la IP interna
                container_ip=$(docker inspect --format '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $container_name)
                
                # Armar la URL completa con la IP interna
                container_url="http://$container_ip:$host_port"
            fi
        fi
        
        # Mostrar la información con la URL al final
        echo "🟢 Contenedor: $container_name, Puertos: $container_ports, URL: $container_url"
    done <<< "$containers"
fi

