cl /utf-8 -DGLFW_EXPOSE_NATIVE_WIN32 /W4 /I .\include main.c framework.c /link /LIBPATH:.\lib user32.lib shell32.lib gdi32.lib ws2_32.lib ntdll.lib userenv.lib glfw3_mt.lib wgpu_native.lib
