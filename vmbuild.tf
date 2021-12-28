provider "vsphere" {
  user           = "administrator@xxxxx.local"
  password       = "xxxxxxxxxx"
  vsphere_server = "xx.xx.xx.xx"

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = "Demo-DC"
}

data "vsphere_datastore" "datastore" {
  name          = "Disk-1"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_resource_pool" "pool" {
  name          = "Resources"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = "VM Network"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

resource "vsphere_virtual_machine" "vm" {
  name             = "terraform-test-${count.index + 1}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"
  wait_for_guest_net_timeout = 0
  count = 2

  num_cpus = 1
  memory   = 200
  guest_id = "centos7_64Guest"

  network_interface {
    network_id = "${data.vsphere_network.network.id}"
  }

  disk {
    label = "disk0"
    size  = 5
  }
}
