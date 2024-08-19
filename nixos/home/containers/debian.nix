{ config, pkgs, lib, ...}:

{
  config.virtualisation.oci-containers.containers = {
     debian = {
       image = "debian:latest";
       ports = [
        
       ];
       cmd = [
       ];
     };
   };
}