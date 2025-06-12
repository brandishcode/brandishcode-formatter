{ pkgs, ... }:

{
  settings.verbose = 1;
  projectRootFile = "flake.nix";
  programs.nixfmt.enable = true;
  programs.stylua = {
    enable = true;
    settings = {
      column_width = 100;
      line_endings = "Unix";
      indent_type = "Spaces";
      indent_width = 2;
      quote_style = "AutoPreferSingle";
      call_parentheses = "Input";
    };
  };
}
