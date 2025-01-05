{pkgs, ...}: let
  inherit (builtins) attrValues;

  nvfetcher = builtins.mapAttrs (name: value:
    pkgs.vimUtils.buildVimPlugin {
      inherit name;
      inherit (value) src;
    }) (pkgs.callPackages ./_sources/generated.nix {});

  luatheme = ''vim.cmd[colorscheme catppuccin-mocha]'';
  lua = pkgs.writeText "init.lua" (luatheme + builtins.readFile ./init.lua);

  neovimConfig = pkgs.neovimUtils.makeNeovimConfig {
    withPython3 = false;
    withRuby = false;
    withNodeJs = false;
    customRC = ''
      source ${./init.vim}
      :luafile ${lua}
    '';

    plugins =
      (attrValues nvfetcher)
      ++ (attrValues {
        inherit
          (pkgs.vimPlugins)
          lualine-nvim
          nvim-web-devicons
          gitsigns-nvim
          vim-fugitive
          indent-blankline-nvim-lua
          nvim-autopairs
          neoformat
          comment-nvim
          nvim-colorizer-lua
          which-key-nvim
          undotree
          vim-speeddating
          luasnip
          vim-startuptime
          telescope-nvim
          harpoon
          alpha-nvim
          zen-mode-nvim
          sniprun
          vim-table-mode
          trouble-nvim
          nvim-cokeline
          fidget-nvim
          nvim-notify
          # Language support
          nvim-lspconfig
          nvim-cmp
          friendly-snippets
          cmp-cmdline
          cmp-nvim-lsp
          cmp-buffer
          cmp-path
          nui-nvim
          plenary-nvim
          ;
      })
      ++ [
        pkgs.vimPlugins.nvim-treesitter.withAllGrammars
      ];
  };
in
  pkgs.symlinkJoin {
    name = "nvim-wrapped";
    paths =
      [
        (pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped neovimConfig)

        pkgs.nodePackages.typescript-language-server
      ]
      ++ attrValues {
        inherit
          (pkgs)
          gopls
          prettierd
          go
          python3
          nil
          rust-analyzer
          alejandra
          vscode-langservers-extracted
          emmet-language-server
          bash-language-server
          zls
          gleam
          clang-tools
          shellcheck
          cargo
          cargo-tauri
          trunk
          nixd
          stylua
          # required for my goofy ahh plugin :3
          libsixel
          ;
      };
  }
