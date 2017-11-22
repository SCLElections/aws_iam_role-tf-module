output "iam_role_name" {
  value = "${aws_iam_role.assume_role.name}"
}

output "iam_role_arn" {
  value = "${aws_iam_role.assume_role.arn}"
}

output "policy_doc_id" {
  value = "${aws_iam_policy.policy.id}"
}

output "policy_doc_name" {
  value = "${aws_iam_policy.policy.name}"
}

output "policy_doc_arn" {
  value = "${aws_iam_policy.policy.arn}"
}

output "policy_attach_id" {
  value = "${aws_iam_role_policy_attachment.policy_attach.id}"
}

output "iprofile_id" {
  value = "${aws_iam_instance_profile.iprofile.id}"
}

output "iprofile_name" {
  value = "${aws_iam_instance_profile.iprofile.name}"
}

output "iprofile_arn" {
  value = "${aws_iam_instance_profile.iprofile.arn}"
}
