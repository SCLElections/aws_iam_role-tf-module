resource "aws_iam_role" "assume_role" {
  name               = "iam-role-${var.tags["Name"]}-${var.tags["environment"]}-${var.name}-tf"
  path               = "/"
  assume_role_policy = "${var.assume_role_json}"
}

resource "aws_iam_policy" "policy" {
  name        = "iam-policy-${var.tags["Name"]}-${var.tags["environment"]}-${var.name}-tf"
  path        = "/"
  description = "${var.description}"
  policy      = "${var.policy_document_json}"
}

resource "aws_iam_role_policy_attachment" "policy_attach" {
  role       = "${aws_iam_role.assume_role.name}"
  policy_arn = "${aws_iam_policy.policy.arn}"
}

resource "aws_iam_instance_profile" "iprofile" {
  name = "iam-iprofile-${var.tags["Name"]}-${var.tags["environment"]}-${var.name}-tf"
  path = "/"
  role = "${aws_iam_role.assume_role.name}"
}
