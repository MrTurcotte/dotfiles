self: super: {
  stdenv = super.withCFlags [
    "-march=native -mtune=native -O3"
  ] super.stdenv // {
    CXXFLAGS = "${super.stdenv.lib.concatStringsSep " " [
      "-march=native"
      "-mtune=native"
      "-O3"
    ]}";
  };
}


# ./overlays/cflags.nix

  # self: super: {
  #     stdenv = super.withCFlags ["-march=native -mtune=native -O3"] super.stdenv;
  #   }

# ./overlays/cflags.nix

# self: super: {
#   stdenv = super.stdenv.overrideAttrs (oldAttrs: {
#     NIX_CFLAGS_COMPILE = "${oldAttrs.NIX_CFLAGS_COMPILE or ""} -O3 -march=native -mtune=native";
#     NIX_CXXFLAGS_COMPILE = "${oldAttrs.NIX_CXXFLAGS_COMPILE or ""} -O3 -march=native -mtune=native";
#   });
# }



# # ./overlays/cflags.nix

# self: super: {
#   stdenv = super.stdenv.override {
#     impureOptimizations = {
#       inherit (super.stdenv.impureOptimizations) mkDerivation;
#       CFLAGS = "${super.stdenv.impureOptimizations.CFLAGS} -O3";
#       CXXFLAGS = "${super.stdenv.impureOptimizations.CXXFLAGS} -O3";
#     };
#   };
# }


# # ./overlays/cflags.nix

# self: super: {
#   stdenv = super.stdenv.override {
#     impureFlags = [
#       "-O3"
#     ];

#     impureOptimizations = {
#       inherit (super.stdenv.impureOptimizations) mkDerivation;
#       CFLAGS = "${super.stdenv.impureOptimizations.CFLAGS} ${lib.concatStringsSep " " impureFlags}";
#       CXXFLAGS = "${super.stdenv.impureOptimizations.CXXFLAGS} ${lib.concatStringsSep " " impureFlags}";
#     };
#   };
# }



# # ./overlays/cflags.nix

# # self: super: {
# #   stdenv = super.stdenv.override {
# #     CFLAGS = "-march=native -mtune=native -O3 ${super.stdenv.cc.libcFlags}";
# #     CXXFLAGS = "-march=native -mtune=native -O3 ${super.stdenv.cxx.libcFlags}";
# #   };
# # }



# self: super: {
#         stdenv = super.impureUseNativeOptimizations super.stdenv;
# }


# # self: super: {
# #   stdenv = super.stdenv.overrideAttrs (oldAttrs: {
# #     CC = "${super.cc}";
# #     CXX = "${super.cxx}";
# #     CFLAGS = "${oldAttrs.CFLAGS or ""} -march=native -mtune=native -O2";
# #     CXXFLAGS = "${oldAttrs.CXXFLAGS or ""} -march=native -mtune=native -O2";
# #   });
# # }
