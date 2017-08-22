describe "d3 - axis" do
  after(:each) do
    D3.select("#test-area").html("")
  end

  let(:scale) { D3.scale_linear.domain([0,80_000_000]).range([0,800]) }
  let(:scale2) { D3.scale_linear.domain([0,30]).range([0,600]) }
  let(:axis) { D3.axis_top(scale) }

  it "d3.axis_top" do
    expect(D3.axis_top(scale)).to be_instance_of(D3::Axis)
  end

  it "d3.axis_bottom" do
    expect(D3.axis_bottom(scale)).to be_instance_of(D3::Axis)
  end

  it "d3.axis_right" do
    expect(D3.axis_right(scale)).to be_instance_of(D3::Axis)
  end

  it "d3.axis_left" do
    expect(D3.axis_left(scale)).to be_instance_of(D3::Axis)
  end

  it "axis.scale" do
    expect(axis.scale).to eq(scale)
    axis.scale(scale2)
    expect(axis.scale).to eq(scale2)
    axis.scale = scale
    expect(axis.scale).to eq(scale)
  end

  it "axis.tick_size_inner" do
    expect(axis.tick_size_inner).to eq(6)
    axis.tick_size_inner(20)
    expect(axis.tick_size_inner).to eq(20)
  end

  it "axis.tick_size_outer" do
    expect(axis.tick_size_outer).to eq(6)
    axis.tick_size_outer(20)
    expect(axis.tick_size_outer).to eq(20)
  end

  it "axis.tick_size" do
    expect(axis.tick_size).to eq(6)
    axis.tick_size(20)
    expect(axis.tick_size).to eq(20)
  end

  it "axis.tick_padding" do
    expect(axis.tick_padding).to eq(3)
    axis.tick_padding(10)
    expect(axis.tick_padding).to eq(10)
  end

  describe "axis.tick_values" do
    it "defaults" do
      context = D3.select("#test-area").append("svg")
      expect(axis.tick_values).to eq(nil)
      axis.(context)
      expect(D3.select("#test-area").html).to eq([
        '<svg fill="none" font-size="10" font-family="sans-serif" text-anchor="middle">',
        '<path class="domain" stroke="#000" d="M0.5,-6V0.5H800.5V-6"></path>',
        '<g class="tick" opacity="1" transform="translate(0.5,0)"><line stroke="#000" y2="-6"></line><text fill="#000" y="-9" dy="0em">0</text></g>',
        '<g class="tick" opacity="1" transform="translate(100.5,0)"><line stroke="#000" y2="-6"></line><text fill="#000" y="-9" dy="0em">10,000,000</text></g>',
        '<g class="tick" opacity="1" transform="translate(200.5,0)"><line stroke="#000" y2="-6"></line><text fill="#000" y="-9" dy="0em">20,000,000</text></g>',
        '<g class="tick" opacity="1" transform="translate(300.5,0)"><line stroke="#000" y2="-6"></line><text fill="#000" y="-9" dy="0em">30,000,000</text></g>',
        '<g class="tick" opacity="1" transform="translate(400.5,0)"><line stroke="#000" y2="-6"></line><text fill="#000" y="-9" dy="0em">40,000,000</text></g>',
        '<g class="tick" opacity="1" transform="translate(500.5,0)"><line stroke="#000" y2="-6"></line><text fill="#000" y="-9" dy="0em">50,000,000</text></g>',
        '<g class="tick" opacity="1" transform="translate(600.5,0)"><line stroke="#000" y2="-6"></line><text fill="#000" y="-9" dy="0em">60,000,000</text></g>',
        '<g class="tick" opacity="1" transform="translate(700.5,0)"><line stroke="#000" y2="-6"></line><text fill="#000" y="-9" dy="0em">70,000,000</text></g>',
        '<g class="tick" opacity="1" transform="translate(800.5,0)"><line stroke="#000" y2="-6"></line><text fill="#000" y="-9" dy="0em">80,000,000</text></g>',
        '</svg>',
      ].join)
    end

    it "set/get" do
      context = D3.select("#test-area").append("svg")
      axis.tick_values = [0, 20_000_000, 40_000_000]
      expect(axis.tick_values).to eq([0, 20_000_000, 40_000_000])
      axis.(context)
      expect(D3.select("#test-area").html).to eq([
        '<svg fill="none" font-size="10" font-family="sans-serif" text-anchor="middle">',
        '<path class="domain" stroke="#000" d="M0.5,-6V0.5H800.5V-6"></path>',
        '<g class="tick" opacity="1" transform="translate(0.5,0)"><line stroke="#000" y2="-6"></line><text fill="#000" y="-9" dy="0em">0</text></g>',
        '<g class="tick" opacity="1" transform="translate(200.5,0)"><line stroke="#000" y2="-6"></line><text fill="#000" y="-9" dy="0em">20,000,000</text></g>',
        '<g class="tick" opacity="1" transform="translate(400.5,0)"><line stroke="#000" y2="-6"></line><text fill="#000" y="-9" dy="0em">40,000,000</text></g>',
        '</svg>',
      ].join)
      axis.tick_values(nil)
      expect(axis.tick_values).to eq(nil)
    end
  end

  describe "axis.tick_format" do
    let(:scale) { D3.scale_linear.domain([0,80_000]).range([0,800]) }
    it "basics" do
      context = D3.select("#test-area").append("svg")
      expect(axis.tick_format).to eq(nil)
      axis.tick_values = [0, 20_000, 40_000]
      axis.tick_format = D3.format(",.2f")
      axis.(context)
      expect(D3.select("#test-area").html).to eq([
        '<svg fill="none" font-size="10" font-family="sans-serif" text-anchor="middle">',
        '<path class="domain" stroke="#000" d="M0.5,-6V0.5H800.5V-6"></path>',
        '<g class="tick" opacity="1" transform="translate(0.5,0)"><line stroke="#000" y2="-6"></line><text fill="#000" y="-9" dy="0em">0.00</text></g>',
        '<g class="tick" opacity="1" transform="translate(200.5,0)"><line stroke="#000" y2="-6"></line><text fill="#000" y="-9" dy="0em">20,000.00</text></g>',
        '<g class="tick" opacity="1" transform="translate(400.5,0)"><line stroke="#000" y2="-6"></line><text fill="#000" y="-9" dy="0em">40,000.00</text></g>',
        '</svg>',
      ].join)
    end

    it "block" do
      context = D3.select("#test-area").append("svg")
      expect(axis.tick_format).to eq(nil)
      axis.tick_values = [0, 20_000, 40_000]
      axis.tick_format{|d| "#{d}x"}
      expect(axis.tick_format.(5)).to eq("5x")
      axis.(context)
      expect(D3.select("#test-area").html).to eq([
        '<svg fill="none" font-size="10" font-family="sans-serif" text-anchor="middle">',
        '<path class="domain" stroke="#000" d="M0.5,-6V0.5H800.5V-6"></path>',
        '<g class="tick" opacity="1" transform="translate(0.5,0)"><line stroke="#000" y2="-6"></line><text fill="#000" y="-9" dy="0em">0x</text></g>',
        '<g class="tick" opacity="1" transform="translate(200.5,0)"><line stroke="#000" y2="-6"></line><text fill="#000" y="-9" dy="0em">20000x</text></g>',
        '<g class="tick" opacity="1" transform="translate(400.5,0)"><line stroke="#000" y2="-6"></line><text fill="#000" y="-9" dy="0em">40000x</text></g>',
        '</svg>',
      ].join)
    end
  end

  it "axis.ticks" do
    context = D3.select("#test-area").append("svg")
    axis.ticks(10, ".2f")
    axis.(context)
    expect(D3.select("#test-area").html).to eq([
      '<svg fill="none" font-size="10" font-family="sans-serif" text-anchor="middle">',
      '<path class="domain" stroke="#000" d="M0.5,-6V0.5H800.5V-6"></path>',
      '<g class="tick" opacity="1" transform="translate(0.5,0)"><line stroke="#000" y2="-6"></line><text fill="#000" y="-9" dy="0em">0.00</text></g>',
      '<g class="tick" opacity="1" transform="translate(100.5,0)"><line stroke="#000" y2="-6"></line><text fill="#000" y="-9" dy="0em">10000000.00</text></g>',
      '<g class="tick" opacity="1" transform="translate(200.5,0)"><line stroke="#000" y2="-6"></line><text fill="#000" y="-9" dy="0em">20000000.00</text></g>',
      '<g class="tick" opacity="1" transform="translate(300.5,0)"><line stroke="#000" y2="-6"></line><text fill="#000" y="-9" dy="0em">30000000.00</text></g>',
      '<g class="tick" opacity="1" transform="translate(400.5,0)"><line stroke="#000" y2="-6"></line><text fill="#000" y="-9" dy="0em">40000000.00</text></g>',
      '<g class="tick" opacity="1" transform="translate(500.5,0)"><line stroke="#000" y2="-6"></line><text fill="#000" y="-9" dy="0em">50000000.00</text></g>',
      '<g class="tick" opacity="1" transform="translate(600.5,0)"><line stroke="#000" y2="-6"></line><text fill="#000" y="-9" dy="0em">60000000.00</text></g>',
      '<g class="tick" opacity="1" transform="translate(700.5,0)"><line stroke="#000" y2="-6"></line><text fill="#000" y="-9" dy="0em">70000000.00</text></g>',
      '<g class="tick" opacity="1" transform="translate(800.5,0)"><line stroke="#000" y2="-6"></line><text fill="#000" y="-9" dy="0em">80000000.00</text></g>',
      '</svg>',
    ].join)
  end

  it "axis.tick_arguments" do
    context = D3.select("#test-area").append("svg")
    expect(axis.tick_arguments).to eq([])
    axis.tick_arguments([10, ".2f"])
    expect(axis.tick_arguments).to eq([10, ".2f"])
    axis.(context)
    expect(D3.select("#test-area").html).to eq([
      '<svg fill="none" font-size="10" font-family="sans-serif" text-anchor="middle">',
      '<path class="domain" stroke="#000" d="M0.5,-6V0.5H800.5V-6"></path>',
      '<g class="tick" opacity="1" transform="translate(0.5,0)"><line stroke="#000" y2="-6"></line><text fill="#000" y="-9" dy="0em">0.00</text></g>',
      '<g class="tick" opacity="1" transform="translate(100.5,0)"><line stroke="#000" y2="-6"></line><text fill="#000" y="-9" dy="0em">10000000.00</text></g>',
      '<g class="tick" opacity="1" transform="translate(200.5,0)"><line stroke="#000" y2="-6"></line><text fill="#000" y="-9" dy="0em">20000000.00</text></g>',
      '<g class="tick" opacity="1" transform="translate(300.5,0)"><line stroke="#000" y2="-6"></line><text fill="#000" y="-9" dy="0em">30000000.00</text></g>',
      '<g class="tick" opacity="1" transform="translate(400.5,0)"><line stroke="#000" y2="-6"></line><text fill="#000" y="-9" dy="0em">40000000.00</text></g>',
      '<g class="tick" opacity="1" transform="translate(500.5,0)"><line stroke="#000" y2="-6"></line><text fill="#000" y="-9" dy="0em">50000000.00</text></g>',
      '<g class="tick" opacity="1" transform="translate(600.5,0)"><line stroke="#000" y2="-6"></line><text fill="#000" y="-9" dy="0em">60000000.00</text></g>',
      '<g class="tick" opacity="1" transform="translate(700.5,0)"><line stroke="#000" y2="-6"></line><text fill="#000" y="-9" dy="0em">70000000.00</text></g>',
      '<g class="tick" opacity="1" transform="translate(800.5,0)"><line stroke="#000" y2="-6"></line><text fill="#000" y="-9" dy="0em">80000000.00</text></g>',
      '</svg>',
    ].join)
  end
end
