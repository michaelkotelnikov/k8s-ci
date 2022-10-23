package main

deny[msg] {
  input.kind == "Deployment"
  containers := input.spec.template.spec.containers
  containers[_].imagePullPolicy != "IfNotPresent"

  msg := sprintf("The %v %v resource violates a policy. Containers must not pull an image if it is present on the host.", [input.metadata.name, input.kind])
}
