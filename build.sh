# Inspired heavily by Spree's build.sh. Thanks, Spree! You rock.
set_gemfile() {
  export BUNDLE_GEMFILE="`pwd`/Gemfile"
}

export PROJECT_ROOT_DIR=`pwd`
export BUILD_DIRS="core delivery/rails"

for dir in $BUILD_DIRS

do
  cd "$PROJECT_ROOT_DIR/$dir"
  set_gemfile
  bundle install
  bundle exec rspec spec
done
