vol ()
{
    if [[ -z "$1" ]]; 
    then
       echo "Please input a number from 1-100 or m for mute" 
       return 1
    else 
        local VOLUME=$1
        local SINK=$(pactl list short sinks | awk '/RUNNING/{print $1;exit} ')
        local FALLBACK=$( pactl list short sinks | awk '/SUSPENDED/{print $1;exit} /IDLE/{print $1;exit}' )

        if [[ -z "$SINK" && -n "$FALLBACK" ]]; 
        then
            SINK="$FALLBACK"
        elif [[ -z "$SINK" && -z "$FALLBACK" ]];
        then
            echo "no audio running or suspended :("
            return 1
        fi

        if [[ "$VOLUME" = "m" ]]; 
        then 
            pactl set-sink-mute $SINK toggle 
            echo "(Un)Muted sink $SINK."
        else
            pactl set-sink-volume $SINK $VOLUME%
            echo "Changed volume to $VOLUME% for sink $SINK."
        fi
    fi
}
