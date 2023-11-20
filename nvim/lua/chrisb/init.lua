require("chrisb.remap")
require("chrisb.set")

-- Enable clipboard integration
if vim.fn.has('clipboard') then
        vim.opt.clipboard:append('unnamedplus')
end
