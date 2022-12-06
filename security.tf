resource "aws_security_group" "sg1" {
  name = "sg1"
  description = "sg1 security group"
}

resource "aws_security_group_rule" "port80" {
    type = "ingress"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    security_group_id = "${aws_security_group.sg1.id}"
    source_security_group_id = "${aws_security_group.sg2.id}"
}

resource "aws_security_group" "sg2" {
  name = "sg2"
  description = "sg2 security group"
}

resource "aws_security_group_rule" "sameport80" {
    type = "ingress"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    security_group_id = "${aws_security_group.sg2.id}"
    source_security_group_id = "${aws_security_group.sg1.id}"
}

