The below infomartion is the various parameters that can be specified for the EC2 instance. We should fill in the important 
sone for our project. 

# aws_instance.test:
resource "aws_instance" "test" {
    ami                          = "ami-06d51e91cea0dac8d"
    arn                          = "arn:aws:ec2:us-west-2:342283246872:instance/i-02b91c4ef30489fd5"
    associate_public_ip_address  = true
    availability_zone            = "us-west-2b"
    cpu_core_count               = 1
    cpu_threads_per_core         = 1
    disable_api_termination      = false
    ebs_optimized                = false
    get_password_data            = false
    id                           = "i-02b91c4ef30489fd5"
    instance_state               = "running"
    instance_type                = "t2.micro"
    ipv6_address_count           = 0
    ipv6_addresses               = []
    monitoring                   = false
    primary_network_interface_id = "eni-0e12637b1a8cc0c0a"                                    (Still needs to be specified)
    private_dns                  = "ip-172-31-19-120.us-west-2.compute.internal"              (Still needs to be specified)
    private_ip                   = "172.31.19.120"                                            (Still needs to be specified)
    public_dns                   = "ec2-52-89-100-50.us-west-2.compute.amazonaws.com"         (Still needs to be specified)
    public_ip                    = "52.89.100.50"                                             (Still needs to be specified)
    security_groups              = [                                                          (Still needs to be specified)
        "default",      
    ]
    source_dest_check            = true
    subnet_id                    = "subnet-5229362b"                                          (Still needs to be specified)
    tags                         = {                                                          (Still needs to be specified)
        "Name" = "testserverJD"   
    }
    tenancy                      = "default"
    volume_tags                  = {}
    vpc_security_group_ids       = [                                                          (Still needs to be specified) 
        "sg-7b8f2638",
    ]

    credit_specification {
        cpu_credits = "standard"
    }

    root_block_device {
        delete_on_termination = true
        encrypted             = false
        iops                  = 100
        volume_id             = "vol-0cd2365636d6af2ba"
        volume_size           = 8
        volume_type           = "gp2"
    }
}
