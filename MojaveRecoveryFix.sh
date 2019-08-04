#!/bin/sh
clear

osascript -e "tell application \"Terminal\" to set the font size of window 1 to 12"
osascript -e "tell application \"Terminal\" to set background color of window 1 to {1028, 12850, 65535}"
osascript -e "tell application \"Terminal\" to set normal text color of window 1 to {65535, 65535, 65535}"

clear 

parm="$1"

loc=`locale | grep LANG | sed -e 's/.*LANG="\(.*\)_.*/\1/'`

if [ "$1" = "-help" ] || [ "$1" = "-h" ]; then

    
    clear && printf '\e[3J'
	
    if [ ! $loc = "ru" ]; then
    printf '\e[8;18;78t'
    printf  '\n* Recovery boot fix for some Mac with unofficially installed Mojave *\n\n'
    printf ' This program is a script for fixing the ability to boot into recovery\n'
    printf ' on Mac computers not officially supported by the Mojave to which\n'
    printf ' Mojave was installed using the dosedude patcher.\n\n'
    printf ' The command line can use the program with the following arguments: \n\n'
    printf ' -help,   -h  to print this help.\n'
    printf ' -all,    -a  to insert in white-list  all known models of unsupported Mac\n'
    printf ' -list,   -l  print list all known models of unsupported Mac\n'
    printf ' on which Mojave operating system it is possible to install\n'
    printf ' only one argument is supported at one run time\n'
    printf '\n March 2019\n\n\n'
            else
    printf '\e[8;20;78t'
    printf  '\n* Чиним  загрузку в Recovery на мак без официальной поддержки Mojave  *\n\n'
    printf ' Эта программа ремонтирует возможность загрузки с раздела восстановления\n'
    printf ' на компьютерах макинтош без официальной поддержки Мохаве, на которые \n'
    printf ' Мохаве был установлен благодаря патчеру dosedude.\n\n'
    printf ' При запуске из командной строки возможно передать следующие аргументы: \n\n'
    printf ' -help,   -h  вывродит на экран эту справку.\n'
    printf ' -all,    -a  флаг занести в белый список загрузки все известные модели маков \n'
    printf ' -list,   -l  выводит на экран список всех известных моделей маков\n'
    printf ' на которые можно не официально установить Mojave например патчером dosedude\n'
    printf ' программа берёт только один аргумент за раз (первый если их указать больше одного) \n'
    printf '\n Март 2019 год\n\n\n'
            fi
    exit
fi


if [ "$1" = "-all" ] || [ "$1" = "-a" ] || [ "$1" = "-list" ] || [ "$1" = "-l" ]; then 
unsupported_product_list_1="MacPro3,1;MacPro4,1;iMac8,1;iMac9,1;iMac10,1;iMac11,1;iMac11,2;iMac11,3;iMac12,1;iMac12.2"
unsupported_product_list_2="MacBookPro4,1;MacBookPro5,1;MacBookPro5,2;MacBookPro5,3;MacBookPro5,4;MacBookPro5,5;MacBookPro6,1;MacBookPro6,2;MacBookPro7,1;MacBookPro8,1;MacBookPro8,2;MacBookPro8,3"
unsupported_product_list_3="MacBookAir2,1;MacBookAir3,1;MacBookAir3,2;MacBookAir4,1;MacBookAir4,2;MacBook5,1;MacBook5,2;MacBook6,1;MacBook7,1;Macmini3,1;Macmini4,1;Macmini5,1;Macmini5,2;Macmini5,3;Xserve2,1;Xserv3,1"

unsupported_board_list_1="Mac-F42C88C8;Mac-F221BEC8;Mac-F227BEC8;Mac-F2218FC8;Mac-F2268CC8;Mac-F2268DC8;Mac-F221DCC8;Mac-F2268DAE;Mac-F2238AC8;Mac-F2238BAE;Mac-942B5BF58194151B;Mac-942B59F58194171B;"
unsupported_board_list_2="Mac-F42C86C8;Mac-F42D86A9;Mac-F42D86C8;Mac-F2268EC8;Mac-F22587C8;Mac-F22587A1;Mac-F2268AC8;Mac-F22589C8;Mac-F22586C8;Mac-F222BEC8;Mac-94245B3640C91C81;Mac-94245A3940C91C80;Mac-942459F5819B171B"
unsupported_board_list_3="Mac-F42D88C8;Mac-942452F5819B1C1B;Mac-942C5DF58193131B;Mac-C08A6BB70A942AC2;Mac-742912EFDBEE19B3;Mac-F42D89A9;Mac-F42D89C8;Mac-F22788AA;Mac-F22C8AC8;Mac-F22C89C8;Mac-F22C86C8;Mac-F2208EC8;Mac-8ED6AF5B48C039E1;Mac-4BC72D62AD45599E;Mac-7BA5B2794B2CDB12;Mac-F42289C8"


IFS=';' 
PList_1=($unsupported_product_list_1)
PList_2=($unsupported_product_list_2)
PList_3=($unsupported_product_list_3)
BList_1=($unsupported_board_list_1)  
BList_2=($unsupported_board_list_2) 
BList_3=($unsupported_board_list_3) 
unset IFS;

fi

if [ "$1" = "-list" ] || [ "$1" = "-l" ]; then
            printf '\e[8;18;100t'
            clear && printf '\e[3J'
                if [ ! $loc = "ru" ]; then
            printf 'List of all officially unsupported Mac model can run Mojave\n\n'
                    else
            printf 'Список маков на которых можно не официально запустить Мохаве\n\n'
                fi
            cnt=0

            for i in ${!PList_1[@]}; do
            len=${#PList_1[$i]}; printf '   '${PList_1[$i]}
            let "corr=17-len"; printf "%"$corr"s"
            let "cnt++"; if [ $cnt = 5 ]; then cnt=0; printf '\n'; fi
            done
            for i in ${!PList_2[@]}; do
            len=${#PList_2[$i]}; printf '   '${PList_2[$i]}
            let "corr=17-len"; printf "%"$corr"s"
            let "cnt++"; if [ $cnt = 5 ]; then cnt=0; printf '\n'; fi
            done
            for i in ${!PList_3[@]}; do
            len=${#PList_3[$i]}; printf '   '${PList_3[$i]}
            let "corr=17-len"; printf "%"$corr"s"
            let "cnt++"; if [ $cnt = 5 ]; then cnt=0; printf '\n'; fi
            done
            printf '\n\n'
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
        
printf  '\n* Recovery boot fix for some Mac with unofficially installed Mojave *\n\n'

printf 'To continue enter your mac user account password\n'
printf 'To escape press CTRL+Z keys\n\n'
            else
printf  '\n* Чиним  загрузку в Recovery на мак без официальной поддержки Mojave  *\n\n'

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

recovery_partition=$(diskutil list | grep -m 1 Recovery | rev | cut -f1 -d " " | rev | tr -d '\t\n')
recovery_name=$(diskutil info $recovery_partition | grep "Volume Name:" | cut -f2 -d ":" | xargs | tr -d '\n')

        if [ ! $loc = "ru" ]; then
                if diskutil mount "$recovery_name"; then
                    printf ' '
                        else
                    printf '\n!!!! ERROR. UNABLE TO CONTUNUE. BYE !!!!\n\n\n\n\n'
                exit
                fi
            else
                if diskutil quiet mount "$recovery_name"; then
                    printf '\nРаздел найден и подключен успешно\n'
                        else
                    printf '\n!!!! ОШИБКА. РАЗДЕЛ НЕ ПОДКЛЮЧЕН. ВЫХОД !!!!\n\n\n\n\n'
                exit
                fi
          fi

cd /Volumes/"$recovery_name"/*/

            if [ ! $loc = "ru" ]; then
sudo printf '\nUpdating compability boot argument in NVRAM\n'
                else
sudo printf '\nОбновляем в NVRAM аргумент загрузки  \n'
sudo printf 'для отключения проверки совместимости ОС\n'
            fi
sudo nvram boot-args="-no_compat_check"
            if [ ! $loc = "ru" ]; then
                echo "Done"
                    else
                echo "Сделано"
            fi

if [ ! -f "PlatformSupportBackup.plist" ]; then
sudo cp PlatformSupport.plist PlatformSupportBackup.plist
            else
    if [[ ! "ModValuesInserted" = `grep -Eo ModValuesInserted  PlatformSupport.plist` ]]; then
            if [ ! $loc = "ru" ]; then
printf '\nRestoring environment after Recovery update\n'
                else
printf '\nВосстановление среды после обновления Recovery\n'
            fi
sudo rm PlatformSupportBackup.plist
sudo cp PlatformSupport.plist PlatformSupportBackup.plist
        if [  -f "immutablekernel.back" ]; then
            sudo rm immutablekernel.back
        fi
    fi
fi

if [ "$parm" = "-all" ] || [ "$parm" = "-a" ]; then 
    
    if [[ ! "ModAllUnsupported" = `grep -Eo ModAllUnsupported  PlatformSupport.plist` ]]; then

                    if [ ! $loc = "ru" ]; then
            printf '\nAccording to the -all optional command argument\n'
            printf 'All known old Mac with unofficial Mojave support\n'
            printf 'will be white-listed for Recovery boot\n'
            printf 'Performing..'
                    else
            printf '\nСогласно аргументу командной строки -all все \n'
            printf 'известные модели макинтош на которые может быть  \n'
            printf 'установлена ос Мохаве без ведома производителя\n'
            printf 'будут занесены в список разрешённых для Recovery\n'
            printf 'Выполняется..'
                fi
             
            while :;do printf '.';sleep 0.4;done &
            trap "kill $!" EXIT 

            for i in ${!PList_1[@]}; do
            sudo plutil  -replace SupportedModelProperties.$i -string ${PList_1[$i]} PlatformSupport.plist ; done

            for i in ${!PList_2[@]}; do
            sudo plutil  -replace SupportedModelProperties.$i -string ${PList_2[$i]} PlatformSupport.plist ; done

            for i in ${!PList_3[@]}; do
            sudo plutil  -replace SupportedModelProperties.$i -string ${PList_3[$i]} PlatformSupport.plist ; done

            for i in ${!BList_1[@]}; do
            sudo plutil  -replace SupportedBoardIds.$i -string ${BList_1[$i]} PlatformSupport.plist ; done

            for i in ${!BList_2[@]}; do
            sudo plutil  -replace SupportedBoardIds.$i -string ${BList_2[$i]} PlatformSupport.plist ; done

            for i in ${!BList_3[@]}; do
            sudo plutil  -replace SupportedBoardIds.$i -string ${BList_3[$i]} PlatformSupport.plist ; done

            kill $!
            wait $! 2>/dev/null
            trap " " EXIT
            
#            sudo touch "AllUnsupported.txt"
            sudo plutil  -replace ModAllUnsupported -bool YES PlatformSupport.plist
            sudo plutil  -replace ModValuesInserted -bool YES PlatformSupport.plist

            printf '\n'
    else
                if [ ! $loc = "ru" ]; then
            printf '\nCommand line argument -all detected \n'
            printf 'All known old Mac with unofficial Mojave support\n'
            printf 'already been whitelisted earlier \n'
            printf 'The argument ignored \n'
                    else
            printf '\nОбнаружен аргумент -all но команда уже была исполнена ранее \n'
            printf 'В белый список моделей для загрузки на них Recovery уже были \n'
            printf 'записаны все известные модели с неофициальной поддержкой Mojave \n'
            printf 'Аргумент игнорируется\n'
                fi
        fi
fi

board=`ioreg -lp IOService | grep board-id | awk -F"<" '{print $2}' | cut -c 2- | rev | cut -c 3- | rev`
product=`ioreg -lp IOService | grep product-name | awk -F"<" '{print $2}' | cut -c 2- | rev | cut -c 3- | rev`
            if [ ! $loc = "ru" ]; then
printf '\nYour Mac board-id is '$board' and model '$product'\n'
printf '\nChecking the Recovery mac whitelist\n'
                else
printf '\nВаш идентификатор '$board' и модель '$product'\n'
printf '\nПроверяем в списках разрешённых моделей\n'
            fi
supported_product=`grep -Eo $product PlatformSupport.plist`
lenp=${#product}; supported_product=`echo ${supported_product:0:$lenp}`
supported_board=`grep -Eo $board PlatformSupport.plist`
lenb=${#board}; supported_board=`echo ${supported_board:0:$lenb}`

if [[ ! $board = $supported_board ]]; then
            if [ ! $loc = "ru" ]; then
            printf 'Adding your board-id to whitlist\n'
                else
            printf 'Добавляем ваш идентификатор в списки\n'
            fi
            sudo plutil  -replace SupportedBoardIds.0 -string $board PlatformSupport.plist
            sudo plutil  -replace ModValuesInserted -bool YES PlatformSupport.plist
        else
            printf 'OK ! '$board' \n' 
fi

if [[ ! $product = $supported_product ]]; then
            if [ ! $loc = "ru" ]; then
            printf 'Adding your product id to whitlist\n'
                    else
            printf 'Добавляем вашу модель мака в списки\n'
            fi
            sudo plutil  -replace SupportedModelProperties.0 -string $product PlatformSupport.plist
            sudo plutil  -replace ModValuesInserted -bool YES PlatformSupport.plist
        else
            printf 'OK ! '$product' \n'
fi
            if [ ! $loc = "ru" ]; then
printf '\nChecking the compat boot argument\n'
                else
printf '\nПроверяем аргумент совместимости модели с Recovery\n'
            fi
compat_argument=`grep -Eo "no_compat_check" com.apple.Boot.plist`; compat_argument=`echo ${compat_argument:0:15}`
if [[ $compat_argument = "no_compat_check" ]]; then
            printf 'OK ! \n'
        else
                if [ ! $loc = "ru" ]; then
            printf 'Adding -no_compat_check in com.apple.Boot.plist\n'
                    else
            printf 'Вписываем аргумент совместимости в настройки загрузки\n'
                fi
            sudo sed -i '' 's/BaseSystem.dmg/BaseSystem.dmg -no_compat_check/' ./com.apple.Boot.plist
            
fi
            if [ ! $loc = "ru" ]; then
printf '\nChecking whether to do prelinked kernel patch\n'
            else
printf '\nПроверяем необходимость патчить prelinked kernel\n'
            fi
system=`md5 -q /System/Library/PrelinkedKernels/prelinkedkernel`
recovery=`md5 -q  immutablekernel`

if [[ $system = $recovery ]]; then 
            if [ ! $loc = "ru" ]; then
        printf 'OK ! kernel patch already done\n'
                else
        printf 'OK ! патч уже был сделан\n'
            fi
    else
            if [ ! $loc = "ru" ]; then
        printf 'Need Patch !  Patching....\n'
                else
        printf 'Патч нужен. Выполняем...\n'
            fi
        if [ ! -f "immutablekernel.back" ]; then
                if [ ! $loc = "ru" ]; then
            printf '\nMaking backup prelinked kernel\n'
                    else
            printf '\nСохраняем оригинал prelinked kernel\n'
                fi
            sudo cp immutablekernel immutablekernel.back
        fi
        sudo cp -a /System/Library/PrelinkedKernels/prelinkedkernel immutablekernel
            if [ ! $loc = "ru" ]; then
                printf 'Done !\n'
                    else
                printf 'Сделано !\n'
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