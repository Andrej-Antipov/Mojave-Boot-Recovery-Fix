#!/bin/sh

clear

osascript -e "tell application \"Terminal\" to set the font size of window 1 to 12"
osascript -e "tell application \"Terminal\" to set background color of window 1 to {1028, 12850, 65535}"
osascript -e "tell application \"Terminal\" to set normal text color of window 1 to {65535, 65535, 65535}"

clear 

parm="$1"

loc=`locale | grep LANG | sed -e 's/.*LANG="\(.*\)_.*/\1/'`

if [ "$parm" = "-help" ] || [ "$parm" = "-h" ]  || [ "$parm" = "-H" ]  || [ "$parm" = "-HELP" ]; then

    printf '\e[8;18;78t'
    clear && printf '\e[3J'
        if [ ! $loc = "ru" ]; then
    printf '\e[8;18;78t'
    printf  '\n*****   Restoring Recovery after Fix for unsupported Mac   *****\n\n'
    printf ' This program is a script to undo the changes of content recovery\n'
    printf ' partition, made by Mojave Recovery Fix program\n\n'
    printf ' The command line can use the program with the following arguments: \n\n'
    printf ' -help,   -h  to print this help.\n'
    printf '\n March 2019\n\n\n'
            else
    printf '\e[8;18;82t'
    printf '\n*****  Откат изменений раздела программой исправления загрузки в Recovery  *****\n\n'
    printf ' Эта программа откатывает все измения раздела Recovery сделанные для исправления\n'
    printf ' возможности загрузки с раздела восстановления на маках без официальной поддержки\n'
    printf ' Мохаве. В командной строке программе можно передать следующие аргументы: \n\n'
    printf ' -help,   -h  для вывода на экран этой информации.\n'
    printf '\n Март 2019 года\n\n\n'
        fi
    exit
fi

string=`sw_vers -productVersion` 
string=`echo ${string//[^0-9]/}`
string=${string:0:4}
if [ "$string" != "1014" ]; then
        if [ ! $loc = "ru" ]; then
    printf '\nYour system is '
            else
    printf '\nВаша версия системы '
        fi
    printf "`sw_vers -productVersion`"
        if [ ! $loc = "ru" ]; then
    printf '\nThis program is for 10.14.x (Mojave) only\n'
    printf '\n!!!! UNABLE TO CONTUNUE. BYE !!!!\n\n\n\n\n'
            else
    printf '\nЭта программа только для 10.14.x (Mojave) \n'
    printf '\n!!!! ВЫПОЛНЕНИЕ НЕВОЗМОЖНО. ВЫХОД !!!!\n\n\n\n\n'
        fi
    exit
fi

if [ ! $loc = "ru" ]; then        
printf  '\n*****   Restoring Recovery after Fix for unsupported Mac   *****\n\n'

printf 'To continue enter your mac user account password\n'
printf 'To escape press CTRL+Z keys\n\n'
            else
printf '\n*****  Откат изменений раздела программой исправления загрузки в Recovery  *****\n\n'

printf 'Для продолжения введите пароль пользователя мак\n'
printf 'Для отмены выполнения нажмите CTRL+Z \n\n'
        fi
sudo printf ' '
clear

 if [ ! $loc = "ru" ]; then
echo "\nDetecting and mounting APFS Recovery"
            else
echo "\nНаходим и подключаем раздел Восстановления"
        fi
        if [ ! $loc = "ru" ]; then
                if diskutil mount Recovery; then
                    printf ' '
                        else
                    printf '\n!!!! ERROR. UNABLE TO CONTUNUE. BYE !!!!\n\n\n\n\n'
                exit
                fi
            else
                if diskutil quiet mount Recovery; then
                    printf '\nРаздел найден и подключен успешно\n'
                        else
                    printf '\n!!!! ОШИБКА. РАЗДЕЛ НЕ ПОДКЛЮЧЕН. ВЫХОД !!!!\n\n\n\n\n'
                exit
                fi
          fi
cd /Volumes/Recovery/*/


if [  -f "PlatformSupportBackup.plist" ]; then
            if [ ! $loc = "ru" ]; then
printf '\nRestoring PlatformSupport.plist\n\n'
                else
printf '\nВосстанавливаем оригинальный список поддержки\n'
            fi
sudo rm PlatformSupport.plist
sudo mv PlatformSupportBackup.plist PlatformSupport.plist
     else
            if [ ! $loc = "ru" ]; then
                printf '\nPlatformSupported.plist checked.\n'
                    else
                printf '\nБелый список поддержки проверен.\n'
            fi
fi

if  [  -f "AllUnsupported.txt" ]; then
sudo rm AllUnsupported.txt
fi

            if [ ! $loc = "ru" ]; then
printf '\nChecking the compat boot argument\n'
                else
printf '\nПроверяем аргумент отключения проверки совместимости\n'
            fi
compat_argument=`grep -Eo "no_compat_check" com.apple.Boot.plist`; compat_argument=`echo ${compat_argument:0:15}`
if [[ $compat_argument = "no_compat_check" ]]; then
            if [ ! $loc = "ru" ]; then
            printf 'Yes ! '$compat_argument' found. Removing ...\n'
                    else
            printf 'Да ! '$compat_argument' найден в настройках. Удаляем\n'
            fi
            sudo perl -i -pe 's/BaseSystem.dmg -no_compat_check/BaseSystem.dmg/' /Volumes/Recovery/*/com.apple.Boot.plist
    else    
            if [ ! $loc = "ru" ]; then
            printf 'com.apple.Boot.plist checked\n'
                else
            printf 'Настройки для аргумента загрузки проверены\n'
            fi
            printf '\n'
           
fi

if [  -f "immutablekernel.back" ]; then
            if [ ! $loc = "ru" ]; then
        printf 'Found original Recovery prelinked kernel. Restoring ....\n'
                else
        printf '\nНайдено сохранение оригинального prelinked kernel. Восстанавливаем....\n'
            fi
        sudo rm immutablekernel
        sudo mv immutablekernel.back immutablekernel
        if [ ! $loc = "ru" ]; then
        printf '\nDone\n'
                else
        printf '\nСделано\n'
        fi
            else
                if [ ! $loc = "ru" ]; then
        printf '\nPrelinked kernel checked. Not restored\n'
                    else
        printf '\nОригинал prelinked kernel не найден. Не восстановлен\n'
        fi
fi
        
if [ ! $loc = "ru" ]; then
echo "\n***      All Done       *** \n\n"

read -p "Press any key to close this window " -n 1 -r
                else
echo "\n***     ВСЕ СДЕЛАНО      *** \n\n"

read -p "Для выхода нажмите любую клавишу" -n 1 -r
            fi

clear

osascript -e 'tell application "Terminal" to close first window' & exit

exit