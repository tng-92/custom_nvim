-- Custom :ConcealLevel command to adjust conceal level per buffer
vim.api.nvim_create_user_command("ConcealLevel", function(opts)
  local level = tonumber(opts.args)
  if level then
    vim.wo.conceallevel = level
    print("Conceal level set to " .. level)
  else
    print("Usage: :ConcealLevel [0|1|2|3]")
  end
end, { nargs = 1 })
