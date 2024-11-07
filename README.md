Installation: 

Install the kernel headers for your kernel version:

sudo apt install -y libcamera-apps v4l2loopback-dkms motion ffmpeg
sudo apt install -y raspberrypi-kernel-headers
sudo apt install --reinstall v4l2loopback-dkms
sudo depmod -a
sudo modprobe v4l2loopback devices=1 video_nr=10 card_label="VirtualCam" exclusive_caps=1

 Verify the Module is Loaded

 Also, verify that the device /dev/video10 exists:


ls -l /dev/video10

Now that the v4l2loopback module is loaded, you can proceed with the rest of the setup:

Create the Systemd Service for libcamera-vid

As previously outlined, create the /etc/systemd/system/libcamera-vid.service file and enable it.

Configure Motion

Ensure that the motion configuration points to the correct video device (/dev/video10).



Create a Systemd Service for the Virtual Camera
sudo nano /etc/systemd/system/libcamera-vid.service

```
[Unit]
Description=Libcamera Virtual Camera
After=multi-user.target

[Service]
Type=simple
ExecStart=/usr/bin/libcamera-vid -t 0 --inline --framerate 30 --width 1920 --height 1080 -o /dev/video10
Restart=always
User=pi

[Install]
WantedBy=multi-user.target
```

Enable and start the service

sudo systemctl daemon-reload
sudo systemctl enable libcamera-vid.service
sudo systemctl start libcamera-vid.service

chmod +x /home/pi/start_recording.sh
chmod +x /home/pi/stop_recording.sh

# Start and Enable Motion Service
sudo systemctl enable motion
sudo systemctl start motion
