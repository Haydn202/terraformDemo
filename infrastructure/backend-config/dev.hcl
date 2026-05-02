# Use with: terraform init -reconfigure -backend-config=backend-config/dev.hcl
# Keeps dev state separate from prod in the same storage container.
key = "meta-mentor/dev/terraform.tfstate"
