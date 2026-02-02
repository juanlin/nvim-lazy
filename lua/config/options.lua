local o = vim.opt

o.expandtab = true  -- turn tabs into spaces
o.tabstop = 2       -- display width of a tab
o.shiftwidth = 2    -- indent size for code
o.softtabstop = 2   -- <Tab>/<BS> over indent behavior

o.ignorecase = true
o.smartcase = true
--o.showmatch = true  -- redundant with FileType
--o.incsearch = true  -- default true
--o.hlsearch = true   -- default true

o.number = true
o.relativenumber = true
o.cursorline = true
o.scrolloff = 2

o.splitright = true
o.splitbelow = true

o.shortmess:append{ I = true } -- suppress intro message
