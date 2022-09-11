{ colorscheme, ... }:
{
  services.random-background = {
    enable = true;
    imageDirectory = "%h/.dotfiles/home/data/background/${colorscheme.name}";
  };
}
