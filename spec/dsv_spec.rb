describe "d3 - dsv" do
  let(:csv_example) do
    "Year,Make,Model,Length\n"+
    "1997,Ford,E350,2.34\n"+
    "2000,Mercury,Cougar,2.38\n"
  end
  let(:tsv_example) do
    "Year\tMake\tModel\tLength\n"+
    "1997\tFord\tE350\t2.34\n"+
    "2000\tMercury\tCougar\t2.38\n"
  end
  let(:dsv_example) do
    "Year;Make;Model;Length\n"+
    "1997;Ford;E350;2.34\n"+
    "2000;Mercury;Cougar;2.38\n"
  end
  let(:rows_example) {
    [
      ["Year", "Make", "Model", "Length"],
      ["1997", "Ford", "E350", "2.34"],
      ["2000", "Mercury", "Cougar", "2.38"],
    ]
  }
  let(:objs_example) {
    [
      {"Year"=>"1997", "Make"=>"Ford", "Model"=>"E350", "Length"=>"2.34"},
      {"Year"=>"2000", "Make"=>"Mercury", "Model"=>"Cougar", "Length"=>"2.38"},
    ]
  }
  let(:csv_format) { D3.dsv_format(",") }
  let(:tsv_format) { D3.dsv_format("\t") }
  let(:dsv_format) { D3.dsv_format(";") }
  let(:format_row) { proc{|(y,f,m,l)|
    ["converted", (Integer(y) rescue y), f, m, (Float(l) rescue l)]
  }}
  let(:filter_row) { proc{|d|
    format_row.(d) if d[0] == "2000" or d[0] == "1997"
  }}
  let(:format_obj) { proc{|o|
    {y: o["Year"].to_i, f:o["Make"], m:o["Model"], l:o["Length"].to_f}
  }}
  let(:filter_obj) { proc{|o|
    format_obj.(o) if o["Year"] == "2000"
  }}

  it "d3.dsv_format" do
    expect(D3.dsv_format(";")).to be_instance_of(D3::DsvFormat)
  end

  it "dsv_format.parse_rows" do
    expect(dsv_format.parse_rows(dsv_example)).to eq(rows_example)
    expect(dsv_format.parse_rows(dsv_example, format_row)).to eq(
           dsv_format.parse_rows(dsv_example, &format_row)
    )
    expect(dsv_format.parse_rows(dsv_example, format_row)).to eq([
      ["converted", "Year", "Make", "Model", "Length"],
      ["converted", 1997, "Ford", "E350", 2.34],
      ["converted", 2000, "Mercury", "Cougar", 2.38],
    ])
    expect(dsv_format.parse_rows(dsv_example, filter_row)).to eq([
      ["converted", 1997, "Ford", "E350", 2.34],
      ["converted", 2000, "Mercury", "Cougar", 2.38],
    ])
  end

  it "d3.csv_parse_rows" do
    expect(D3.csv_parse_rows(csv_example)).to eq(
           csv_format.parse_rows(csv_example))
    expect(dsv_format.parse_rows(dsv_example)).to eq(
           csv_format.parse_rows(csv_example))
    expect(D3.csv_parse_rows(csv_example, format_row)).to eq(
           csv_format.parse_rows(csv_example, format_row))
    expect(D3.csv_parse_rows(csv_example, &format_row)).to eq(
           csv_format.parse_rows(csv_example, &format_row))
    expect(D3.csv_parse_rows(csv_example, filter_row)).to eq(
           csv_format.parse_rows(csv_example, filter_row))
    expect(D3.csv_parse_rows(csv_example, &filter_row)).to eq(
           csv_format.parse_rows(csv_example, &filter_row))
  end

  it "d3.tsv_parse_rows" do
    expect(D3.tsv_parse_rows(tsv_example)).to eq(
           tsv_format.parse_rows(tsv_example))
    expect(dsv_format.parse_rows(dsv_example)).to eq(
           tsv_format.parse_rows(tsv_example))
    expect(D3.tsv_parse_rows(tsv_example, format_row)).to eq(
           tsv_format.parse_rows(tsv_example, format_row))
    expect(D3.tsv_parse_rows(tsv_example, &format_row)).to eq(
           tsv_format.parse_rows(tsv_example, &format_row))
    expect(D3.tsv_parse_rows(tsv_example, filter_row)).to eq(
           tsv_format.parse_rows(tsv_example, filter_row))
    expect(D3.tsv_parse_rows(tsv_example, &filter_row)).to eq(
          tsv_format.parse_rows(tsv_example, &filter_row))
  end

  # It's awful practice not to include final \n,
  # but it's not our place to workaround D3's bugs here
  it "dsv_format.format_rows" do
    expect(dsv_format.format_rows(rows_example)).to eq(dsv_example.chomp)
  end

  it "d3.csv_format_rows" do
    expect(csv_format.format_rows(rows_example)).to eq(csv_example.chomp)
    expect(D3.csv_format_rows(rows_example)).to eq(csv_example.chomp)
  end

  it "d3.tsv_format_rows" do
    expect(tsv_format.format_rows(rows_example)).to eq(tsv_example.chomp)
    expect(D3.tsv_format_rows(rows_example)).to eq(tsv_example.chomp)
  end

  # We have ways to enforce proper Hash order, maybe it's a good idea
  it "dsv_format.parse" do
    expect(dsv_format.parse(dsv_example)).to eq(objs_example)
    expect(dsv_format.parse(dsv_example, format_obj)).to eq(
           dsv_format.parse(dsv_example, &format_obj))
    expect(dsv_format.parse(dsv_example, &format_obj)).to eq([
      {"y"=>1997, "f"=>"Ford", "m"=>"E350", "l"=>2.34},
      {"y"=>2000, "f"=>"Mercury", "m"=>"Cougar", "l"=>2.38},
    ])
  end

  it "dsv_format.parse - filtering" do
    expect(dsv_format.parse(dsv_example, &filter_obj)).to eq(
           dsv_format.parse(dsv_example, filter_obj))
    expect(dsv_format.parse(dsv_example, &filter_obj)).to eq([
      {"y"=>2000, "f"=>"Mercury", "m"=>"Cougar", "l"=>2.38},
    ])
  end

  it "d3.csv_parse" do
    expect(D3.csv_parse(csv_example)).to eq(
           csv_format.parse(csv_example))
    expect(dsv_format.parse(dsv_example)).to eq(
           csv_format.parse(csv_example))
    expect(D3.csv_parse(csv_example, format_obj)).to eq(
           csv_format.parse(csv_example, format_obj))
    expect(D3.csv_parse(csv_example, &format_obj)).to eq(
           csv_format.parse(csv_example, &format_obj))
    expect(D3.csv_parse(csv_example, filter_obj)).to eq(
           csv_format.parse(csv_example, filter_obj))
    expect(D3.csv_parse(csv_example, &filter_obj)).to eq(
          csv_format.parse(csv_example, &filter_obj))
  end

  it "d3.tsv_parse" do
    expect(D3.tsv_parse(tsv_example)).to eq(
           tsv_format.parse(tsv_example))
    expect(dsv_format.parse(dsv_example)).to eq(
           tsv_format.parse(tsv_example))
    expect(D3.tsv_parse(tsv_example, format_obj)).to eq(
           tsv_format.parse(tsv_example, format_obj))
    expect(D3.tsv_parse(tsv_example, &format_obj)).to eq(
           tsv_format.parse(tsv_example, &format_obj))
    expect(D3.tsv_parse(tsv_example, filter_obj)).to eq(
           tsv_format.parse(tsv_example, filter_obj))
    expect(D3.tsv_parse(tsv_example, &filter_obj)).to eq(
          tsv_format.parse(tsv_example, &filter_obj))
  end

  # Same awful idea of not including final \n
  it "dsv_format.format" do
    expect(dsv_format.format(objs_example)).to eq(dsv_example.chomp)
    expect(dsv_format.format(objs_example, ["Year", "Make", "Speed"])).to eq(
      "Year;Make;Speed\n"+
      "1997;Ford;\n"+
      "2000;Mercury;"
    )
  end

  it "d3.tsv_format" do
    expect(tsv_format.format(objs_example, ["Year", "Make", "Speed"])).to eq(
      "Year\tMake\tSpeed\n"+
      "1997\tFord\t\n"+
      "2000\tMercury\t"
    )
    expect(tsv_format.format(objs_example)).to eq(
           D3.tsv_format(objs_example))
    expect(tsv_format.format(objs_example, ["Year", "Make", "Speed"])).to eq(
           D3.tsv_format(objs_example, ["Year", "Make", "Speed"]))
  end

  it "d3.csv_format" do
    expect(csv_format.format(objs_example, ["Year", "Make", "Speed"])).to eq(
      "Year,Make,Speed\n"+
      "1997,Ford,\n"+
      "2000,Mercury,"
    )
    expect(csv_format.format(objs_example)).to eq(
           D3.csv_format(objs_example))
    expect(csv_format.format(objs_example, ["Year", "Make", "Speed"])).to eq(
           D3.csv_format(objs_example, ["Year", "Make", "Speed"]))
  end
end
