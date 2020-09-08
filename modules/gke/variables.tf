variable env {}
variable project {}


variable region {
    default= "us-central1"
}

variable "machine_type" {
  default = {
    "qa"   = "n1-standard-2"
    "prod" = "n1-standard-4"
  }
  description = "Type of instance for nodes"
}

variable "node_pool" {
    default= {
        "qa"   = "qa-node-pool"
        "prod" = "prod-node-pool"
    }
}

variable "node_count" {
    default= {
        "qa"   = "1"
        "prod" = "2"
    }
}

