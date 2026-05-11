#!/usr/bin/env bash
set -euo pipefail

info() { echo -e "\033[1;34m[INFO]\033[0m  $*"; }
success() { echo -e "\033[1;32m[OK]\033[0m    $*"; }
error() {
    echo -e "\033[1;31m[ERROR]\033[0m $*" >&2
    exit 1
}
command_exists() { command -v "$1" &>/dev/null; }

install_stylua() {
    info "Installing stylua..."
    if command_exists stylua; then
        success "stylua already installed"
        return
    fi
    if command_exists pacman; then
        sudo pacman -Syu --noconfirm stylua &&
            success "stylua installed via pacman" &&
            return
    fi
    if command_exists cargo; then
        cargo install stylua &&
            success "stylua installed via cargo" &&
            return
    fi
    error "Neither pacman nor cargo found — cannot install stylua"
}

install_go_formatters() {
    info "Installing goimports..."
    if command_exists goimports; then
        success "goimports already installed"
    else
        if command_exists go; then
            go install golang.org/x/tools/cmd/goimports@latest &&
                success "goimports installed via go install"
        else
            error "go not found — cannot install goimports"
        fi
    fi

    info "Checking gofmt..."
    if command_exists gofmt; then
        success "gofmt already installed (ships with Go)"
    else
        error "gofmt not found — install Go first (pacman -Syu go)"
    fi
}

install_black() {
    info "Installing black..."
    if command_exists black; then
        success "black already installed"
        return
    fi
    if command_exists pacman; then
        sudo pacman -Syu --noconfirm python-black &&
            success "black installed via pacman" &&
            return
    fi
    if command_exists pip; then
        pip install black &&
            success "black installed via pip" &&
            return
    fi
    error "Neither pacman nor pip found — cannot install black"
}

install_prettier() {
    info "Installing prettier..."
    if command_exists prettier; then
        success "prettier already installed"
        return
    fi
    if command_exists npm; then
        npm install -g prettier &&
            success "prettier installed via npm" &&
            return
    fi
    error "npm not found — cannot install prettier"
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

setup_npm_prefix() {
    if [ "$(npm config get prefix)" = "/usr" ]; then
        info "Configuring npm to use ~/.local instead of /usr..."
        mkdir -p "$HOME/.local"
        npm config set prefix "$HOME/.local"
        success "npm prefix set to ~/.local"
    fi
}

setup_npm_prefix
info "Installing formatters..."
install_stylua
install_go_formatters
install_black
install_prettier
install_taplo

echo ""
success "All formatters installed!"