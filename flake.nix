{
  description = "🐈 My personal Neovim configuration with nixCats and extra cats! 🐼";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixCats.url = "github:BirdeeHub/nixCats-nvim";

    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
    };

    prisma-language-tools = {
      url = "github:prisma/language-tools";
    };

    blink = {
      url = "github:Saghen/blink.cmp";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };

    "plugins-npm-info.nvim" = {
      url = "github:pxnditxyr/npm-info.nvim";
      flake = false;
    };

    "plugins-nvim-notify" = {
      url = "github:rcarriga/nvim-notify";
      flake = false;
    };

    "plugins-multicursor-nvim" = {
      url = "github:jake-stewart/multicursor.nvim";
      flake = false;
    };

    # "plugins-copilot.lua" = {
    #   url = "github:zbirenbaum/copilot.lua";
    #   flake = false;
    # };

    "plugins-snacks.nvim" = {
      url = "github:folke/snacks.nvim";
      flake = false;
    };

    "plugins-luasnip" = {
      url = "github:L3MON4D3/LuaSnip";
      flake = false;
    };

    # "plugins-avante.nvim" = {
    #   url = "github:yetone/avante.nvim";
    #   flake = false;
    # };

    "plugins-gitsigns.nvim" = {
      url = "github:lewis6991/gitsigns.nvim";
      flake = false;
    };

    "plugins-oil.nvim" = {
      url = "github:stevearc/oil.nvim";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, nixCats, ... }@inputs: let
    inherit (nixCats) utils;
    luaPath = "${./.}";
    forEachSystem = utils.eachSystem nixpkgs.lib.platforms.all;
    # import nixpkgs { config = extra_pkg_config; inherit system; }
    extra_pkg_config = {
      allowUnfree = true;
    };

    dependencyOverlays = /* (import ./overlays inputs) ++ */ [
      # This overlay grabs all the inputs named in the format
      # `plugins-<pluginName>`
      # Once we add this overlay to our nixpkgs, we are able to
      # use `pkgs.neovimPlugins`, which is a set of our plugins.
      # (utils.standardPluginOverlay inputs)
      (utils.sanitizedPluginOverlay inputs)
      # add any other flake overlays here.

      # when other people mess up their overlays by wrapping them with system,
      #      # This is for plugins that will load at startup without using packadd: you may instead call this function on their overlay.
      # it will check if it has the system in the set, and if so return the desired overlay
      # (utils.fixSystemizedOverlay inputs.codeium.overlays
      #   (system: inputs.codeium.overlays.${system}.default)
      # )
    ];

    categoryDefinitions = { pkgs, settings, categories, extra, name, mkNvimPlugin, ... }@packageDef: {
      lspsAndRuntimeDeps = {

        general = with pkgs; [
          lua-language-server
          typescript-language-server
          angular-language-server
          pyright
          nixd
          yaml-language-server
          tailwindcss-language-server
          astro-language-server
          svelte-language-server
          dart
          vscode-langservers-extracted
          deno
          phpactor
          # (inputs.prisma-language-tools.packages.${pkgs.system}.prisma-language-server)

          typescript
          fzf
          ripgrep

          # psql
          postgresql
          mysql-client
        ];
      };

      startupPlugins = {
        # gitPlugins = with pkgs.neovimPlugins; [ ];
        general = with pkgs.vimPlugins; [
          vim-surround
          pkgs.neovimPlugins.snacks-nvim
          ultimate-autopair-nvim
          nvim-highlight-colors
          (pkgs.neovimPlugins.multicursor-nvim.overrideAttrs {pname = "multicursor.nvim";})
        ];

        lsp = with pkgs.vimPlugins; [
          fidget-nvim
          lazydev-nvim
        ];

        syntax = with pkgs.vimPlugins; [
          nvim-treesitter.withAllGrammars
          rainbow-delimiters-nvim
          nvim-ts-autotag
          nvim-treesitter-context
          todo-comments-nvim
          ts-comments-nvim
        ];

        file-manager = with pkgs.vimPlugins; [
          # oil-nvim
          pkgs.neovimPlugins.oil-nvim
          mini-icons
        ];

        completion = with pkgs.vimPlugins; [
          (inputs.blink.packages.${ pkgs.system }.blink-cmp.overrideAttrs { pname = "blink.cmp"; })
          blink-compat
          blink-emoji-nvim
          # luasnip
          pkgs.neovimPlugins.luasnip
          friendly-snippets
        ];

        ui = with pkgs.vimPlugins; [
          lualine-nvim
          tokyonight-nvim
          mini-icons
          pkgs.neovimPlugins.nvim-notify
        ];

        ai = with pkgs.vimPlugins; [
          supermaven-nvim

          # pkgs.neovimPlugins.avante-nvim
          avante-nvim
          # pkgs.neovimPlugins.copilot-lua
          copilot-lua
          nvim-treesitter
          dressing-nvim
          plenary-nvim
          nui-nvim
          img-clip-nvim
          render-markdown-nvim
        ];

        git = with pkgs.vimPlugins; [
          neogit
          plenary-nvim
          diffview-nvim
          # gitsigns-nvim
          pkgs.neovimPlugins.gitsigns-nvim
          fzf-lua
        ];

        db-client = with pkgs.vimPlugins; [
          vim-dadbod-ui
          vim-dadbod
          vim-dadbod-completion
        ];

        http = with pkgs.vimPlugins; [
          kulala-nvim
        ];

        javascript = with pkgs.vimPlugins; [
          pkgs.neovimPlugins.npm-info-nvim
        ];
      };

      optionalPlugins = {
        # gitPlugins = with pkgs.neovimPlugins; [ ];
        # general = with pkgs.vimPlugins; [ ];
      };

      sharedLibraries = {
        # general = with pkgs; [
        #   # libgit2
        # ];
      };

      environmentVariables = {
        test = {
          CATTESTVAR = "It worked!";
        };
      };

      extraWrapperArgs = {
        test = [
          '' --set CATTESTVAR2 "It worked again!"''
        ];
      };

      extraPython3Packages = {
        test = (_:[]);
      };

      extraLuaPackages = {
        test = [ (_:[]) ];
      };
    };



    # see :help nixCats.flake.outputs.packageDefinitions
    packageDefinitions = {
      neocats = {pkgs , ... }: {
        settings = {
          wrapRc = true;
          aliases = [ "vim" ];
          neovim-unwrapped = inputs.neovim-nightly-overlay.packages.${pkgs.system}.neovim;
        };
        categories = {
          general = true;

          lsp = true;
          syntax = true;
          file-manager = true;
          completion = true;
          git = true;

          ui = true;
          ai = true;

          db-client = true;
          http = true;

          javascript = true;

          # gitPlugins = true;
          customPlugins = true;
          test = true;
          example = {
            youCan = "add more than just booleans";
            toThisSet = [
              "and the contents of this categories set"
              "will be accessible to your lua with"
              "nixCats('path.to.value')"
              "see :help nixCats"
            ];
          };
        };
      };
    };
    defaultPackageName = "neocats";
  in

  forEachSystem (system: let
    nixCatsBuilder = utils.baseBuilder luaPath {
      inherit nixpkgs system dependencyOverlays extra_pkg_config;
    } categoryDefinitions packageDefinitions;
    defaultPackage = nixCatsBuilder defaultPackageName;
    pkgs = import nixpkgs { inherit system; };
  in
  {

    packages = utils.mkAllWithDefault defaultPackage;

    devShells = {
      default = pkgs.mkShell {
        name = defaultPackageName;
        packages = [ defaultPackage ];
        inputsFrom = [ ];
        shellHook = ''
        '';
      };
    };

  }) // (let
    nixosModule = utils.mkNixosModules {
      inherit defaultPackageName dependencyOverlays luaPath
        categoryDefinitions packageDefinitions extra_pkg_config nixpkgs;
    };
    homeModule = utils.mkHomeModules {
      inherit defaultPackageName dependencyOverlays luaPath
        categoryDefinitions packageDefinitions extra_pkg_config nixpkgs;
    };
  in {

    overlays = utils.makeOverlays luaPath {
      inherit nixpkgs dependencyOverlays extra_pkg_config;
    } categoryDefinitions packageDefinitions defaultPackageName;

    nixosModules.default = nixosModule;
    homeModules.default = homeModule;

    inherit utils nixosModule homeModule;
    inherit (utils) templates;
  });

}
