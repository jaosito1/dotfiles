vol ()
{
    if [[ -z "$1" ]]; 
    then
       echo "Please input a number from 1-100." 
       return 1
    else
        local VOLUME=$1
        local LIST=$(pactl list sinks)
        local SINK=""

        if echo "$LIST" | grep -q RUNNING; 
        then
            SINK=$(echo "$LIST" | grep -B1 RUNNING | awk '/Sink #/{print $2;exit}' | tr -d "#")
        elif echo "$LIST" | grep -q SUSPENDED;
        then
            SINK=$(echo "$LIST" | grep -B1 SUSPENDED | awk '/Sink #/{print $2;exit}' | tr -d "#")
        else
            echo "no audio running or suspended :("
            return 1 
        fi
        pactl set-sink-volume $SINK $VOLUME%
        echo "Changed volume to $VOLUME% for sink $SINK."
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

