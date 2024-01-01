

resource "aws_security_group_rule" "inbound_rule" {
    security_group_id = aws_security_group.allow_tls.id

    for_each = var.additional_ingress_rules

    type = "ingress"
    from_port = each.value.from_port
    to_port = each.value.to_port
    protocol = each.value.protocol
    cidr_blocks = each.value.cidr_blocks
  
}


resource "aws_security_group_rule" "outbound_rule" {
    security_group_id = aws_security_group.allow_tls.id

    type = "egress"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    # ipv6_cidr_blocks = ["::/0"]

}