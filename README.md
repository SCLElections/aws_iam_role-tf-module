# Module: IAM Role

## Resources included:

* aws_iam_role - [aws_iam_role](https://www.terraform.io/docs/providers/aws/r/iam_role.html)
* aws_iam_policy - [aws_iam_policy](https://www.terraform.io/docs/providers/aws/r/iam_policy.html)
* aws_iam_role_policy_attachment - [aws_iam_role_policy_attachment](https://www.terraform.io/docs/providers/aws/r/iam_policy_attachment.html)
* aws_iam_instance_profile - [aws_iam_instance_profile](https://www.terraform.io/docs/providers/aws/r/iam_instance_profile.html)


# NOTE

**To be able to create an IAM role and attache it to an AWS resource, all the resources in this module must be created.**

**To be able to use this module, mention the source of your module as:**
```
module "my_iam_role" {
  source = "git@github.com:SCLElections/aws_iam_role-tf-module"
}

```

## How does it all work?

* Create a Module for an IAM role by passing values to the following variables as shown below,

```
module "iam_role_module_name" {
  name                  = "${var.name}" or "Pass a name directly here"
  assume_role_json      = "${data.aws_iam_policy_document.assume_role_name.json}"
  policy_document_json  = "${data.aws_iam_policy_document.policy_document_name.json}"
  description           = "Add a Policy description."

  tags = "${var.tags}"
}
```

* Write access policies as per the requirment using a **data** source called **aws_iam_policy_document**. We need two data sources to achieve this.
  - Assume Role, this is attached to the **aws_iam_role** resource. e.g.
    ```
    data "aws_iam_policy_document" "policy_name" {
  		statement {
    		effect  = "Allow"
    		actions = ["sts:AssumeRole"]

    		principals {
      			type        = "Service"
      			identifiers = ["ec2.amazonaws.com"]
    		}
  		}
	}
	```
  - Defining actions policy, this is attached to the **aws_iam_policy** resource. e.g.
    ```
    data "aws_iam_policy_document" "policy_name" {
  		statement {
    		effect = "Allow"

    		actions = [
      			"s3:GetBucketAcl",
    		]

    		resources = [
      			"${aws_s3_bucket.name.arn}/*",
      			"${aws_s3_bucket.name.arn}",
    		]
  		}
	}
	```

* The **aws_iam_policy** resource gets automatically attached to the **aws_iam_role** resource using **aws_iam_role_policy_attachment** resource.

* Finally attach the **aws_iam_instance_profile** name to an AWS resource as shown below
  ```
  iam_instance_profile        = "${module.iam_role_module_name.iprofile_name}"
  ```
  Here **iprofile_name** is an **output**.

## Outputs list

* iam_role_name
* iam_role_arn
* policy_doc_id
* policy_doc_name
* policy_doc_arn
* policy_attach_id
* iprofile_id
* iprofile_name
* iprofile_arn