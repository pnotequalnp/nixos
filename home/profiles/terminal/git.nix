{
  enable = true;
  userName = "Kevin Mullins";
  userEmail = "kevin@pnotequalnp.com";

  aliases = {
    graph =
      "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) %C(white)[%G?]%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all";
    full-graph =
      "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) %C(white)[%G?]%C(reset) - %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all";
  };

  ignores = [ ".direnv/" ".vscode/" ".envrc" "result/" "result" ];

  extraConfig = {
    pull = {
      ff = "only";
      rebase = true;
    };
    init.defaultBranch = "main";
    github.user = "pnotequalnp";
    tag.gpgSign = true;
    diff.tool = "nvimdiff";
    difftool.prompt = true;
    "difftool \"nvimdiff\"".cmd = "nvim -Rd $LOCAL $REMOTE";
    merge.tool = "nvimdiff";
    mergetool.keepBackup = false;
    "mergetool \"nvimdiff\"".cmd = "nvim -c Gvdiffsplit! $MERGED";
  };

  signing = {
    signByDefault = true;
    key = "361820A45DB41E9A";
  };
}
