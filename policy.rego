package main

# Modern Syntax: We must explicitly say "contains" and "if"
deny contains msg if {
    # 1. Check if the resource is a server
    input.resource_type == "aws_instance"

    # 2. Check if the "CostCenter" tag is MISSING
    not input.tags.CostCenter

    # 3. Create the error message
    msg := sprintf("VIOLATION: Server '%v' is missing the CostCenter tag.", [input.id])
}