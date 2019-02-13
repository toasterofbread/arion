{ lib, ... }:

{
  options = {

    host.uid = lib.mkOption {
      type = lib.types.int;
      description = ''
        The numeric user id (UID) of the user running arion.

        Assuming this user id is helpful when dealing with the user's
        files, mounted into the container as a volume.
      '';
    };

    host.nixStorePrefix = lib.mkOption {
      type = lib.types.string;
      default = "";
      example = "/mnt/foo";
      description = ''
        Prefixes store paths on the host, allowing the Nix store to be
        stored at an alternate location without altering the format of
        store paths.

        For example: instead of mounting the host's /nix/store as the
        container's /nix/store, this will mount /mnt/foo/nix/store
        as the container's /nix/store.
      '';
    };

  };
}
