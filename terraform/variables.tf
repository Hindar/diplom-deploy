
variable "srv" {
  description = "The setting templates for the cloud hosts"
  default = [
    {
      image-family = "ubuntu-2004-lts"
      i-addr       = true
      mem          = 4
      ncpu         = 4
    },
  ]
}

variable "master" {
  description = "The setting templates for the cloud hosts"
  default = [
    {
      image-family = "ubuntu-2004-lts"
      i-addr       = false
      mem          = 4
      ncpu         = 4
    },
  ]
}

variable "worker" {
  description = "The setting templates for the cloud hosts"
  default = [
    {
      image-family = "ubuntu-2004-lts"
      i-addr       = false
      mem          = 4
      ncpu         = 4
    },
  ]
}

variable "yc_iam_token" {
  description = "Yandex.Cloud IAM-token for the provider auth. Attention: don't set directly in a tracked git-file"
  
  type      = string
  sensitive = true
}

variable "yc_cloud_id" {
  description = "Yandex.Cloud ID default"

  #default   = "b1g5uttcjf4thd65lveq"   
  type = string
}

variable "yc_folder_id" {
  description = "Yandex.Cloud Folder ID default"
  
  #default   = "b1gij1ps13cn8e5uqlhd"
  type = string
}

# СЕТЬ

variable "yc_zone" {
  description = "Yandex.Cloud zone default"

  type    = string
  default = "ru-central1-a"
}

variable "subnet-name" {
  default = "default" 
  type = string
}

variable "subnet-zone" {
  default = "ru-central1-a"
  type = string
}

variable "subnet-cidr" {
  default = "192.168.10.0/24"
  type = string
}