import os
import shutil
from pathlib import Path

# Author: Marie / Bertrahm

dotfiles = [".bashrc", ".vimrc"]
dotdirs = [".config"]
additional_scripts = """
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
""" 

def filecount():
    count = 0
    for _dir in dotdirs:
        for root_dir, cur_dir, files in os.walk(_dir):
            count += len(files)

    return count

def main():
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
