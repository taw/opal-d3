describe "d3 - time interval" do
  let(:a) { Time.at(1481073422.123678) } # 2016-12-07 01:17:02.79

  it "d3.time_year" do
    expect(D3.time_year.floor(a).to_s).to eq("2016-01-01 00:00:00 -0000")
    expect(D3.time_year.round(a).to_s).to eq("2017-01-01 00:00:00 -0000")
    expect(D3.time_year.ceil(a).to_s).to eq("2017-01-01 00:00:00 -0000")
  end
  it "d3.utc_year" do
    expect(D3.utc_year.floor(a).to_s).to eq("2016-01-01 00:00:00 -0000")
    expect(D3.utc_year.round(a).to_s).to eq("2017-01-01 00:00:00 -0000")
    expect(D3.utc_year.ceil(a).to_s).to eq("2017-01-01 00:00:00 -0000")
  end

  it "d3.time_month" do
    expect(D3.time_month.floor(a).to_s).to eq("2016-12-01 00:00:00 -0000")
  end
  it "d3.utc_month" do
    expect(D3.utc_month.floor(a).to_s).to eq("2016-12-01 00:00:00 -0000")
  end

  it "d3.time_week" do
    expect(D3.time_week.floor(a).to_s).to eq("2016-12-04 00:00:00 -0000")
  end
  it "d3.utc_week" do
    expect(D3.utc_week.floor(a).to_s).to eq("2016-12-04 00:00:00 -0000")
  end

  it "d3.time_monday" do
    expect(D3.time_monday.floor(a).to_s).to eq("2016-12-05 00:00:00 -0000")
  end
  it "d3.utc_monday" do
    expect(D3.utc_monday.floor(a).to_s).to eq("2016-12-05 00:00:00 -0000")
  end

  it "d3.time_tuesday" do
    expect(D3.time_tuesday.floor(a).to_s).to eq("2016-12-06 00:00:00 -0000")
  end
  it "d3.utc_tuesday" do
    expect(D3.utc_tuesday.floor(a).to_s).to eq("2016-12-06 00:00:00 -0000")
  end

  it "d3.time_wednesday" do
    expect(D3.time_wednesday.floor(a).to_s).to eq("2016-12-07 00:00:00 -0000")
  end
  it "d3.utc_wednesday" do
    expect(D3.utc_wednesday.floor(a).to_s).to eq("2016-12-07 00:00:00 -0000")
  end

  it "d3.time_thursday" do
    expect(D3.time_thursday.floor(a).to_s).to eq("2016-12-01 00:00:00 -0000")
  end
  it "d3.utc_thursday" do
    expect(D3.utc_thursday.floor(a).to_s).to eq("2016-12-01 00:00:00 -0000")
  end

  it "d3.time_friday" do
    expect(D3.time_friday.floor(a).to_s).to eq("2016-12-02 00:00:00 -0000")
  end
  it "d3.utc_friday" do
    expect(D3.utc_friday.floor(a).to_s).to eq("2016-12-02 00:00:00 -0000")
  end

  it "d3.time_saturday" do
    expect(D3.time_saturday.floor(a).to_s).to eq("2016-12-03 00:00:00 -0000")
  end
  it "d3.utc_saturday" do
    expect(D3.utc_saturday.floor(a).to_s).to eq("2016-12-03 00:00:00 -0000")
  end

  it "d3.time_sunday" do
    expect(D3.time_sunday.floor(a).to_s).to eq("2016-12-04 00:00:00 -0000")
  end
  it "d3.utc_sunday" do
    expect(D3.utc_sunday.floor(a).to_s).to eq("2016-12-04 00:00:00 -0000")
  end

  it "d3.time_day" do
    expect(D3.time_day.floor(a).to_s).to eq("2016-12-07 00:00:00 -0000")
  end
  it "d3.utc_day" do
    expect(D3.utc_day.floor(a).to_s).to eq("2016-12-07 00:00:00 -0000")
  end

  it "d3.time_hour" do
    expect(D3.time_hour.floor(a).to_s).to eq("2016-12-07 01:00:00 -0000")
  end
  it "d3.utc_hour" do
    expect(D3.utc_hour.floor(a).to_s).to eq("2016-12-07 01:00:00 -0000")
  end

  it "d3.time_minute" do
    expect(D3.time_minute.floor(a).to_s).to eq("2016-12-07 01:17:00 -0000")
  end
  it "d3.utc_minute" do
    expect(D3.utc_minute.floor(a).to_s).to eq("2016-12-07 01:17:00 -0000")
  end

  it "d3.time_second" do
    expect(D3.time_second.floor(a).to_s).to eq("2016-12-07 01:17:02 -0000")
    expect(D3.utc_second.ceil(a).to_s).to eq("2016-12-07 01:17:03 -0000")
  end
  it "d3.utc_second" do
    expect(D3.utc_second.floor(a).to_s).to eq("2016-12-07 01:17:02 -0000")
    expect(D3.utc_second.ceil(a).to_s).to eq("2016-12-07 01:17:03 -0000")
  end

  # This looks like bug in D3, ceil should be 124000
  it "d3.time_millisecond" do
    expect(D3.time_millisecond.floor(a).to_s).to eq("2016-12-07 01:17:02 -0000")
    expect(D3.time_millisecond.ceil(a).to_s).to eq("2016-12-07 01:17:02 -0000")
    expect(D3.utc_millisecond.floor(a).usec).to eq(123000)
    expect(D3.utc_millisecond.ceil(a).usec).to eq(123000)
  end
  it "d3.utc_millisecond" do
    expect(D3.utc_millisecond.floor(a).to_s).to eq("2016-12-07 01:17:02 -0000")
    expect(D3.utc_millisecond.ceil(a).to_s).to eq("2016-12-07 01:17:02 -0000")
    expect(D3.utc_millisecond.floor(a).usec).to eq(123000)
    expect(D3.utc_millisecond.ceil(a).usec).to eq(123000)
  end
end
