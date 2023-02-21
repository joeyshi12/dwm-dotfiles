#!/bin/sh

DOTFILES_DIR="${HOME}/.dotfiles"

# Install themes, fonts, icons
for asset_type in themes icons; do
    archive_dir="${DOTFILES_DIR}/assets/${asset_type}"
    local_asset_dir="${HOME}/.local/share/${asset_type}"

    mkdir -p ${local_asset_dir}
    for archive in $(ls "${archive_dir}"); do
        tar -xf "${archive_dir}/${archive}" -C "${local_asset_dir}"
    done
done

# Create links
for file in $(ls ${DOTFILES_DIR}/.config); do
    ln -sfn "${DOTFILES_DIR}/.config/${file}" "${HOME}/.config/${file}"
done

for file in .zprofile .zshrc .xinitrc; do
    ln -sfn "${DOTFILES_DIR}/${file}" "${HOME}/${file}"
done

for file in $(ls ${DOTFILES_DIR}/.local/bin); do
    ln -sfn "${DOTFILES_DIR}/.local/bin/${file}" "${HOME}/.local/bin/${file}"
done
