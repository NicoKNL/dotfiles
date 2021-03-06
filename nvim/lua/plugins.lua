local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
end

function plugins()
    use "wbthomason/packer.nvim"
    use "preservim/nerdtree"
    use "preservim/nerdcommenter"
    use "vim-airline/vim-airline"
    use "tpope/vim-fugitive"
    use "joshdick/onedark.vim"
    use "sheerun/vim-polyglot"
    use "kyazdani42/nvim-web-devicons"
    use {
            "nvim-telescope/telescope.nvim",
            requires = {
                {"nvim-lua/popup.nvim"},
                {"nvim-lua/plenary.nvim"}
            }
        }
    use "neovim/nvim-lspconfig"
end

return require("packer").startup(plugins)
