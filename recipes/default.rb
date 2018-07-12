#
# Cookbook:: efs-lwrp
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

Chef::Log.info("Installing NFS packages")
case node['platform_family']
when 'redhat'
  package 'nfs-utils'
when 'debian'
  package 'nfs-common'
end

Chef::Log.info("Installing EFS")
efs_lwrp "install_efs" do
  user node[:efs][:user]
  group node[:efs][:group]
  mount_dir node[:efs][:mount_dir]
  mount_flags node[:efs][:mount_flags]
  efs_dns node[:efs][:efs_dns]
end
