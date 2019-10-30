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
    primary_network_interface_id = "NEED TO SPECIFY"
    private_dns                  = "NEED TO SPECIFY"
    private_ip                   = "NEED TO SPECIFY"
    public_dns                   = "NEED TO SPECIFY"
    public_ip                    = "NEED TO SPECIFY"
    security_groups              = [
        "NEED TO SPECIFY",
    ]
    source_dest_check            = true
    subnet_id                    = " NEED TO SPECIFY "
    tags                         = {
        "Name" = " NEED TO SPECIFY "
    }
    tenancy                      = "default"
    volume_tags                  = {}
    vpc_security_group_ids       = [
        " NEED TO SPECIFY",
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
