import os
import shutil
from pathlib import Path

pacman_pkgs = "alsa-utils exa feh mpv picom pulseaudio python ranger vim xfce4 Xorg"
yay_pkgs = "pasfetch"
dotfiles = [".bashrc"]
dotdirs = [".config"]

def install_yay():
    print (":: Installing yay...")
    os.system("git clone https://aur.archlinux.org/yay")
    os.chdir("yay")
    os.system("makepkg -s")
    for file in os.listdir():
        if file.endswith(".zst"):
            os.system("sudo pacman -U "+file)

    print (":: yay installed successfully, cleaning")
    os.chdir("..")
    os.system("rm -rf yay")

def filecount():
    count = 0
    for _dir in dotdirs:
        for root_dir, cur_dir, files in os.walk(_dir):
            count += len(files)

    return count

def main():
    print (":: Checking if yay is installed")
    if not os.path.isfile("/usr/bin/yay"):
        install_yay()

    print ("\n:: Installing pacman pkgs")
    #os.system("sudo pacman -S "+pacman_pkgs)

    print ("\n:: Installing yay pkgs")
    #os.system("yay -a -S "+yay_pkgs)

    print ("\n:: Copying dotfiles...")
    total = len(dotfiles)+filecount()
    copied = 1

    print (":: File Count: "+str(total))
    for file in dotfiles:
        print ("{0}/{1} ./{2} -> ~/{2}".format(copied, total, file))
        os.system("cp " + file + " ~/"+file)
        copied += 1

    HOMEDIR = os.environ['HOME']
    for _dir in dotdirs:
        for root_dir, cur_dir, files in os.walk(_dir):
            try:
                os.makedirs(HOMEDIR+'/'+root_dir)
            except FileExistsError:
                print(":: -> Directory Present: "+root_dir)

            for _file in files:
                file = root_dir+'/'+_file
                print ("{0}/{1} {2} -> ~/{2}".format(copied, total, file))
                os.system("cp " + file + " ~/"+file)
                copied += 1

    print (":: Copied all files!")
    print (":: Install successfull!")

if __name__ == "__main__":
    main()