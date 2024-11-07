#!/bin/bash
kill $(cat /tmp/libcamera-vid.pid)
rm /tmp/libcamera-vid.pid
