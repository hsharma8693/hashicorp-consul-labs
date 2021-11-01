datacenter = "dc1"
data_dir = "/opt/consul"
encrypt = "96Jusi76pGwVZ70yNRHvLlHla17qxw+ufsfUWgH2YPk="
ca_file = "/etc/consul.d/consul-agent-ca.pem"
cert_file = "/etc/consul.d/dc1-server-consul-0.pem"
key_file = "/etc/consul.d/dc1-server-consul-0-key.pem"
verify_incoming = true
verify_outgoing = true
verify_server_hostname = true
retry_join = ["172.16.0.11","172.16.0.12","172.16.0.13"]
acl = {
  enabled = true
  default_policy = "allow"
  enable_token_persistence = true
}
performance {
  raft_multiplier = 1
}
audit {
  enabled = true
  sink "My sink" {
    type   = "file"
    format = "json"
    path   = "data/audit/audit.json"
    delivery_guarantee = "best-effort"
    rotate_duration = "24h"
    rotate_max_files = 15
    rotate_bytes = 25165824
  }
}

