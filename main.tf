terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = ">=1.0.5"
    }
  }
}

provider "proxmox" {
  pm_tls_insecure = true
  pm_api_url      = "https://192.168.110.103:8006/api2/json"
  pm_user         = "root@pam"
  pm_password     = "Plomba#022"
}

resource "proxmox_lxc" "less15_lxc" {
  target_node  = "pve"
  hostname     = "less15"
  ostemplate   = "local:vztmpl/ubuntu-20.04-standard_20.04-1_amd64.tar.gz"
  password     = "12345"
  unprivileged = true

  rootfs {
    storage = "store15"
    size    = "8G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "dhcp"
  }
}
