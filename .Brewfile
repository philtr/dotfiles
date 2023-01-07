home = ENV["DOTFILES_HOME"] || ENV["HOME"]
xdgc = ENV["XDG_CONFIG"] || "#{home}/.config"

def brewfile(filename)
  eval(IO.read(filename), binding)
end

# first load the main Brewfile
brewfile("#{xdgc}/homebrew/Brewfile")

# then load additional Brewfiles
Dir.glob("#{xdgc}/homebrew/Brewfile.*").each do |brewfile|
  brewfile(brewfile)
end
