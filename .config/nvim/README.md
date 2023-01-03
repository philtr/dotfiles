# Neovim Configuration

- Plugins managed by :zzz: [Lazy.nvim]
- Language Server:
  - Easy configuration with :zero: [LSP Zero]
  - Packages installed by :package: [mason.nvim]
  - Additional tools provided by :no_entry: [null-ls.nvim]

[Lazy.nvim]: https://github.com/folke/lazy.nvim
[LSP Zero]: https://github.com/VonHeikemen/lsp-zero.nvim
[mason.nvim]: https://github.com/williamboman/mason.nvim
[null-ls.nvim]: https://github.com/jose-elias-alvarez/null-ls.nvim


## :open_file_folder: Directory Structure

- [:page_facing_up: init.lua](./init.lua) - Neovim config entrypoint (very minimal)
- [:open_file_folder: config](./lua/config)
  - [:page_facing_up: init.lua](./lua/config/init.lua) - Configuration entrypoint (also very minimal)
  - [:page_facing_up: options.lua](./lua/config/options.lua) - Basic editor configuration (like `mapleader` and `wrap`)
  - [:page_facing_up: lazy.lua](./lua/config/lazy.lua) - Lazy.nvim bootstrap and configuration
  - [:file_folder: plugins](./lua/config/plugins) - Lazy.nvim plugins directory
