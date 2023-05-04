#!/bin/sh

DOTFILES_DIR="${HOME}/.dotfiles"

# Install themes, fonts, icons
for asset_type in themes icons; do
    archive_dir="${DOTFILES_DIR}/assets/${asset_type}"
    local_asset_dir="${HOME}/.local/share/${asset_type}"

    [ ! -d "${local_asset_dir}" ] && mkdir -p "${local_asset_dir}"
    for archive in ${archive_dir}/*; do
        tar -xf "${archive}" -C "${local_asset_dir}"
    done
done

# Create links
[ ! -d "${HOME}/.config" ] && mkdir -p "${HOME}/.config"
[ ! -d "${HOME}/.local/bin" ] && mkdir -p "${HOME}/.local/bin"

for file in .config/* .local/bin/* .zprofile .zshrc .xinitrc; do
    rm -f "${HOME}/$file"
    ln -sfn "${DOTFILES_DIR}/${file}" "${HOME}/${file}"
done
