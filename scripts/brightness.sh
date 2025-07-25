br () 
{ if [[ -z $1 ]];
    then 
        echo "Please select an option (set or get)."
        return 1 
    else
        case "$1" in
            "get"|"g")
                echo "Brightness set to $(brightnessctl g). (Max is $(brightnessctl m))."
                ;;
            "set"|"s")
                if [[ -z $2 ]]; 
                then
                    echo "Please enter a value."
                    return 1 
                else
                    brightnessctl s $2
                    echo "Setting to brightness to $2."
                fi
                ;;
            *) echo "Enter a valid option :("
                ;;
        esac
    fi
}
