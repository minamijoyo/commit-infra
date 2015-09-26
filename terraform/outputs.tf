output "public_ip" {
    value = "${aws_instance.ap.public_ip}"
}
