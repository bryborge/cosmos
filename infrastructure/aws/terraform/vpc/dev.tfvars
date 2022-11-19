name            = "development"
region          = "us-west-2"
cidr_block      = "10.42.0.0/16"
public_subnets  = ["10.42.1.0/24", "10.42.11.0/24"]
private_subnets = ["10.42.21.0/24", "10.42.31.0/24"]
azs             = ["us-west-2a", "us-west-2b", "us-west-2c"]
vpn_cidr_block  = ["97.115.120.0/32"]
