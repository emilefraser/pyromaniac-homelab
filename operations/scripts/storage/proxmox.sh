#!/bin/bash-


Description	Plugin type Level	Shared  Snapshots   Stable
ZFS (local)     zfspool     both        no      yes         yes
Directory       dir         file        no      no          yes
NFS             nfs         file        yes     no          yes
CIFS            cifs        file        yes     no          yes
Proxmox Backup  pbs         both        yes     n/a         yes
GlusterFS       glusterfs   file        yes     no          yes
CephFS          cephfs      file        yes     yes         yes
LVM             lvm         block       no      no          yes
LVM-thin        lvmthin     block       no      yes         yes
Ceph/RBD        rbd         block       yes     yes         yes

Content type		Subdir
VM images		images/<VMID>/
ISO images		template/iso/
Disk images
Container templates	template/cache/
Backup files		dump/
Snippets		snippets/
 

Proxmox VE can use local directories or locally mounted shares for storage. A directory is a file level storage, so you can store any content type like virtual disk images, containers, templates, ISO images or backup files.

You can mount additional storages via standard linux /etc/fstab, and then define a directory storage for that mount point.

Config File (/etc/pve/storage/cfg)


dir: backup
        path /mnt/backup
        content backup
        prune-backups keep-last=7
        max-protected-backups 3
        content-dirs backup=custom/backup/dir


#### Add storage (NVMe as NFS)

# Install the NFS server package on the Proxmox server:
sudo apt install nfs-kernel-server 

# Create a directory on the Proxmox server to share:
sudo mkdir /mnt/nfs-share 

# Format the new NVMe drive:
sudo mkfs.ext4 /dev/nvme0n1 

#Mount the new NVMe drive to the shared directory:
sudo mount /dev/nvme0n1 /mnt/nfs-share 

#Edit the NFS exports file:
sudo nano /etc/exports 

#Add the following line to the end of the file:
/mnt/nfs-share *(rw,sync,no_subtree_check) 

Save and close the file.

Restart the NFS server:
sudo service nfs-kernel-server restart 


#### Remove dangling storage (Backups directory storage

# Find the name of mount under servcies (mnt-pve-backups.mount)
cd /etc/systemd/system
ls


# stop the service 
systemctl stop mnt-pve-backups.mount
systemctl disable mnt-pve-backups.mount
rm mnt-pve-backups.mount
systemctl daemon-reload
systemctl reset-failed

# move image iso path 

current path = var/lib/vz/template/iso





# resize root
lvdisplay
lvremove /dev/pve/data -y

# Create it again with a new size.
lvcreate -L 10G -n data pve -T
# Give pve-root all the other size.
lvresize -l +100%FREE /dev/pve/root
# Resize pve-root file system
resize2fs /dev/mapper/pve-root
lvconvert --type thin-pool pve/data

cat etc/pve/storage.cfg
pvesm path <VOLUME_ID>

#Add storage pools

pvesm add <TYPE> <STORAGE_ID> <OPTIONS>
pvesm add dir <STORAGE_ID> --path <PATH>
pvesm add nfs <STORAGE_ID> --path <PATH> --server <SERVER> --export <EXPORT>
pvesm add lvm <STORAGE_ID> --vgname <VGNAME>
pvesm add iscsi <STORAGE_ID> --portal <HOST[:PORT]> --target <TARGET>
#Disable storage pools

pvesm set <STORAGE_ID> --disable 1
#Enable storage pools

pvesm set <STORAGE_ID> --disable 0
#Change/set storage options

pvesm set <STORAGE_ID> <OPTIONS>
pvesm set <STORAGE_ID> --shared 1
pvesm set local --format qcow2
pvesm set <STORAGE_ID> --content iso
Remove storage pools. This does not delete any data, and does not disconnect or unmount anything. It just removes the storage configuration.

pvesm remove <STORAGE_ID>
#Allocate volumes

pvesm alloc <STORAGE_ID> <VMID> <name> <size> [--format <raw|qcow2>]
#Allocate a 4G volume in local storage. The name is auto-generated if you pass an empty string as <name>

pvesm alloc local <VMID> '' 4G
#Free volumes

pvesm free <VOLUME_ID>

#List storage status
pvesm status
#List storage contents

pvesm list <STORAGE_ID> [--vmid <VMID>]
#List volumes allocated by VMID

pvesm list <STORAGE_ID> --vmid <VMID>
#List iso images

pvesm list <STORAGE_ID> --content iso
#List container templates

pvesm list <STORAGE_ID> --content vztmpl
#Show file system path for a volume

pvesm path <VOLUME_ID>




#Please use the following command to allocate a 4GB image on storage local:

# pvesm alloc local 100 vm-100-disk10.raw 4G
Formatting '/var/lib/vz/images/100/vm-100-disk10.raw', fmt=raw size=4294967296
#successfully created 'local:100/vm-100-disk10.raw'


# pvesm path local:100/vm-100-disk10.raw
/var/lib/vz/images/100/vm-100-disk10.raw
#And you can remove the image with:

# pvesm free local:100/vm-100-disk10.raw
