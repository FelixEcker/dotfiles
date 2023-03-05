import os
from subprocess import check_output

def main():
    if check_output(["xkblayout-state", "print", "\"%s\""]) == b'"de"':
        os.system("setxkbmap us")
    else:
        os.system("setxkbmap de")


if __name__ == "__main__":
    main()
