This is a hackish script to build a snap compliant linux 5.1 kernel
on and for a raspberry pi4.

It clones the https://github.com/raspberrypi/linux.git linux-5.1 tree, then
the config and apparmor patches get applied during build, kernel modules
and dtbs get copied into /boot, /boot/overlays and /lib/modules.

At the end, a tarball with the binaries is built so it can be transferred and
unpacked on any other pi4 system.

## checking the kernel

After switching to this kernel you can check the snap confinement like:

ogra@pi4:~$ snap debug confinement
strict
ogra@pi4:~$ snap debug sandbox-features
apparmor:             kernel:caps kernel:dbus kernel:domain kernel:file kernel:mount kernel:namespaces kernel:network kernel:network_v8 kernel:policy kernel:ptrace kernel:query kernel:rlimit kernel:signal parser:unsafe policy:default support-level:full
confinement-options:  classic devmode strict
dbus:                 mediated-bus-access
kmod:                 mediated-modprobe
mount:                freezer-cgroup-v1 layouts mount-namespace per-snap-persistency per-snap-profiles per-snap-updates per-snap-user-profiles stale-base-invalidation
seccomp:              bpf-argument-filtering kernel:allow kernel:errno kernel:kill_process kernel:kill_thread kernel:log kernel:trace kernel:trap kernel:user_notif
udev:                 device-cgroup-v1 tagging
ogra@pi4:~$ snap version
snap    2.39.2ubuntu0.2
snapd   2.39.2ubuntu0.2
series  16
ubuntu  16.04
kernel  5.1.16+
ogra@pi4:~$ 
