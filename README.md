# terraform_r53_web_host_module

> Terraform module to orchestrate simple web host zone, including name
server (NS) records. Create a host zone and A records for both domain and www.

Notes: CNAME can be used for subdomain, but is not legal at root level.  

#### r53-web-host
* inputs:
  * host_domain: Name of site
  * record_type: 'CNAME' or 'A'
  * ttl: Time to Live
  * end_point: Public IP or DNS
  * environment: For tags
  * application: For tags
  * zone: For tags

* outputs:
  * name_servers

```sh

module "r53-web-host" {
  source = "github.com/xybersolve/terraform_r53_web_host_module"

  host_domain = "${var.host_domain}"
  record_type = "${var.record_type}"
  ttl = "${var.ttl}"
  end_point = "${var.public_dns}"

  environment = "${var.environment}"
  application = "${var.application}"
  zone = "${var.zone}"
}

```

## Notes:
To map AWS resource for a domain registered on a non-AWS registrar
(i.e., networksolutions, godaddy, etc), grab the output nameservers and
put them in the domain's named servers on the registrar hosting the domain.


## [License](LICENSE.md)

###### TODO: map other than IP (CNAME: public dns name)
