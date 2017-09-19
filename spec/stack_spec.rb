describe "d3 - stack" do
  it "d3.stack" do
    expect(D3.stack).to be_instance_of(D3::StackGenerator)
  end
end

__END__

d3.stack - create a new stack generator.
stack - generate a stack for the given dataset.
stack.keys - set the keys accessor.
stack.value - set the value accessor.
stack.order - set the order accessor.
stack.offset - set the offset accessor.
d3.stackOrderAscending - put the smallest series on bottom.
d3.stackOrderDescending - put the largest series on bottom.
d3.stackOrderInsideOut - put larger series in the middle.
d3.stackOrderNone - use the given series order.
d3.stackOrderReverse - use the reverse of the given series order.
d3.stackOffsetExpand - normalize the baseline to zero and topline to one.
d3.stackOffsetNone - apply a zero baseline.
d3.stackOffsetSilhouette - center the streamgraph around zero.
d3.stackOffsetWiggle - minimize streamgraph wiggling.
