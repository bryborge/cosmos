# AWS CloudFormation

Cloud infrastructure resource definitions and configuration.

## Andromeda

Acct #: `388372205874`

## Helpful Commands

*   Create VPC stack

    ```sh
    aws cloudformation create-stack \
      --stack-name 'alpheratz-vpc' \
      --template-body file://aws/andromeda/alpheratz-vpc/stack.yml \
      --parameters file://aws/andromeda/alpheratz-vpc/params/us-west-2/388372205874.json
    ```

*   Describe VPC stack

    ```sh
    aws cloudformation describe-stacks --stack-name 'alpheratz-vpc'
    ```

*   Delete VPC stack

    ```sh
    aws cloudformation delete-stack --stack-name 'alpheratz-vpc'
    ```

*   Query for a specific AMI's information

    ```sh
    aws ssm get-parameters --names \
      /aws/service/canonical/ubuntu/server/22.04/stable/current/amd64/hvm/ebs-gp2/ami-id
    ```

## References

*   [Official AWS CloudFormation User Guide](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/Welcome.html)
*   [Ubuntu Amazon EC2 Docs](https://ubuntu.com/server/docs/cloud-images/amazon-ec2)
