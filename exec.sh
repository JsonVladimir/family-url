url_checker() {
    if [ ! "${1//:*}" = http ]; then
        if [ ! "${1//:*}" = https ]; then
            echo -e "\e[31m[ ⚠ ] URL inválida, por favor incluya http:// o https://.\e[0m"
            exit 1
        fi
    fi
}
echo -e
echo -e "\n\e[1;30;46m  ┌─────────────────────────────────────────────────┐  \e[0m"
echo -e "\e[1;30;46m  │      _|_|                                  _|   │  \e[0m"
echo -e "\e[1;30;46m  │    _|                  _|    _|  _|  _|_|  _|   │  \e[0m"
echo -e "\e[1;30;46m  │  _|_|_|_|  _|_|_|_|    _|    _|  _|_|      _|   │  \e[0m"
echo -e "\e[1;30;46m  │    _|                  _|    _|  _|        _|   │  \e[0m"
echo -e "\e[1;30;46m  │    _|                    _|_|_|  _|        _|   │  \e[0m"
echo -e "\e[1;30;46m  └─────────────────────────────────────────────────┘  \e[0m \n"
echo -e "\e[40;38;5;82m v.0.01 © JsonVladimir \e[30;48;5;82mhttps://www.vladimiraburto.com\e[0m"
echo -e " ===================================================== "
echo -n " Pega la URL que quieres enmascarar: (incluye el http:// o https://): "
read urlin 
url_checker $urlin
sleep 1
echo "Modificando la URL a enmascarar..."
echo ""
corto=$(curl -s https://is.gd/create.php\?format\=simple\&url\=${urlin})
acortador=${corto#https://}
echo -e "Enmascaramiento"
echo 'Ingresa la URL que quieres que se muestre para enmascarar la URL principal.'
echo '(incluye el http:// o https:// , ejemplo: https://google.com, http://dominio.org) :'
read mascara
url_checker $mascara
echo -e '\nEscribe palabras atractivas para hacer tentador el acceso al link:(ejemplo: lindos-gatitos, dinero-facil-y-rapido)'
echo -e "\e[31mNo uses ESPACIOS, solo usa '-' para seprar cada palabra.\e[0m"
echo -en "\e[32m>>\e[0m "
read tags
if [[ -z "$tags" ]]; then
echo -e "\e[31m[ ⚠ ] No has ingresado argumentos.\e[0m"
echo -e "\nGenerando family-url...\n"
final=$mascara@$acortador
echo -e "Aquí tienes el family-url:\e[32m ${final} \e[0m\n"
exit
fi
if [[ "$tags" =~ " " ]]; then
echo -e "\e[31m[ ⚠ ] Argumentos inválidos. Porfavor evita usar espacios.\e[0m"
echo -e "\nGenerando family-url...\n"
final=$marcara@$acortador
echo -e "Aquí tienes el family-url:\e[32m ${final} \e[0m\n"
exit
fi
echo -e "\nGenerando family-url...\n"
final=$mascara-$tags@$acortador
echo -e "Aquí tienes el family-url:\e[32m ${final} \e[0m\n"