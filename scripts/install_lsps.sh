#!/usr/bin/env bash
set -euo pipefail

info() { echo -e "\033[1;34m[INFO]\033[0m  $*"; }
success() { echo -e "\033[1;32m[OK]\033[0m    $*"; }
error() {
    echo -e "\033[1;31m[ERROR]\033[0m $*" >&2
    exit 1
}
command_exists() { command -v "$1" &>/dev/null; }

install_bashls() {
    info "Installing bash-language-server..."
    if command_exists bash-language-server; then
        success "bash-language-server already installed"
        return
    fi
    if command_exists npm; then
        npm install -g bash-language-server &&
            success "bash-language-server installed via npm" &&
            return
    fi
    error "npm not found — cannot install bash-language-server"
}

install_clangd() {
    info "Installing clangd..."
    if command_exists clangd; then
        success "clangd already installed"
        return
    fi
    sudo pacman -Syu --noconfirm clang &&
        success "clangd installed via pacman"
}

install_cmake_ls() {
    info "Installing cmake-language-server..."
    if command_exists cmake-language-server; then
        success "cmake-language-server already installed"
        return
    fi
    if command_exists pip; then
        pip install cmake-language-server &&
            success "cmake-language-server installed via pip" &&
            return
    fi
    error "pip not found — cannot install cmake-language-server"
}

install_gopls() {
    info "Installing gopls..."
    if command_exists gopls; then
        success "gopls already installed"
        return
    fi
    if command_exists pacman; then
        sudo pacman -Syu --noconfirm gopls &&
            success "gopls installed via pacman" &&
            return
    fi
    if command_exists go; then
        go install golang.org/x/tools/gopls@latest &&
            success "gopls installed via go install" &&
            return
    fi
    error "Neither pacman nor go found — cannot install gopls"
}

install_jsonls() {
    info "Installing vscode-langservers-extracted (jsonls)..."
    if command_exists vscode-json-language-server; then
        success "jsonls already installed"
        return
    fi
    if command_exists npm; then
        npm install -g vscode-langservers-extracted &&
            success "jsonls installed via npm" &&
            return
    fi
    error "npm not found — cannot install jsonls"
}

install_lua_ls() {
    info "Installing lua-language-server..."
    if command_exists lua-language-server; then
        success "lua-language-server already installed"
        return
    fi
    sudo pacman -Syu --noconfirm lua-language-server &&
        success "lua-language-server installed via pacman"
}

install_pyright() {
    info "Installing pyright..."
    if command_exists pyright; then
        success "pyright already installed"
        return
    fi
    if command_exists pacman; then
        sudo pacman -Syu --noconfirm pyright &&
            success "pyright installed via pacman" &&
            return
    fi
    if command_exists npm; then
        npm install -g pyright &&
            success "pyright installed via npm" &&
            return
    fi
    error "Neither pacman nor npm found — cannot install pyright"
}

install_rust_analyzer() {
    info "Installing rust-analyzer..."
    if command_exists rust-analyzer; then
        success "rust-analyzer already installed"
        return
    fi
    if command_exists pacman; then
        sudo pacman -Syu --noconfirm rust-analyzer &&
            success "rust-analyzer installed via pacman" &&
            return
    fi
    if command_exists rustup; then
        rustup component add rust-analyzer &&
            success "rust-analyzer installed via rustup" &&
            return
    fi
    error "Neither pacman nor rustup found — cannot install rust-analyzer"
}

install_taplo() {
    info "Installing taplo..."
    if command_exists taplo; then
        success "taplo already installed"
        return
    fi
    if command_exists cargo; then
        cargo install taplo-cli &&
            success "taplo installed via cargo" &&
            return
    fi
    error "cargo not found — cannot install taplo"
}

install_yamlls() {
    info "Installing yaml-language-server..."
    if command_exists yaml-language-server; then
        success "yaml-language-server already installed"
        return
    fi
    if command_exists npm; then
        npm install -g yaml-language-server &&
            success "yaml-language-server installed via npm" &&
            return
    fi
    error "npm not found — cannot install yaml-language-server"
}

setup_npm_prefix() {
    if [ "$(npm config get prefix)" = "/usr" ]; then
        info "Configuring npm to use ~/.local instead of /usr..."
        mkdir -p "$HOME/.local"
        npm config set prefix "$HOME/.local"
        success "npm prefix set to ~/.local"
    fi
}

setup_npm_prefix
info "Installing LSPs..."
install_bashls
install_clangd
install_cmake_ls
install_gopls
install_jsonls
install_lua_ls
install_pyright
install_rust_analyzer
install_taplo
install_yamlls

echo ""
success "All LSPs installed!"
