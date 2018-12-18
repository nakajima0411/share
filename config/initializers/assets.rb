# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
Refile.secret_key = 'f7d2f8182dc1cc0d7bc68179b9987314477e720b24d52557916afdf27185f2965ede5b1d62ee273e9bbfdf764235081b5bdc0b85f453fa47e87d8be0f4e317ca'