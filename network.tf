module "vpc" {
    source  = "terraform-google-modules/network/google//modules/vpc"
    version = "= 5.1.0"

    project_id   = var.project-id 
    network_name = "urban-vpc-1"

    shared_vpc_host = false
}

module "subnet" {
    source  = "terraform-google-modules/network/google//modules/subnets"
    version = "= 5.1.0"

    project_id   = var.project-id
    network_name = "urban-vpc-1"

    subnets = [
        {
            subnet_name           = "urban-kube-subnet-1"
            subnet_ip             = "11.10.0.0/26"
            subnet_region         = var.region
        }
    ]

    secondary_ranges = {
        urban-kube-subnet-1 = [
            {
                range_name    = "pod-address"
                ip_cidr_range = "10.77.0.0/20"
            },
            {
                range_name    = "service-address"
                ip_cidr_range = "10.100.0.0/23"
            }
        ]
    }
}