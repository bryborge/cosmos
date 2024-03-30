variable "region" {
  type        = string
  description = "The AWS region."
}

variable "cidr_block_prefix" {
  type        = string
  description = "The first two octets for the Classless Inter-Domain Routing (CIDR) block."
}

variable "service_name" {
  type        = string
  description = "The name of the service."
}

variable "rds_instance_class" {
  type        = string
  description = "The type of rds instance to use."
}

variable "storage_size" {
  type        = number
  description = "The size (in GiB) to allocate for the rds instance."
}

variable "storage_kind" {
  type        = string
  description = "The type of storage drive to use for the rds instance."
}

variable "db_identifier" {
  type        = string
  description = "The db identifier (e.g. name of the rds instance)."
}

variable "db_engine" {
  type        = string
  description = "The database engine to use."
}

variable "db_engine_version" {
  type        = string
  description = "The database engine version."
}

variable "db_name" {
  type        = string
  description = "The name of the database."
}

variable "db_parameter_group_name" {
  type        = string
  description = "The database parameter group to associate with the database instance. "
}
