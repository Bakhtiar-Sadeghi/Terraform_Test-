resource "ibm_compute_vm_instance" "vm2" {
hostname = "vm2"
domain = "example.com"
os_reference_code = "DEBIAN_8_64"
datacenter = "dal09"
network_speed = 10
hourly_billing = true
private_network_only = false
cores = 1
memory = 1024
disks = [25]
local_disk = false
}
