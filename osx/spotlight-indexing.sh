echo "Turn Spotlight indexing on/off? (1/2)"
select yn in "On" "Off"; do
    case $yn in
        On ) sudo mdutil -a -i on; break;;
        Off ) sudo mdutil -a -i off; break;;
    esac
done
