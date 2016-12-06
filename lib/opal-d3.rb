if RUBY_ENGINE == 'opal'
  require_relative "opal/d3"
else
  require "opal"
  require_relative "opal/d3/version"
end
