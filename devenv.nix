{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
let
  inherit (inputs) githooks;
in
{
  imports = [
    githooks.modules.default
  ];

  custom.git-hooks = {
    forge-fmt.enable = true;
  };
  # https://devenv.sh/packages/
  packages = with pkgs; [
    claude-code
  ];

  # https://devenv.sh/languages/
  languages.solidity.enable = true;
  languages.solidity.foundry.enable = true;

  enterShell = ''
    forge --version
  '';

  # https://devenv.sh/git-hooks/
  git-hooks.hooks = { };

  # See full reference at https://devenv.sh/reference/options/
}
