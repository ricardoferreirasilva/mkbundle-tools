#!/bin/bash
# Ubuntu Minimal 14.04
# 3.2.8
# Ask the user for their name
exe_name=$1
printf "Please choose the bundle target.\n"
printf "\t0 -> Current System Mono\n"
printf "\t1 -> Mono 4.8.0 Ubuntu 14.04 x64\n"
printf "\t2 -> Mono 4.8.0 Ubuntu 14.04 x86\n"

read target
if [ "$target" = "0" ]
then
    target="--simple"
elif [ "$target" = "1" ]
then
    target="--cross mono-4.8.0-ubuntu-14.04-x64"
elif [ "$target" = "2" ]
then
    target="--cross mono-4.8.0-ubuntu-14.04-x86"

else
    printf "Not a valid option. Aborting...\n"
    exit 0
fi

printf "Bundling with mkbundle..."



load_libraries="--library /usr/lib/libgdiplus.so.0 --library /usr/lib/x86_64-linux-gnu/libffi.so.6 --library /usr/lib/x86_64-linux-gnu/libgobject-2.0.so.0 --library /usr/lib/x86_64-linux-gnu/libdatrie.so.1 --library /usr/lib/x86_64-linux-gnu/libthai.so.0 --library /usr/lib/x86_64-linux-gnu/libpango-1.0.so.0 --library /usr/lib/x86_64-linux-gnu/libatk-1.0.so.0 --library /usr/lib/x86_64-linux-gnu/libpixman-1.so.0 --library /lib/x86_64-linux-gnu/libz.so.1 --library /usr/lib/x86_64-linux-gnu/libpng16.so.16 --library /usr/lib/x86_64-linux-gnu/libfreetype.so.6 --library /lib/x86_64-linux-gnu/libexpat.so.1 --library /usr/lib/x86_64-linux-gnu/libfontconfig.so.1 --library /usr/lib/x86_64-linux-gnu/libXau.so.6 --library /lib/x86_64-linux-gnu/libbsd.so.0 --library /usr/lib/x86_64-linux-gnu/libXdmcp.so.6 --library /usr/lib/x86_64-linux-gnu/libxcb.so.1 --library /usr/lib/x86_64-linux-gnu/libxcb-shm.so.0 --library /usr/lib/x86_64-linux-gnu/libxcb-render.so.0 --library /usr/lib/x86_64-linux-gnu/libX11.so.6 --library /usr/lib/x86_64-linux-gnu/libXrender.so.1 --library /usr/lib/x86_64-linux-gnu/libXext.so.6 --library /usr/lib/x86_64-linux-gnu/libcairo.so.2 --library /usr/lib/x86_64-linux-gnu/libgraphite2.so.3 --library /usr/lib/x86_64-linux-gnu/libharfbuzz.so.0 --library /usr/lib/x86_64-linux-gnu/libpangoft2-1.0.so.0 --library /usr/lib/x86_64-linux-gnu/libpangocairo-1.0.so.0 --library /usr/lib/x86_64-linux-gnu/libgmodule-2.0.so.0 --library /usr/lib/x86_64-linux-gnu/libgio-2.0.so.0 --library /usr/lib/x86_64-linux-gnu/libgdk_pixbuf-2.0.so.0 --library /usr/lib/x86_64-linux-gnu/libXinerama.so.1 --library /usr/lib/x86_64-linux-gnu/libXi.so.6 --library /usr/lib/x86_64-linux-gnu/libXrandr.so.2 --library /usr/lib/x86_64-linux-gnu/libXfixes.so.3 --library /usr/lib/x86_64-linux-gnu/libXcursor.so.1 --library /usr/lib/x86_64-linux-gnu/libXcomposite.so.1 --library /usr/lib/x86_64-linux-gnu/libXdamage.so.1 --library /usr/lib/x86_64-linux-gnu/libgdk-x11-2.0.so.0 --library /usr/lib/x86_64-linux-gnu/libgtk-x11-2.0.so.0 --library /usr/lib/cli/gtk-sharp-2.0/libgtksharpglue-2.so  --library /usr/lib/cli/glib-sharp-2.0/libglibsharpglue-2.so --library /usr/lib/libMonoPosixHelper.so"


mkbundle -o $exe_name $target --deps $exe_name.exe --static  --machine-config "/usr/etc/mono/4.5/machine.config" --config "/etc/mono/config" 
chmod +x $exe_name 
exit 0
