{ config, pkgs, ... }:

let
  containerName = "ollama";
  imageName = "ollama/ollama";
in
{
  virtualisation.oci-containers = {
    backend = "podman"; # or "docker", depending on your preference
    containers = {
      ${containerName} = {
        image = imageName;
        ports = [ "11434:11434" ];
        environment = {
          # Add any necessary environment variables here
        };
        volumes = [
          "ollama:/root/.ollama" # Ensure the host path is correct
        ];
      };
      open-webui = {
        autoStart = true;
        image = "ghcr.io/open-webui/open-webui";
        ports = [ "3000:8080" ];
        # TODO figure out how to create the data directory declaratively
        # volumes = [ "${config.users.users.dave.home}/open-webui:/app/backend/data" ];
        #       extraOptions =
        #         [ "--network=host" "--add-host=host.containers.internal:host-gateway" ];
        environment = {
          OLLAMA_API_BASE_URL = "http://127.0.0.1:11434/api";
        };
      };
    };
    # systemd.services.podman-ollama.serviceConfig.User = "dave";
  };
}
