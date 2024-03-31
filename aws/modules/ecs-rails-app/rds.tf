resource "aws_db_instance" "rds" {
  identifier           = var.db_identifier
  allocated_storage    = var.storage_size
  storage_type         = var.storage_kind
  engine               = var.db_engine
  engine_version       = var.db_engine_version
  instance_class       = var.rds_instance_class
  db_name              = var.db_name
  username             = "kollections"
  password             = "mypassword" # FIXME
  parameter_group_name = var.db_parameter_group_name

  vpc_security_group_ids = [aws_security_group.rds.id]
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name
  publicly_accessible    = false

  backup_retention_period = 7                     # Number of days to retain automated backups
  backup_window           = "03:00-04:00"         # Preferred UTC backup window
  maintenance_window      = "mon:04:00-mon:04:30" # Preferred UTC maintenance window

  # Enable automated backups
  skip_final_snapshot       = true
  # final_snapshot_identifier = "db-snap"
}

resource "aws_security_group" "rds" {
  vpc_id      = aws_vpc.vpc.id
  name        = "${var.service_name}_rds_security_group"
  description = "${var.service_name} security group"

  # Private: Only allow traffic from the web server.
  ingress {
    protocol  = "tcp"
    self      = true
    from_port = 5432
    to_port   = 5432
  }

  # Allow all outbound traffic.
  egress {
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
  }
}
