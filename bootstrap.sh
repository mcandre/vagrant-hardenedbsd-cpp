#!/bin/sh
sudo hbsd-update &&
    sudo pkg update &&
    sudo pkg install -y llvm50 &&
    sudo pkg clean -y
