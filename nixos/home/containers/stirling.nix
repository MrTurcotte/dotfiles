 { config, pkgs, ... }:
 {
    config.virtualisation.oci-containers.containers = {
     stirling = {
       image = "frooodle/s-pdf:latest";
       ports = ["8080:8080"];
       cmd = [
       ];
       autoStart = false;
     };
   };
 }
