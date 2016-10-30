# network-sdr

My configuration for a Raspberry Pi-based SDR. This setup runs [rtl-sdr](http://sdr.osmocom.org/trac/wiki/rtl-sdr) on a standard RTL2832-based DVB-T USB tuner to allow remote clients to connect to, and tune, the SDR.

Please note, this setup does not work on the Raspberry Pi Version 1 (256MB).

It has only been tested to work on the Raspberry Pi Revision 2 (512MB). 

### Resources

The code for correctly configuring the rtl-sdr software for the raspberry pi and RTL2832 dongle can be found here (among many places): https://learn.adafruit.com/freq-show-raspberry-pi-rtl-sdr-scanner/installation

The basis for the script used to call rtl-tcp with the correct ip address be found here: https://www.medo64.com/2016/04/sdr-on-raspberry-pi-3-software/

### Installation

Install Upstart:

`sudo apt-get install upstart`

Using the information from the Adafruit installation instructions:

Install the nessisary pre-requisites:
```
sudo apt-get update
sudo apt-get install cmake build-essential python-pip libusb-1.0-0-dev python-numpy git pandoc
```

Download, compile, and install rtl-sdr:
```
cd ~
git clone git://git.osmocom.org/rtl-sdr.git
cd rtl-sdr
mkdir build
cd build
cmake ../ -DINSTALL_UDEV_RULES=ON -DDETACH_KERNEL_DRIVER=ON
make
sudo make install
sudo ldconfig
```

Place the `rtl_tcp.sh` script in the pi user home directory

Place the sdrservice.conf file in /etc/init

Reboot the Pi
