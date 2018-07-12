default[:efs][:user] = 'root'
default[:efs][:group] = 'root'
default[:efs][:mount_dir] = '/mnt/efs'
default[:efs][:mount_flags] = '-t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2'
default[:efs][:efs_dns] = nil
