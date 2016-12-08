describe "D3 coverage" do
  # Test code is here because opal-repl doesn't support aggregate_failures mode
  native_methods = `Opal.hash(window.d3)`.keys.sort
  nice_methods = native_methods.map{|m| m.gsub(/([a-z])(?=[A-Z0-9])/, "\\1_").downcase }

  # format conflict with base ruby
  nice_methods.each do |method|
    it method do
      if D3.respond_to?(method)
        # OK
      else
        skip "not implemented yet"
      end
    end
  end
end
