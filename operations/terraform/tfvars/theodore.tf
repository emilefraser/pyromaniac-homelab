resource "proxmox_vm_qemu" "theodore" {
    name = "theodore"
    target_node = "pve"
    clone = "template-geek-cookbook-pve"
    os_type = "cloud-init"
    onboot = true
    ipconfig0 = "ip=192.168.68.203/24,gw=192.168.68.1"  
    nameserver = "1.1.1.1"  
    memory = 8192
    cores = 4
    ciuser = "root"
    cipassword = "105022_Alpha"
    sshkeys = <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDCokxhd1ZPdj4zKjL4ju02TXUOcaEsgau4iLUOk3Q6E40MK2MACS0BCcOafgqZHV68GouuXHk7ap+ORdBan5WEXP86UwdFW+bHRgF53oOeU7Nj3i7z/kEyBTLGqvsNLRck7kQKAT4ZVDYVhwHZIIoxolxVUwNO7BDAwDt7nqjGnhElmmqksiURmX/2m+ToGtUtT1hKq5oM3VBq+3DPJi+S+6M5QTlGlMdVIU+BdwAyBTBkwQFn/yNX5yrDdwl167ORty1smosIVtRMMkRnYlUFP95gSxKUBpz3CnRHy1eqrC6tlhTaKnAPV/1sZnkvaLgr56eHH1W2LQ4nOqrNnZPh root@pve
EOF
    network {
        model = "virtio"
        bridge = "vmbr0"
        macaddr = "52:54:00:68:02:03"
    }
    disk {
        storage = "local-lvm"
        size = "30G"
        type = "scsi"
    }    
    disk {
        storage = "local-lvm"
        size = "50G"
        type = "scsi"
    }          
}

