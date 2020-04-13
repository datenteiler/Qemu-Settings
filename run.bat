@ECHO OFF
REM #########################################################################
REM (c) Christian Imhorst - April 2020
REM <datenteiler {AT} opensuse {DOT} org >
REM
REM #########################################################################
REM    This program is free software: you can redistribute it and/or modify
REM    it under the terms of the GNU General Public License as published by
REM    the Free Software Foundation, either version 3 of the License, or
REM    (at your option) any later version.
REM
REM    This program is distributed in the hope that it will be useful,
REM    but WITHOUT ANY WARRANTY; without even the implied warranty of
REM    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
REM    GNU General Public License for more details.
REM
REM    You should have received a copy of the GNU General Public License
REM    along with this program.  If not, see <http://www.gnu.org/licenses/>
REM #########################################################################

REM Start Debian 10 on 32-bit ARM with QEMU on Windows. 

SET QEMUDIR=.\Qemu
SET QEMUEXE=qemu-system-i386w.exe
SET KERNEL=vmlinuz 
SET INITRD=initrd.img
SET HARDDISK=hda.qcow2

REM #########################
REM # Boot Debian 10 Buster #
REM #########################

%QEMUDIR%\%QEMUEXE% -L %QEMUDIR%\bios -smp "2" -m 1024 ^
-kernel %KERNEL% ^
-initrd %INITRD% ^
-hda %HARDDISK% ^
-append "root=/dev/sda1 rootfstype=ext4 rw" ^
-vga vmware ^
-display gtk ^
-k de ^
-device e1000,netdev=network0 ^
-netdev user,id=network0,hostfwd=tcp::2222-:22 ^
-name "Debian 10 Buster" ^
-no-reboot 
