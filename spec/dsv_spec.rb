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
  let(:csv_format) { D3.dsv_format(",") }
  let(:tsv_format) { D3.dsv_format("\t") }
  let(:dsv_format) { D3.dsv_format(";") }
  let(:format) { proc{|d| [:converted, d] } }

  it "d3.dsv_format" do
    expect(D3.dsv_format(";")).to be_instance_of(D3::DsvFormat)
  end

  it "dsv_format.parse_rows" do
    expect(dsv_format.parse_rows(dsv_example)).to eq([
      ["Year", "Make", "Model", "Length"],
      ["1997", "Ford", "E350", "2.34"],
      ["2000", "Mercury", "Cougar", "2.38"],
    ])
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
end
