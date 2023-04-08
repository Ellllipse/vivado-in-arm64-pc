First attempt: 

I used `VMware 13 pro` to install Ubuntu on my MacBook, trying to install vivado under this environment. A useful document is [here](https://communities.vmware.com/t5/VMware-Fusion-Documents/The-Unofficial-Fusion-13-for-Apple-Silicon-Companion-Guide/ta-p/2939907). However, my MacBook is using ARM64, which vivado does not support even inside the VM machine. It is possible to emulate the x86 environment, but it is incredibly slow.



Second attempt:

I tried to deploy AWS EC2 Linux server. I got it connected to my Mac with x86 environment, but it has no GUI. So I enabled X11Forwarding, the vivado installation crashed after I run it. Later I learn that this might due to not all vivado dependencies are installed in the environment, but I can’t find a reliable solution online at that moment. 



Third attempt:

I then try to use cloud computers. But I can’t even install Ubuntu at the first place, because they seem not to allow user configure the Virtual Machine and it comes with a great cost.



Fourth attempt: 

# vivado2022.1-docker

**Disclaimer: The script in this repo were gathered from multiple informal resources which may contaminated your own docker image. Use in your own risk.**

---
I am using `13-inch, 2020, Four Thunderbolt 3 ports MacBook Pro` with `2.3 GHz Quad-Core Intel Core i7` and `16 GB 3733 MHz LPDDR4X`. Currently running `Ventura 13.2.1` OS.

The whole installation will take about 160GB memory and end up with about 90GB. 

---

1. Get the ubuntu docker

```sh
docker pull ubuntu
```

2. Download `Xilinx Unified Installer 2022.1: Linux Self Extracting Web Installer ` and you will yield `Xilinx_Unified_2022.1_0420_0327_Lin64.bin` installer. It can be found in [here](https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools/2022-1.html) 

3. Install xquartz using homebrew and set security setting.
```
brew install --cask xquartz
```

Set “Allow connections from network clients” in XQuartz -> settings... -> security

---
Note: Complete both under university WiFi would not take long.

---

4. Run your new ubuntu image using:
``` sh
xhost +
export DISPLAY=host.docker.internal:0
docker run -e DISPLAY=host.docker.internal:0 -it -v /sys/devices:/sys/devices:ro -v `pwd`:`pwd` -w `pwd` ubuntu:latest bash 
```

5. Install all possible vivado dependencies.
This can be done in two ways, 1. Give permission to `init_docker.sh` file under this repo or 2. Copy the instruction in `init_docker.sh` and run it line by line.

---
Note: Complete both under university WiFi would take a little while.

---

6. Install Vivado from the installer.
Assume your project directory is `/dev/new_docker_project` and you run the docker within the folder. Put your `Xilinx_Unified_2022.1_0420_0327_Lin64.bin` file under the folder.

AKA:

```
.
├── ...
├── Xilinx_Unified_2022.1_0420_0327_Lin64.bin
└── ...
```

Run:

```sh
chmod +x Xilinx_Unified_2022.1_0420_0327_Lin64.bin
./Xilinx_Unified_2022.1_0420_0327_Lin64.bin
```

An error would pop up saying `can't find/install libXtst.so.6`, the solution is to install the library as addressed [here](https://stackoverflow.com/questions/17355863/cant-find-install-libxtst-so-6)

```sh
sudo apt-get update
sudo apt-get install libxtst6
```

In theory, the installer will pop up an installation window. It will ask you to log-in and choose `Download and install now`

Then choose `Vivado`, `Vivado ML standard` and all tools you need. 

Then agree with licenses.

After confirm your installation configuration, your installation will be begin.

---
Note: Complete both under university WiFi or wired network would took 2 hours to download (around 8MB/s) 1 hour to install and couple minutes to finalize.

---

If all installation ran successfully, you should be able to run Vivado with command instructions.

If you installed in default path:
```sh
source /tools/Xilinx/Vivado/2022.1/settings64.sh
vivado &
```

---
Side notes:
I need this particular version to build PYNQ board. In the middle of the process, I got errors for `/lib/x86_64-linux-gnu/libudev.so.1 `. By doing hours of research, I found an work around:

```sh
LD_PRELOAD=/lib/x86_64-linux-gnu/libudev.so.1 vivado [your command]
```
Thats in the same line.

I tried it and it built PYNQ board project successfully.


If someone who saw this repo some time after and got errors for whatever issues, I am not able to fix it. Sorry about it. But if someone indeed got it working, let me know.

