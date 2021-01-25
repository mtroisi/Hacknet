# Create DNS record for AWS Instance
resource "cloudflare_record" "Instance" {
	zone_id		= var.zoneID
	name		= var.name
	type 		= "A"
	value		= aws_instance.Instance.public_ip
	proxied		= false
}
