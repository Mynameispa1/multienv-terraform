resource "aws_instance" web {
    for_each = var.instance_names
    ami = data.aws_ami.centos.id
    instance_type = each.value

tags = {
    Name = each.key
}    

}


resource "aws_route53_record" "www" {
    # #count = 11
    # count = length(var.instance_names) # length is terrafrom function 
  for_each = aws_instance.web  
  zone_id = var.zone_id
  name    = "${each.key}.${var.domain_name}" #interpollation
  type    = "A"
  ttl     = 1
  #records = [aws_instance.web[count.index].private_ip]
#   records = [var.instance_names[count.index] == "web" ? aws_instance.web[count.index].public_ip : aws_instance.web[count.index].private_ip]
    records = [each.key == "web" ? each.value.public_ip : each.value.private_ip]
}