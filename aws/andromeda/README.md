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

## References

*   [Official AWS CloudFormation User Guide](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/Welcome.html)
