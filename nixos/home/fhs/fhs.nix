{ pkgs, ... }:

{
  environment = {
    sessionVariables = {
      LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib";
    };
  };

  environment.systemPackages = with pkgs; [
    (pkgs.buildFHSUserEnv {
      name = "codingfhs";
      runScript = "bash";
      targetPkgs =
        pkgs: with pkgs; [
          autoconf
          automake
          bash
          binutils
          bison
          busybox
          cmake
          cpio
          elfutils
          ffmpeg-full
          flex
          fontforge
          gcc
          gcc_multi
          git
          glibc
          gnumake
          libgcc
          libgccjit
          libiconv
          libtool
          makeWrapper
          meson
          ninja
          pkg-config
          python3Full
          readline
          stdenv.cc
          stdenv.cc.cc.lib
          zlib
        ];
      # buildInputs = [
      #   autoconf
      #   automake
      #   binutils
      #   bison
      #   busybox
      #   elfutils
      #   ffmpeg-full
      #   flex
      #   fontforge
      #   gcc
      #   gcc_multi
      #   git
      #   glibc
      #   gnumake
      #   libgcc
      #   libgccjit
      #   libiconv
      #   libtool
      #   makeWrapper
      #   pkg-config
      #   python310Full
      #   readline
      #   stdenv.cc.cc.lib
      #   zlib
      # ];
    })
  ];
}
