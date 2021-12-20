#!/usr/bin/env sh
set -e

echo "Installing NVM $NVM_VERSION"
unset NPM_CONFIG_PREFIX
export NVM_DIR="$PLATFORM_APP_DIR/.nvm"
# install.sh will automatically install NodeJS based on the presence of $NODE_VERSION
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/$NVM_VERSION/install.sh | bash
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# we install the bundled bundler version and fallback to a default (in env vars above)
export BUNDLER_VERSION="$(grep -A 1 "BUNDLED WITH" Gemfile.lock | tail -n 1)" || $DEFAULT_BUNDLER_VERSION
echo "Install bundler $BUNDLER_VERSION"
gem install --no-document bundler -v $BUNDLER_VERSION

echo "Installing gems"
# We copy the bundle directory to the Platform.sh cache directory for
# safe keeping, then restore from there on the next build. That allows
# bundler to skip downloading code it doesn't need to.
[ -d "$PLATFORM_CACHE_DIR/bundle" ] && \
  rsync -az --delete "$PLATFORM_CACHE_DIR/bundle/" vendor/bundle/
mkdir -p "$PLATFORM_CACHE_DIR/bundle"
bundle install
# synchronize updated cache for next build
rsync -az --delete vendor/bundle/ "$PLATFORM_CACHE_DIR/bundle/"

# precompile assets
echo "Precompiling assets"
# We copy the webpacker directory to the Platform.sh cache directory for
# safe keeping, then restore from there on the next build. That allows
# bundler to skip downloading code it doesn't need to.
mkdir -p "$PLATFORM_CACHE_DIR/webpacker"
mkdir -p "$RAILS_TMP/cache/webpacker"
[ -d "$PLATFORM_CACHE_DIR/webpacker" ] && \
  rsync -az --delete "$PLATFORM_CACHE_DIR/webpacker/" $RAILS_TMP/cache/webpacker/
# We dont need secret here https://github.com/rails/rails/issues/32947
SECRET_KEY_BASE=1 bundle exec rails assets:precompile
rsync -az --delete $RAILS_TMP/cache/webpacker/ "$PLATFORM_CACHE_DIR/webpacker/"
