{ ... }:

{

  virtualisation.oci-containers.containers.whoogle = {                                                                                                                                                                                                                                      
    image = "benbusby/whoogle-search";                                                                                                                                                                                                                                                      
    ports = [ "0.0.0.0:5000:5000" ];                                                                                                                                                                                                                                                        
  };
}
