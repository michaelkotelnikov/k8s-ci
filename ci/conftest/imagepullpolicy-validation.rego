package main

deny[msg] {
  input.kind == "Deployment"
  containers := input.spec.template.spec.containers
  containers[_].imagePullPolicy != "IfNotPresent"

  msg := sprintf("The %v %v resource violates a policy. Containers must not pull an image if it is present on the host. Set '.spec.template.spec.template.containers' to 'IfNotPresent'", [input.metadata.name, input.kind])
}

deny[msg] {
  input.kind == "Deployment"
  containers := input.spec.template.spec.containers[_]
  not containers.imagePullPolicy

  msg := sprintf("The %v %v resource violates a policy. Containers must set an imagePullPolicy at '.spec.template.spec.template.containers' to 'IfNotPresent'.", [input.metadata.name, input.kind])
}