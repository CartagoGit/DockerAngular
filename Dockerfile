# Base Ubuntu LTS
FROM cartagodocker/nodebun:latest
USER root 

ARG ANGULAR_VERSION=19.0.6

#NODE_DEFAULT_VERSION inherent from cartagodocker/nodebun:latest, change NODE_DEFAULT_VERSION, if you want to use another version
RUN eval $(fnm env) && fnm use ${NODE_DEFAULT_VERSION} \ 
  && bun install -g \
  @angular/cli@${ANGULAR_VERSION} \
  && ng analytics off --global \
  # Hace bun como gestor de paquetes por defecto de angular para aumentar la velocidad de transpilación de angular' \
  && ng config --global cli.packageManager bun \
  # Pasamos la configuración inicial de angular a cada usuario, y a cada nuevo usuario para que todos tengan la misma configuración inicial
  # Usamos el script de la imagen de zsh
  && share_config_globally .angular-config.json --to /angular/.angular-config.json \
  # Añade texto necesario para el correcto funcionamiento en el .zshrc
  # Add text necessary for the correct operation in the .zshrc
  # The script that allows it is in the base zsh image (located in /usr/local/bin/add_text_to_zshrc)
  && add_text_to_zshrc "$(printf '%s\n' \
  '# AutoComplete for angular' \
  'source <(ng completion script)' \
  )" \
  # Limpiar cache y temporales
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/*