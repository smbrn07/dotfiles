return {
   -- tools
   {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
         library = {
            -- Load luvit types when the `vim.uv` word is found
            { path = "luvit-meta/library", words = { "vim%.uv" } },
         },
      },
   },
   { "Bilal2453/luvit-meta", lazy = true },
   -- lsp servers
   {
      "neovim/nvim-lspconfig",
      -- event = {"BufReadPre", "BufNewFile"},
      dependencies = {
         { "williamboman/mason.nvim", config = true },
         "williamboman/mason-lspconfig.nvim",
         "WhoIsSethDaniel/mason-tool-installer.nvim",

         -- Useful status updates for LSP.
         -- NOTE: `opts = {}` is the smae as calling `require('fidget').setup({})`
         { "j-hui/fidget.nvim",       opts = {} },

         "hrsh7th/cmp-nvim-lsp",
         -- {"antosha417/nvim-lsp-file-operations", config = true},
         -- { "folke/neodev.nvim", opts = {} },

         "hrsh7th/cmp-nvim-lsp",
      },
      config = function()
         -- import lspconfig plugin
         -- local lspconfig = require("lspconfig")
         -- import cmp-nvim-lsp plugin
         -- local cmp_nvim_lsp = require("cmp_nvim_lsp")
         local keymap = vim.keymap -- for conciseness

         vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(event)
               -- NOTE: Remember that Lua is a real programming language, and as such it is possible
               -- to define small helper and utility functions so you don't have to repeat yourself.
               --
               -- In this case, we create a function that lets us more easily define mappings specific
               -- for LSP related items. It sets the mode, buffer and description for us each time.
               local map = function(keys, func, desc)
                  keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
               end

               -- Jump to the definition of the word under your cursor.
               --  This is where a variable was first declared, or where a function is defined, etc.
               --  To jump back, press <C-t>.
               map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

               -- Find references for the word under your cursor.
               map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

               -- Jump to the implementation of the word under your cursor.
               -- Useful when your language has ways of declaring types without an actual implementation.
               map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

               -- Jump to the type of the word under your cursor.
               --  Useful when you're not sure what type a variable is and you want to see
               --  the definition of its *type*, not where it was *defined*.
               map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")

               -- Fuzzy find all the symbols in your current document.
               --  Symbols are things like variables, functions, types, etc.
               map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")

               -- Fuzzy find all the symbols in your current workspace.
               --  Similar to document symbols, except searches over your entire project.
               map(
                  "<leader>ws",
                  require("telescope.builtin").lsp_dynamic_workspace_symbols,
                  "[W]orkspace [S]ymbols"
               )

               -- Rename the variable under your cursor.
               --  Most Language Servers support renaming across files, etc.
               map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

               -- Execute a code action, usually your cursor needs to be on top of an error
               -- or a suggestion from your LSP for this to activate.
               map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

               -- WARN: This is not Goto Definition, this is Goto Declaration.
               --  For example, in C this would take you to the header.
               map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

               -- The following two autocommands are used to highlight references of the
               -- word under your cursor when your cursor rests there for a little while.
               --    See `:help CursorHold` for information about when this is executed
               --
               -- When you move your cursor, the highlights will be cleared (the second autocommand).
               local client = vim.lsp.get_client_by_id(event.data.client_id)
               if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
                  local highlight_augroup =
                      vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
                  vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                     buffer = event.buf,
                     group = highlight_augroup,
                     callback = vim.lsp.buf.document_highlight,
                  })

                  vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                     buffer = event.buf,
                     group = highlight_augroup,
                     callback = vim.lsp.buf.clear_references,
                  })

                  vim.api.nvim_create_autocmd("LspDetach", {
                     group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
                     callback = function(event2)
                        vim.lsp.buf.clear_references()
                        vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
                     end,
                  })
               end

               -- The following code creates a keymap to toggle inlay hints in your
               -- code, if the language server you are using supports them
               --
               -- This may be unwanted, since they displace some of your code
               if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
                  map("<leader>th", function()
                     vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
                  end, "[T]oggle Inlay [H]ints")
               end
            end,
         })

         -- Change the Diagnostic symbols in the sign column (gutter)
         local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
         for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
         end

         -- used to enable autocompletion (assign to every lsp server config)
         local capabilities = vim.lsp.protocol.make_client_capabilities()
         capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

         local servers = {
            lua_ls = {
               -- cmd = {...},
               -- filetypes = {...},
               capabilities = {},
               settings = {
                  Lua = {
                     completion = {
                        callSnippet = "Replace",
                     },
                  },
               },
            },

            clangd = {
               capabilities = {},
               settings = {},
            },
         }

         require("mason").setup()

         local ensure_installed = vim.tbl_keys(servers or {})
         vim.list_extend(ensure_installed, {
            "stylua",
         })
         require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

         require("mason-lspconfig").setup({
            handlers = {
               function(server_name)
                  local server = servers[server_name] or {}
                  server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
                  require("lspconfig")[server_name].setup(server)
               end,
            },
         })

         -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
         -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
         -- vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
      end,
   },
}
