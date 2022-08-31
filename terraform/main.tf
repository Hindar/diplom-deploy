terraform {
  required_version = "= 1.2.7"

  required_providers {
    yandex = { 
      source = "yandex-cloud/yandex"
      version = "~>0.70.0" 
    }
  }
}

provider "yandex" {
  token     = var.yc_iam_token
  cloud_id  = var.yc_cloud_id
  folder_id = var.yc_folder_id
  zone      = var.yc_zone
}

#------------------------------------------------------------------------------------------- 
# Настройка ВМ
#------------------------------------------------------------------------------------------- 

module "srv" {
  source = "./modules/instance"

  name         = "srv"
  region       = var.yc_zone
  subnet       = yandex_vpc_subnet.subnet-1.id
  i-addr       = var.srv[0].i-addr
  image-family = var.srv[0].image-family
  mem          = var.srv[0].mem
  ncpu         = var.srv[0].ncpu
}

module "master" {
  source = "./modules/instance"

  name         = "master"
  region       = var.yc_zone
  subnet       = yandex_vpc_subnet.subnet-1.id
  i-addr       = var.master[0].i-addr
  image-family = var.master[0].image-family
  mem          = var.master[0].mem
  ncpu         = var.master[0].ncpu
}

module "worker" {
  source = "./modules/instance"

  name         = "worker"
  region       = var.yc_zone
  subnet       = yandex_vpc_subnet.subnet-1.id
  i-addr       = var.worker[0].i-addr
  image-family = var.worker[0].image-family
  mem          = var.worker[0].mem
  ncpu         = var.worker[0].ncpu
}

#------------------------------------------------------------------------------------------- 
# Настройка сети
#------------------------------------------------------------------------------------------- 

resource "yandex_vpc_network" "network-1" {
  name = "network1"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = var.subnet-name
  zone           = var.subnet-zone
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = [var.subnet-cidr]
}
