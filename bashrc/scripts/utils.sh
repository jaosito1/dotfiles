vol ()
{
    if [[ -z "$1" ]]; 
    then
       echo "Please input a number from 1-100 or m for mute" 
       return 1
    else 
        local VOLUME=$1
        local SINK=$(pactl list short sinks | awk '/RUNNING/{print $1;exit} /SUSPENDED/{print $1;exit} /IDLE/{print $1;exit}')
        if [[ -z "$SINK" ]];
        then
            echo "no audio running or suspended :("
            return 1
        else
            if [[ "$VOLUME" = "m" ]]; 
            then 
                pactl set-sink-mute $SINK toggle 
                echo "(Un)Muted sink $SINK."
            else
                pactl set-sink-volume $SINK $VOLUME%
                echo "Changed volume to $VOLUME% for sink $SINK."
            fi
        fi
    fi
}

br () 
{
    if [[ -z $1 ]];
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

