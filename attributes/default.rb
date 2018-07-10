default[:efs][:mount_dir] = '/mnt/efs'
default[:efs][:mount_flgs] = '-t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2'
default[:efs][:efs_dns] = nil
