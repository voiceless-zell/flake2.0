{
  pkgs,
  ...
}:
{
  boot = {
    swraid = {
      enable = true;
      mdadmConf = ''
        # mdadm configuration file
        #
        # mdadm will function properly without the use of a configuration file,
        # but this file is useful for keeping track of arrays and member disks.
        # In general, a mdadm.conf file is created, and updated, after arrays
        # are created. This is the opposite behavior of /etc/raidtab which is
        # created prior to array construction.
        #
        #
        # the config file takes two types of lines:
        #
        #	DEVICE lines specify a list of devices of where to look for
        #	  potential member disks
        #
        #	ARRAY lines specify information about how to identify arrays so
        #	  so that they can be activated
        #
        # You can have more than one device line and use wild cards. The first
        # example includes SCSI the first partition of SCSI disks /dev/sdb,
        # /dev/sdc, /dev/sdd, /dev/sdj, /dev/sdk, and /dev/sdl. The second
        # line looks for array slices on IDE disks.
        #
        #DEVICE /dev/sd[bcdjkl]1
        #DEVICE /dev/hda1 /dev/hdb1
        #
        # If you mount devfs on /dev, then a suitable way to list all devices is:
        #DEVICE /dev/discs/*/*
        #
        #
        # The AUTO line can control which arrays get assembled by auto-assembly,
        # meaing either "mdadm -As" when there are no 'ARRAY' lines in this file,
        # or "mdadm --incremental" when the array found is not listed in this file.
        # By default, all arrays that are found are assembled.
        # If you want to ignore all DDF arrays (maybe they are managed by dmraid),
        # and only assemble 1.x arrays if which are marked for 'this' homehost,
        # but assemble all others, then use
        #AUTO -ddf homehost -1.x +all
        #
        # ARRAY lines specify an array to assemble and a method of identification.
        # Arrays can currently be identified by using a UUID, superblock minor number,
        # or a listing of devices.
        #
        #	super-minor is usually the minor number of the metadevice
        #	UUID is the Universally Unique Identifier for the array
        # Each can be obtained using
        #
        # 	mdadm -D <md>
        #
        #ARRAY /dev/md0 UUID=3aaa0122:29827cfa:5331ad66:ca767371
        #ARRAY /dev/md1 super-minor=1
        ARRAY /dev/md0 devices=/dev/sda,/dev/sdb
        #
        # ARRAY lines can also specify a "spare-group" for each array.  mdadm --monitor
        # will then move a spare between arrays in a spare-group if one array has a failed
        # drive but no spare
        #ARRAY /dev/md4 uuid=b23f3c6d:aec43a9f:fd65db85:369432df spare-group=group1
        #ARRAY /dev/md5 uuid=19464854:03f71b1b:e0df2edd:246cc977 spare-group=group1
        #
        # When used in --follow (aka --monitor) mode, mdadm needs a
        # mail address and/or a program.  This can be given with "mailaddr"
        # and "program" lines to that monitoring can be started using
        #    mdadm --follow --scan & echo $! > /run/mdadm/mon.pid
        # If the lines are not found, mdadm will exit quietly
        #MAILADDR root@mydomain.tld
        #PROGRAM /usr/sbin/handle-mdadm-events
      '';
    };
  };
  systemd.services.tailscaled = {
    description = "Tailscale Mode";
    wantedBy = [ "multi-user.target" ];
  };
  networking = {
    hostName = "Galifrey";
    networkmanager.enable = true;
    firewall.enable = false;
  };
  services = {
    plex = {
      enable = true;
    };
    tailscale = {
      enable = true;
      useRoutingFeatures = "both";
    };
    xserver = {
      enable = true;
      xkb.layout = "us";
      videoDrivers = [ "intel" ];
    };
    samba = {
      enable = true;
      settings = {
        public = {
          browsable = "yes";
          "guest ok" = "yes";
          path = "/mnt/raid/";
        };
      };
    };
  };
  hardware.opengl = {
    enable = true;
    extraPackages = [
    ];
  };
}
