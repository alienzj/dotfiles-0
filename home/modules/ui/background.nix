{ colorscheme, ... }:
{
  services.random-background = {
    enable = true;
    #imageDirectory = "%h/.dotfiles/home/data/background/${colorscheme.name}";
    #imageDirectory = "%h/.dotfiles/home/data/wallpapers";
    #imageDirectory = "%h/.dotfiles/home/data/wallpapers/${colorscheme.name}";
    imageDirectory = "%h/documents/doraemon/pictures/wallpapers-gitlab";
  };
}
