#
# Cookbook:: efs-lwrp
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

Chef::Log.info("Installing EFS")
efs_lwrp "install_efs" do
  mount_dir node[:efs][:mount_dir]
  mount_flags node[:efs][:mount_flags]
  efs_dns node[:efs][:efs_dns]
end
