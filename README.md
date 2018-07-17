# terraform_r53_web_host_module

> Terraform module to orchestrate simple web host zone, including name
server (NS) records. Create a host zone and A records for both domain and www.

#### r53-web-host
* inputs:
  * host_domain:
  * public_ip: IP used for this
  * zone: For tags
  * environment: For tags
  * application: For tags

* outputs:
  * name_servers

```sh

module "r53-web-host" {
  source = "../../../modules/services/r53-web-host"
  host_domain = "${var.host_domain}"
  public_ip = "${var.public_ip}"
  zone = "${var.zone}"
  environment = "${var.environment}"
  application = "${var.application}"
}


```

## [License](LICENSE.md)

## TODO: map other than IP (CNAME: public dns name)
