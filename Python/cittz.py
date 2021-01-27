import platform, time, os
from subprocess import check_output 
from colorama import init, Fore, Back, Style

so = platform.system()

init()

powershell1 = """
netsh wlan export profile key=clear

echo "CITTZ - Hecho por wrrulos" > claves.txt
echo "" >> claves.txt
dir *.xml |% {
$cittz=[xml] (get-content $_)
$z= "______________________________________________________________________ `r`r`n Nombre de la red WiFi: "+$cittz.WLANProfile.SSIDConfig.SSID.name + "`r`n Contenido de la clave: " +$cittz.WLANProfile.MSM.Security.sharedKey.keymaterial + "`n______________________________________________________________________`n"
Out-File claves.txt -Append -InputObject $z

}

rm *.xml -Force"""

def config():

        if so == "Windows":
                check_output("cls", shell=True)
                check_output("title CITTZ", shell=True)
                check_output("mode con cols=103 lines=20", shell=True)
                menu()
        else:
                print("No compatible")


def banner():
        print(Fore.RED + " ╔═══════════════════════════════════════════════════════════════════════════════════════════════════╗")
        print(Fore.RED + " ║              " + Fore.MAGENTA + "____   ______________ __________ ____________                                        " + Fore.RED + "║")
        print(Fore.RED + " ║             " + Fore.MAGENTA + "6MMMMb/ `MM'MMMMMMMMMM MMMMMMMMMM MMMMMMMMMMMP " + Fore.CYAN + "        `:ohdNMMMNmdy+-                " + Fore.RED + "║")
        print(Fore.RED + " ║            " + Fore.MAGENTA + "8P    YM  MM /   MM   \ /   MM   \ /       dMP  " + Fore.CYAN + "     `+dMMMMmhyssyhmMMMNy:             " + Fore.RED + "║")
        print(Fore.RED + " ║           " + Fore.MAGENTA + "6M      Y  MM     MM         MM            dMP   " + Fore.CYAN + "    oNMMmo-   ```   `:sNMMm-           " + Fore.RED + "║")
        print(Fore.RED + " ║           " + Fore.MAGENTA + "MM         MM     MM         MM           dMP    " + Fore.CYAN + "   .NMd:  -odNMMMMNho. `+dd/           " + Fore.RED + "║")
        print(Fore.RED + " ║           " + Fore.MAGENTA + "MM         MM     MM         MM          dMP     " + Fore.CYAN + "        :dMMMNdyydNMMMh.               " + Fore.RED + "║")
        print(Fore.RED + " ║           " + Fore.MAGENTA + "MM         MM     MM         MM         dMP      " + Fore.CYAN + "        mMMh:      :hMM/               " + Fore.RED + "║")
        print(Fore.RED + " ║           " + Fore.MAGENTA + "MM         MM     MM         MM        dMP       " + Fore.CYAN + "         -.  -ydh+   `                 " + Fore.RED + "║")
        print(Fore.RED + " ║           " + Fore.MAGENTA + "YM      6  MM     MM         MM       dMP        " + Fore.CYAN + "             MMMMM+                    " + Fore.RED + "║")
        print(Fore.RED + " ║            " + Fore.MAGENTA + "8b    d9  MM     MM         MM      dMP       / " + Fore.CYAN + "             +mMNy`                    " + Fore.RED + "║")
        print(Fore.RED + " ║             " + Fore.MAGENTA + "YMMMM9  _MM_   _MM_       _MM_    dMMMMMMMMMMM " + Fore.CYAN + "              nMN                      " + Fore.RED + "║")
        print(Fore.RED + " ║                                                                                                   ║")
        print(Fore.RED + " ║                                                                                                   ║")
        print(Fore.RED + " ║                                                                                                   ║")



def menu():
        if so == "Windows":
                banner()
                print(Fore.RED + " ║      " + Fore.WHITE + "                        Guardando contraseñas en claves.txt...                               " + Fore.RED + "║")
                print(Fore.RED + " ║                                                                                                   ║")
                print(Fore.RED + " ║                                                                                                   ║")
                print(Fore.RED + " ╚═══════════════════════════════════════════════════════════════════════════════════════════════════╝")
                archivo = open("o2.ps1","w")
                archivo.write(str((powershell1)))
                archivo.close()
                check_output("powershell -ExecutionPolicy ByPass -File o2.PS1", shell=True)
                time.sleep(4)
                check_output("del o2.ps1", shell=True) 
                check_output("cls", shell=True)
                banner()
                print(Fore.RED + " ║      " + Fore.GREEN + "                        Contraseñas guardadas en claves.txt                                  " + Fore.RED + "║")
                print(Fore.RED + " ║                                                                                                   ║")
                print(Fore.RED + " ║                                                                                                   ║")
                print(Fore.RED + " ╚═══════════════════════════════════════════════════════════════════════════════════════════════════╝")
                check_output("pause", shell=True) 


config()
