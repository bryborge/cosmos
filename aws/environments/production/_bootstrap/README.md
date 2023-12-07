# Bootstrap

This service contains the Terraform for establishing a standard AWS account baseline. Every new AWS account should run
this service once.

## Deployment

The services should be deployed in this order:

1.  `default-vpc`
2.  `primary-kms-key`
3.  `circleci`
