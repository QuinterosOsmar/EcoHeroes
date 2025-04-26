# #!/bin/bash

# set -e

# echo "🚀 Iniciando script de inicialización..."

# # Definir paths (usamos rutas absolutas dentro del contenedor)
# ENV_EXAMPLE="/var/www/.env.example"
# ENV_DOCKER="/var/www/.env.docker"
# ENV_FILE="/var/www/.env"

# # Si no existe .env, lo generamos fusionando .env.example y .env.docker
# if [ ! -f "$ENV_FILE" ]; then
#     echo "🔧 Generando archivo .env a partir de .env.example y .env.docker..."

#     cp "$ENV_EXAMPLE" "$ENV_FILE"

#     while IFS='=' read -r raw_key raw_value; do
#         # Limpieza básica de claves y valores
#         key=$(echo "$raw_key" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
#         value=$(echo "$raw_value" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

#         # Ignorar líneas vacías o comentarios
#         if [[ -z "$key" || "$key" == \#* ]]; then
#             continue
#         fi

#         # Si la clave ya existe, reemplazarla; si no, agregarla
#         if grep -q "^$key=" "$ENV_FILE"; then
#             sed -i "s|^$key=.*|$key=$value|" "$ENV_FILE"
#         else
#             echo "$key=$value" >>"$ENV_FILE"
#         fi
#     done < <(grep -v '^\s*$' "$ENV_DOCKER")

#     echo "✅ Archivo .env generado correctamente."
# else
#     echo "ℹ️ Archivo .env ya existe, no se hará nadaA."
# fi

# echo "📦 Ejecutando composer install..."
# composer install --no-interaction --prefer-dist

# echo "🔑 Generando clave de aplicación..."
# php artisan key:generate 

# echo "🧱 Ejecutando migraciones..."
# # php artisan config:clear
# # php artisan cache:clear
# php artisan migrate:fresh --seed --force

# echo "🌐 Iniciando servidor Laravel..."
# php artisan serve --host=0.0.0.0 --port=8000
