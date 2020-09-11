# Module Terraform Gke-cluster


For include this module, in your proyect add this code.

```
module "gke" {
  source  = "github.com/Rodrigo0461/tf-gke-cluster"
  project = "${var.project}"
  env     = "${var.env}"
}
```
