action :create do

  directory "#{new_resource.mount_dir}" do
    recursive true
    user new_resource.user
    group new_resource.group
    path "#{new_resource.mount_dir}"
    action :create
    only_if { !::File.directory?("#{new_resource.mount_dir}") }
  end

  bash 'mount_efs' do
    code <<-EOH
      sudo mount #{new_resource.mount_flags} #{new_resource.efs_dns}:/ #{new_resource.mount_dir}
    EOH
  end
end

# Override Load Current Resource
def load_current_resource

  # efs-lwrp is the name of this cookbook.  Chef will convert the name to a class EfsLwrp.
  # This is because there is a '-' in the name.  If I were to create something other than
  # default, say service.rb in my provider & resource.  This would then be EfsLwrpService.new
  # and you would access it in your recipes with efs_lwrp_service.

  @current_resource = Chef::Resource::EfsLwrp.new(@new_resource.name)

  # A common step is to load the current_resource instance variables with what is established in new_resource
  # What is passed into new_resource in our recipes is not automatically passed into our current_resource.
  @current_resource.user(@new_resource.user)
  @current_resource.group(@new_resource.group)
  @current_resource.mount_dir(@new_resource.mount_dir)
  @current_resource.mount_flags(@new_resource.mount_flags)
  @current_resource.efs_dns(@new_resource.efs_dns)

end
