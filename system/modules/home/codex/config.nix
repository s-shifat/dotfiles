{ config, ... }:

let
  codexConfigDir =
    "${config.home.homeDirectory}/dotfiles/system/modules/home/codex/config";
in
{
  # Live-editable Codex profile managed from the dotfiles repository.
  home.file.".codex/default.config.toml".source =
    config.lib.file.mkOutOfStoreSymlink
      "${codexConfigDir}/default.config.toml";

  # Global Codex instructions.
  home.file.".codex/AGENTS.md".source =
    config.lib.file.mkOutOfStoreSymlink
      "${codexConfigDir}/AGENTS.md";

  # Optional global instruction override.
  home.file.".codex/AGENTS.override.md".source =
    config.lib.file.mkOutOfStoreSymlink
      "${codexConfigDir}/AGENTS.override.md";

  # User-managed Codex skills.
  home.file.".agents/skills".source =
    config.lib.file.mkOutOfStoreSymlink
      "${codexConfigDir}/skills";
}
