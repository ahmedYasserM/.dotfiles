function fish_prompt
    if [ $PWD = "/home/ahmed" ] 
        echo "🏡 🚀 "
    else
        echo -n (set_color -o "#A7C080") basename (pwd) "🚀 "
    end
end
