output "id" {
  value = yandex_compute_instance.host.id
}

output "addr-int" {
  value = yandex_compute_instance.host.network_interface.0.ip_address
}

output "addr-ext" {
  value = var.i-addr ? yandex_compute_instance.host.network_interface.0.nat_ip_address : "-"
}
