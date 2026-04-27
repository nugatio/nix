{ lib, ... }: {
  imports = lib.filter
    (path:
      let
        pathStr = toString path;
      in
        lib.hasSuffix ".nix" pathStr
        && baseNameOf pathStr != "default.nix"
    )
    (lib.filesystem.listFilesRecursive ./.);
}
