data ibm_resource_group "resource_group" {
    name = "Default"
}
resource ibm_container_cluster "tfcluster" {
name            = "tfclusterdoc"
datacenter      = "dal10"
machine_type    = "b3c.4x16"
hardware        = "shared"
public_vlan_id  = "2234945"
private_vlan_id = "2234947"

kube_version = "1.21.9"

default_pool_size = 3
    
public_service_endpoint  = "true"
private_service_endpoint = "true"

resource_group_id = data.ibm_resource_group.resource_group.id

resource "ibm_cr_namespace" "cr_namespace" {
    name = "bakhtiar_test"

    resource_group_id = data.ibm_resource_group.group.id
}

resource "ibm_cr_retention_policy" "cr_retention_policy" {
    namespace = ibm_cr_namespace.cr_namespace.id
    images_per_repo = 10
}

resource "ibm_iam_user_policy" "policy" {
    ibm_id = "bakhtiar.sadeghi@ibm.com"
    roles  = ["Manager"]

    resources {
        service = "container-registry"
        resource = ibm_cr_namespace.cr_namespace.id
        resource_type = "namespace"
        region = var.region
    }
}
}
