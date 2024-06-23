# Terraform AWS VM Deployment Demo

This Terraform configuration sets up a basic AWS infrastructure including a VPC, subnet, internet gateway, route table, security group, and an EC2 instance.

It also uses an AMI created via Packer that contains the 'Terramino' static page to play tetris when deployed into a HTTP address.

## Components Created

- **VPC**: Creates a Virtual Private Cloud (VPC) with the specified CIDR block.
- **Subnet**: Establishes a subnet within the VPC with public IP mapping enabled.
- **Internet Gateway**: Attaches an internet gateway to the VPC for internet access.
- **Route Table**: Defines a route table for the VPC with a default route via the internet gateway.
- **Route Table Association**: Associates the subnet with the route table for external connectivity.
- **Security Group**: Configures a security group allowing inbound traffic on ports 22 (SSH), 80 (HTTP), and 443 (HTTPS), and all outbound traffic.
- **EC2 Instance**: Launches an EC2 instance using the latest AMI identified in the `hcp_packer_artifact` data source.

## Usage

1. **Prerequisites**:

   - Terraform installed locally or in your CI/CD environment.
   - AWS credentials configured with sufficient permissions to create the resources defined.

2. **Configuration**:

   - Modify `variables.tf` to adjust parameters such as region, VPC CIDR, subnet CIDR, instance type, etc.

3. **Deployment**:

   ```bash
   terraform init
   terraform apply
   ```

   Enter 'yes' when prompted to confirm the plan

4. **Destroy**:
   ```bash
   terraform destroy
   ```
   Enter 'yes' when prompted to confirm the plan

## Notes

- Ensure AWS credentials are configured and have appropriate permissions.
- Customize variable values in variables.tf to suit your specific requirements before deployment.
