{
  pkgs ? import <nixpkgs> { config.allowUnfree = true; },
  extraPkgs ? []
}:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    gcc-arm-embedded-10
    nrf5-sdk
    zlib
    cmake
    gcc10
    adafruit-nrfutil
    (python3.withPackages(python: [
      python.cbor
      python.intelhex
      python.click
      python.cryptography
      python.imgtool
      python.pillow
    ]))
    nodePackages.lv_font_conv
  ] ++ extraPkgs;
}
