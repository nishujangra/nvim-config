require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { "go", "rust", "python", "cpp", "javascript", "typescript",
    "perl", "lua", "markdown", "markdown_inline", "sql", "html", "vim", "vimdoc" },

  sync_install = false,
  auto_install = true,

  ignore_install = { }, -- can skip any language installation

  highlight = {
    enable = true,
    disable = function(lang, buf)
      local max_filesize = 1 * 1024 * 1024 -- 1 MB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
    additional_vim_regex_highlighting = false,
  },

  indent = {
      enable = true
  },

  -- auto tage (for html, jsx, tsx)
  autotag = {
      enable = true
  }
}
