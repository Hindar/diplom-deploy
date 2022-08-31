output "srv" {
  value = module.srv[*]
}

output "master" {
  value = module.master[*]
}

output "worker" {
  value = module.worker[*]
}

output "cidr_subnet" {
  value = var.subnet-cidr
}
