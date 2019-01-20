/*

   This service-level bind mounts the host store into the container
   when the service.useHostStore option is set to true.

 */
{ lib, config, ... }:
let
  inherit (lib) mkOption types mkIf;
in
{
  options = {
    service.useHostStore = mkOption {
      type = types.bool;
      default = false;
      description = "Bind mounts the host store if enabled, avoiding copying.";
    };
  };
  config = mkIf config.service.useHostStore {
    service.image = "arion-base";
    service.build.context = "${../arion-image}";
    service.volumes = [
      "/nix/store:/nix/store"
      "/bin/sh:/bin/sh"
      "/usr/bin/env:/usr/bin/env"
    ];
  };
}
