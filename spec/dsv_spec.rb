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
  let(:csv_format) { D3.dsv_format(",") }
  let(:tsv_format) { D3.dsv_format("\t") }
  let(:dsv_format) { D3.dsv_format(";") }
  let(:format) { proc{|d| [:converted, d] } }

  it "d3.dsv_format" do
    expect(D3.dsv_format(";")).to be_instance_of(D3::DsvFormat)
  end

  it "dsv_format.parse_rows" do
    expect(dsv_format.parse_rows(dsv_example)).to eq(rows_example)
    expect(dsv_format.parse_rows(dsv_example, format)).to eq(
           dsv_format.parse_rows(dsv_example, &format)
    )
    expect(dsv_format.parse_rows(dsv_example, format)).to eq([
      ["converted", ["Year", "Make", "Model", "Length"]],
      ["converted", ["1997", "Ford", "E350", "2.34"]],
      ["converted", ["2000", "Mercury", "Cougar", "2.38"]],
    ])
  end

  it "d3.csv_parse_rows" do
    expect(D3.csv_parse_rows(csv_example)).to eq(
           csv_format.parse_rows(csv_example))
    expect(dsv_format.parse_rows(dsv_example)).to eq(
           csv_format.parse_rows(csv_example))
    expect(D3.csv_parse_rows(csv_example, format)).to eq(
           csv_format.parse_rows(csv_example, format))
    expect(D3.csv_parse_rows(csv_example, &format)).to eq(
           csv_format.parse_rows(csv_example, &format))
  end

  it "d3.tsv_parse_rows" do
    expect(D3.tsv_parse_rows(tsv_example)).to eq(
           tsv_format.parse_rows(tsv_example))
    expect(tsv_format.parse_rows(tsv_example)).to eq(
           csv_format.parse_rows(csv_example))
    expect(D3.tsv_parse_rows(tsv_example, format)).to eq(
           tsv_format.parse_rows(tsv_example, format))
    expect(D3.tsv_parse_rows(tsv_example, &format)).to eq(
           tsv_format.parse_rows(tsv_example, &format))
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
end
