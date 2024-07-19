local M = {}
function M.makeScratch()
  vim.cmd("enew")
  vim.bo[0].buftype = nofile
  vim.bo[0].bufhidden = hide
  vim.bo[0].swapfile = false
end
return M
