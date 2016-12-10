if RUBY_ENGINE == 'opal'
  require_relative "opal/d3"
else
  require "opal"
  require_relative "opal/d3/version"

  # This seems to be needed by sprockets somehow
  Opal.append_path __dir__.untaint
end
