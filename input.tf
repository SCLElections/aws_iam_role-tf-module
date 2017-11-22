variable "tags" {
  description = "AWS resource tags following company recomended"
  type        = "map"
}

variable "name" {
  description = "Unique name for an individual IAM Role."
}

variable "description" {
  description = "AWS Resource description"
}

variable "assume_role_json" {
  description = "Role policy to be assumed by an AWS resource. Defined as a data source."
}

variable "policy_document_json" {
  description = "Policy document to be assigned to the IAM Role. Defined as a data source."
}
