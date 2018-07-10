# Base Resource
actions :create

default_action :create if defined?(default_action)

# Name Space
attribute :base_name, name_attribute: true, kind_of: String, required: false, default: 'default'

# Parameters
attribute :mount_dir, kind_of: String, required: true, default: nil
attribute :mount_flags, kind_of: String, required: true, default: nil
attribute :efs_dns, kind_of: String, required: true, default: nil
