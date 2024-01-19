import os
import shutil
from pathlib import Path

# Author: Marie / Bertrahm

pacman_pkgs = "ttf-hack-nerd mpv python neovim alacritty most hyprland waybar"
aur_pkgs = "pasfetch pasmotd sadv eza-git"
dotfiles = ["switchlayout.py", ".bashrc", ".vimrc", "start.sh"]
dotdirs = [".config", ".mbinit_templates"]
additional_scripts = """
""" 

def install_paru():
    print (":: Installing paru...")
    os.system("git clone https://aur.archlinux.org/paru")
    os.chdir("paru")
    os.system("makepkg -si")
    print (":: paru installed successfully, cleaning")
    os.chdir("..")
    os.system("rm -rf paru")

def filecount():
    count = 0
    for _dir in dotdirs:
        for root_dir, cur_dir, files in os.walk(_dir):
            count += len(files)

    return count

def main():
    print (":: Checking if paru is installed")
    if not os.path.isfile("/usr/bin/paru"):
        install_paru()

    print ("\n:: Installing pacman pkgs")
    os.system("sudo pacman -S "+pacman_pkgs)

    print ("\n:: Installing aur pkgs")
    os.system("paru -a -S "+aur_pkgs)

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
    print (":: Running additional shell scripts")
    os.system(additional_scripts)
    print (":: Install successfull!")

if __name__ == "__main__":
    main()
