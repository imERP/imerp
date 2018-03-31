class Admins::SystemInfoController < Admins::ApplicationController
    layout "admin"

  EXCLUDED_MOUNT_OPTIONS = [
    'nobrowse',
    'read-only',
    'ro'
  ].freeze

  EXCLUDED_MOUNT_TYPES = [
    'autofs',
    'binfmt_misc',
    'cgroup',
    'debugfs',
    'devfs',
    'devpts',
    'devtmpfs',
    'efivarfs',
    'fuse.gvfsd-fuse',
    'fuseblk',
    'fusectl',
    'hugetlbfs',
    'mqueue',
    'proc',
    'pstore',
    'rpc_pipefs',
    'securityfs',
    'sysfs',
    'tmpfs',
    'tracefs',
    'vfat'
  ].freeze


  def show
    system_info = Vmstat.snapshot
    mounts = Sys::Filesystem.mounts

    @disks = []
    mounts.each do |mount|
      mount_options = mount.options.split(',')

      next if (EXCLUDED_MOUNT_OPTIONS & mount_options).any?
      next if (EXCLUDED_MOUNT_TYPES & [mount.mount_type]).any?

      begin
        disk = Sys::Filesystem.stat(mount.mount_point)
        @disks.push({
          bytes_total: disk.bytes_total,
          bytes_used:  disk.bytes_used,
          disk_name:   mount.name,
          mount_path:  disk.path
        })
      rescue Sys::Filesystem::Error
      end
    end

    @cpus = system_info.cpus.length

    @mem_used = system_info.memory.active_bytes
    @mem_total = system_info.memory.total_bytes
  end
end
