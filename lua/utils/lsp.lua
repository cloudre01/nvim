local M = {}

local timeout = 1000 -- 1 secs

-- Utility function to create a Neovim command
function M.create_command(name, fn)
  local command_completion = {
    nargs = "?",
    complete = function()
      return { "sync" }
    end,
  }
  vim.api.nvim_create_user_command(name, fn, command_completion)
end

-- Function to go to source definition (or other LSP methods)
function M.go_to_lsp_method(is_sync, method, client, bufnr)
  local params = vim.lsp.util.make_position_params()

  params.context = { source_definition = true }

  if is_sync then
    local res = vim.lsp.buf_request_sync(0, method, params, timeout)
    if client == nil then
      return
    end
    local typescript_client_res = res[client.id]
    local context = {
      method = method,
      client_id = client.id,
      bufnr = bufnr,
      params = params,
    }
    if not typescript_client_res.err then
      vim.lsp.handlers[method](
        typescript_client_res.err,
        typescript_client_res.result,
        context
      )
    end
  else
    vim.lsp.buf_request(0, method, params, function(err, result, context)
      if not err then
        vim.lsp.handlers[method](err, result, context)
      end
    end)
  end
end

return M
