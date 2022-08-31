variable "name" {
  type    = string
  default = ""
}

variable "region" {
  type = string
}

variable "subnet" {
  type = string
}

variable "image-family" {
  type = string
}

variable "mem" {
  type    = number
  default = 4
}

variable "ncpu" {
  type    = number
  default = 2
}

variable "cpu-fraq" {
  type    = number
  default = 20
}

variable "boot-disk-size" {
  type    = number
  default = 20 # GB
}

variable "is-preemptible" {
  type    = bool
  default = false
}

variable "i-addr" {
  type    = bool
  default = false
}

variable "login" {
  type    = string
  default = "evgeny"
}
