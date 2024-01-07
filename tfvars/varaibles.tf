variable "instance_names" {
  type = map
#   default = {
#     mongodb = "t3.small"
#     redis = "t2.micro"
#     mysql = "t3.small"
    
#   }
}

variable "zone_id" {
    type = string
    default = "Z1024693OKJAW10DDB2X"
}

variable "domain_name" {
    type =  string
    default = "pavankumarmuvva.online"
}
