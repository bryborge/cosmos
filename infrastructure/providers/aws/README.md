# AWS

Infrastructure as Code for the various resources provided on Amazon Web Services.

## Helpful Commands

*   Create VPC stack

    ```sh
    aws cloudformation create-stack \
      --stack-name 'development-vpc' \
      --template-body file://aws/cloudformation/development-vpc/stack.yml \
      --parameters file://aws/cloudformation/development-vpc/params/us-west-2/388372205874.json
    ```

*   Describe VPC stack

    ```sh
    aws cloudformation describe-stacks --stack-name 'development-vpc'
    ```

*   Delete VPC stack

    ```sh
    aws cloudformation delete-stack --stack-name 'development-vpc'
    ```

## References

*   [Official AWS Documentation](https://docs.aws.amazon.com/index.html)
*   [Official AWS CloudFormation User Guide](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/Welcome.html)
*   [Ubuntu Amazon EC2 Docs](https://ubuntu.com/server/docs/cloud-images/amazon-ec2)
