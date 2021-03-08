variable "location"{
type= string
}
variable "location2"{
type= string
}

variable "location3"{
type= string
}

variable "admin_username" {
    type = string
    description = "Administrator user name for virtual machine"
}

variable "admin_password" {
    type = string
    description = "Password must meet Azure complexity requirements"
}

