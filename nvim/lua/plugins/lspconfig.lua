return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local nvim_lsp = require("lspconfig")

      local protocol = require("vim.lsp.protocol")
      local capabilities = protocol.make_client_capabilities()

      local map = vim.keymap.set
      on_attach = function(_, bufnr)
        local function opts(desc)
          return { buffer = bufnr, desc = "LSP " .. desc }
        end

        map("n", "gi", vim.lsp.buf.implementation, opts "Go to implementation")
        map("n", "<leader>sh", vim.lsp.buf.signature_help, opts "Show signature help")
        map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
        map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")

        map("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts "List workspace folders")

        map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Go to type definition")

        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts "Code action")
        map("n", "gr", vim.lsp.buf.references, opts "Show references")
        map("n", "<leader>lr", vim.lsp.buf.rename, opts "Rename")
      end     --})


      -- setup lsps

      nvim_lsp.pyright.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"python"}
      }

      nvim_lsp.harper_ls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"markdown", "python", "gitcommit"}
      }

      nvim_lsp.ltex.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"plaintex", "tex"},
        settings = {
              ltex = {
                  language = "en-GB",
              },
          }
      }

      --Enable (broadcasting) snippet capability for completion
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      require'lspconfig'.jsonls.setup {
        capabilities = capabilities,
      }
  end,
}
