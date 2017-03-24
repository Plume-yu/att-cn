# Lasx's AdvancedTomato-ARM #

Forked off from AndreDVJ's AdvancedTomato-ARM (which is a fork of Jacky's AdvancedTomato (a fork of Tomato-ARM by Shibby)).

This is my personal fork, Only change Language to Chinese and add support for XiaoMi R1D.

I only have a Xiaomi MiWiFi R1D router, so I don't have any other unit to test any other build. Build/flash at your own risk.

If you see any issues or want to request a specific build, please let me know.

If anyone wants to pick up my changes and merge them to your repository, feel free and go ahead. That's the reason Tomato is an open-source project.

* Required packages to build AdvancedTomato

Please understand AdvancedTomato uses exactly the same packages as Tomato by Shibby that's because its a fork (project base). As I stated many times before AdvancedTomato is only GUI modification and will most likely always stay only that. Shibby uses Debian 8 to compile firmware however I use Ubuntu 16.04 so both will work. Bellow you will find list of required packages and those who may mess the compilation process.

Base packages with all depends
```
sudo apt-get install build-essential autoconf m4 bison flex g++ libtool sqlite gcc g++ binutils patch bzip2 make gettext unzip zlib1g-dev libc6 gperf sudo automake groff lib32stdc++6 libncurses5 libncurses5-dev gawk gitk zlib1g-dev autopoint shtool autogen mtd-utils gcc-multilib gconf-editor lib32z1-dev pkg-config libssl-dev automake1.11 libxml2-dev intltool libglib2.0-dev libstdc++5 texinfo dos2unix xsltproc libnfnetlink0 libcurl4-openssl-dev libxml2-dev libgtk2.0-dev libnotify-dev libevent-dev mc git texlive nettle-dev
```

Packages to remove if installed (breaks PHP compilation)

```
sudo apt-get remove libicu-dev
```
Install i386 elf1 packages (x86 bit)

```
sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get install libelf1 libelf-dev:i386 libelf1:i386
```
Install required automake packages (version 1.13.2 and 1.14.1)
```
wget https://advancedtomato.com/data/tools/automake_1.13.2-1ubuntu1_all.deb
wget https://advancedtomato.com/data/tools/automake_1.14.1-2ubuntu1_all.deb
sudo dpkg -i automake_1.13.2-1ubuntu1_all.deb
sudo dpkg -i automake_1.14.1-2ubuntu1_all.deb
```
If bison version is above 3.0 downgrade to 2.7.1
```
sudo apt-get remove bison libbison-dev
wget https://advancedtomato.com/data/tools/libbison-dev_2.7.1.dfsg-1_amd64.deb
wget https://advancedtomato.com/data/tools/bison_2.7.1.dfsg-1_amd64.deb
sudo dpkg -i libbison-dev_2.7.1.dfsg-1_amd64.deb
sudo dpkg -i bison_2.7.1.dfsg-1_amd64.deb
```
If you get some './configure' error ,please enter that folder and type
```
autoreconf -ivf
```
That's all , have a good luck!
