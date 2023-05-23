Path_to_dir="/var/www/html"
username="sambauser"
password="1234"
groupname="smbshare"
private="/private"

initialize() {
    apt-get install dialog -y
    # apt-get install unzip -y

}
CreateCatalogs() {

    {
    PhotoIn="${Path_to_dir}/PhotoIn/"
    PhotoOut="${Path_to_dir}/PhotoOut/"
    PhotoArch="${Path_to_dir}/PhotoArch/"

    VideoOut="${Path_to_dir}/VideoOut"
    VideoIn="${Path_to_dir}/VideoIn"
    VideoArch="${Path_to_dir}/VideoArch"
    VideoTemp="${Path_to_dir}/temp"

    LrIn="${Path_to_dir}/LrIn/"
    LrDOC="${Path_to_dir}/LrDOC/"
    LrPDF="${Path_to_dir}/LrPDF/"
    LrArch="${Path_to_dir}/LrArch/"

    if [ ! -d "$PhotoIn" ]; then
        mkdir $PhotoIn
        echo "$(date):  Catalog PhotoIn was created" >>"${Path_to_dir}/LogIn.log"

    fi
    if [ ! -d "$PhotoOut" ]; then
        mkdir $PhotoOut
        echo "$(date):  Catalog PhotoOut was created" >>"${Path_to_dir}/LogOut.log"

    fi

    if [ ! -d "$PhotoArch" ]; then
        mkdir $PhotoArch
        echo "$(date):  Catalog PhotoArch was created" >>"${Path_to_dir}/LogArch.log"

    fi

    if [ ! -d "$LrIn" ]; then
        mkdir $LrIn
        echo "$(date):DOC:	 Catalog LrIn was created" >>"${Path_to_dir}/LogIn.log"

    fi
    if [ ! -d "$LrDOC" ]; then
        mkdir $LrDOC
        echo "$(date):DOC:  	 Catalog LrDOC was created" >>"${Path_to_dir}/LogOut.log"

    fi

    if [ ! -d "$LrPDF" ]; then
        mkdir $LrPDF
        echo "$(date):DOC:	 Catalog LrPDF was created" >>"${Path_to_dir}/LogOut.log"

    fi
    if [ ! -d "$LrArch" ]; then
        mkdir $LrArch
        echo "$(date):DOC:  	Catalog LrArch  was created" >>"${Path_to_dir}/LogArch.log"

    fi
    }| dialog --title "Установка apache" \
        --gauge "Идет установка Apache сервера" 10 70
    # dialog --title

}

install_apache2() {

    while apt-get install apache2 -y >/dev/null; do
        sleep 0.01
    done | dialog --title "Окно прогресса" --gauge \
"Данное окно позволяет показать прогресс работы скрипта." 10 70 0


}

install_samba() {
    apt-get install samba -y >/dev/null
}

configure_samba() {
    dialog --yesno "Желаете использовать значения по умолчанию" 10 70
    if [ "$?" = 0 ]; then

        groupname=$(dialog --stdout --title "Установка Samba" \
            --inputbox "Введите название группы пользователей:" 10 70)

        username=$(dialog --stdout --title "Установка Samba" \
            --inputbox "Введите имя пользователя:" 10 70)

        password=$(dialog --stdout --title "Установка Samba" \
            --passwordbox "Введите пароль для пользователя:" 10 70)

        private=$(dialog --stdout --title "Установка Samba" \
            --inputbox "Введите название каталога для обмена файлами:" 10 70)
    fi
}
