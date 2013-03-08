#!/bin/bash
# Inspired heavily by Spree's build.sh. Thanks, Spree! You rock.
set_gemfile() {
  export BUNDLE_GEMFILE="`pwd`/Gemfile"
}

export PROJECT_ROOT_DIR=`pwd`
export BUILD_DIRS="core delivery/backend"

for dir in $BUILD_DIRS

do
  cd "$PROJECT_ROOT_DIR/$dir"
  set_gemfile
  if [[ "$BUNDLE" == "true" ]] ; then bundle ; fi
  bundle exec rspec spec
done
