# This test will fail in any non-UTC timezone
require "time"

describe "d3 - time interval" do
  # Opal 0.10 uses shitty native regexp, so no \A\z
  def t(str)
    raise "Bad time format #{str.inspect}" unless str =~ /^(\d\d\d\d-\d\d-\d\d) (\d\d:\d\d:\d\d(?:\.\d+)?)$/
    s = "#{$1}T#{$2}"
    Time.parse(s)
  end

  let(:a) { Time.at(1481073422.123678) } # 2016-12-07 01:17:02.123678
  let(:b) { Time.at(1482781833.345345) } # 2016-12-26 19:50:33.345345
  let(:c) { Time.at(1000000000 )} # 2001-09-09 02:46:40 +0100

  it "time_interval.offset" do
    expect(D3.time_year.offset(a)).to eq(t("2017-12-07 01:17:02.123000"))
    expect(D3.time_year.offset(a, 10)).to eq(t("2026-12-07 01:17:02.123000"))
  end

  it "time_interval.range" do
    expect(D3.time_day.range(a, a+3*24*3600)).to eq([
      t("2016-12-08 00:00:00"), t("2016-12-09 00:00:00"), t("2016-12-10 00:00:00")
    ])
    expect(D3.time_day.range(a, b, 5)).to eq([
      t("2016-12-08 00:00:00"), t("2016-12-13 00:00:00"), t("2016-12-18 00:00:00"), t("2016-12-23 00:00:00")
    ])
  end

  # It's not same as passing step to range
  it "time_interval.every" do
    expect(D3.time_day.every(5).range(a, b)).to eq([
      t("2016-12-11 00:00:00"), t("2016-12-16 00:00:00"), t("2016-12-21 00:00:00"), t("2016-12-26 00:00:00")
    ])
  end

  it "time_interval.filter" do
    expect(D3.time_day.filter{|d| d.day % 5 == 1}.range(a, b)).to eq([
      t("2016-12-11 00:00:00"), t("2016-12-16 00:00:00"), t("2016-12-21 00:00:00"), t("2016-12-26 00:00:00")
    ])
  end

  it "time_interval.count" do
    expect(D3.time_day.count(a, b)).to eq(19)
  end

  it "d3.time_year" do
    expect(D3.time_year.floor(a)).to eq(t("2016-01-01 00:00:00"))
    expect(D3.time_year.round(a)).to eq(t("2017-01-01 00:00:00"))
    expect(D3.time_year.ceil(a)).to eq(t("2017-01-01 00:00:00"))
  end
  it "d3.utc_year" do
    expect(D3.utc_year.floor(a)).to eq(t("2016-01-01 00:00:00"))
    expect(D3.utc_year.round(a)).to eq(t("2017-01-01 00:00:00"))
    expect(D3.utc_year.ceil(a)).to eq(t("2017-01-01 00:00:00"))
  end

  it "d3.time_month" do
    expect(D3.time_month.floor(a)).to eq(t("2016-12-01 00:00:00"))
  end
  it "d3.utc_month" do
    expect(D3.utc_month.floor(a)).to eq(t("2016-12-01 00:00:00"))
  end

  it "d3.time_week" do
    expect(D3.time_week.floor(a)).to eq(t("2016-12-04 00:00:00"))
  end
  it "d3.utc_week" do
    expect(D3.utc_week.floor(a)).to eq(t("2016-12-04 00:00:00"))
  end

  it "d3.time_monday" do
    expect(D3.time_monday.floor(a)).to eq(t("2016-12-05 00:00:00"))
  end
  it "d3.utc_monday" do
    expect(D3.utc_monday.floor(a)).to eq(t("2016-12-05 00:00:00"))
  end

  it "d3.time_tuesday" do
    expect(D3.time_tuesday.floor(a)).to eq(t("2016-12-06 00:00:00"))
  end
  it "d3.utc_tuesday" do
    expect(D3.utc_tuesday.floor(a)).to eq(t("2016-12-06 00:00:00"))
  end

  it "d3.time_wednesday" do
    expect(D3.time_wednesday.floor(a)).to eq(t("2016-12-07 00:00:00"))
  end
  it "d3.utc_wednesday" do
    expect(D3.utc_wednesday.floor(a)).to eq(t("2016-12-07 00:00:00"))
  end

  it "d3.time_thursday" do
    expect(D3.time_thursday.floor(a)).to eq(t("2016-12-01 00:00:00"))
  end
  it "d3.utc_thursday" do
    expect(D3.utc_thursday.floor(a)).to eq(t("2016-12-01 00:00:00"))
  end

  it "d3.time_friday" do
    expect(D3.time_friday.floor(a)).to eq(t("2016-12-02 00:00:00"))
  end
  it "d3.utc_friday" do
    expect(D3.utc_friday.floor(a)).to eq(t("2016-12-02 00:00:00"))
  end

  it "d3.time_saturday" do
    expect(D3.time_saturday.floor(a)).to eq(t("2016-12-03 00:00:00"))
  end
  it "d3.utc_saturday" do
    expect(D3.utc_saturday.floor(a)).to eq(t("2016-12-03 00:00:00"))
  end

  it "d3.time_sunday" do
    expect(D3.time_sunday.floor(a)).to eq(t("2016-12-04 00:00:00"))
  end
  it "d3.utc_sunday" do
    expect(D3.utc_sunday.floor(a)).to eq(t("2016-12-04 00:00:00"))
  end

  it "d3.time_day" do
    expect(D3.time_day.floor(a)).to eq(t("2016-12-07 00:00:00"))
  end
  it "d3.utc_day" do
    expect(D3.utc_day.floor(a)).to eq(t("2016-12-07 00:00:00"))
  end

  it "d3.time_hour" do
    expect(D3.time_hour.floor(a)).to eq(t("2016-12-07 01:00:00"))
  end
  it "d3.utc_hour" do
    expect(D3.utc_hour.floor(a)).to eq(t("2016-12-07 01:00:00"))
  end

  it "d3.time_minute" do
    expect(D3.time_minute.floor(a)).to eq(t("2016-12-07 01:17:00"))
  end
  it "d3.utc_minute" do
    expect(D3.utc_minute.floor(a)).to eq(t("2016-12-07 01:17:00"))
  end

  it "d3.time_second" do
    expect(D3.time_second.floor(a)).to eq(t("2016-12-07 01:17:02"))
    expect(D3.utc_second.ceil(a)).to eq(t("2016-12-07 01:17:03"))
  end
  it "d3.utc_second" do
    expect(D3.utc_second.floor(a)).to eq(t("2016-12-07 01:17:02"))
    expect(D3.utc_second.ceil(a)).to eq(t("2016-12-07 01:17:03"))
  end

  # This looks like bug in D3, ceil should be 124000
  it "d3.time_millisecond" do
    expect(D3.time_millisecond.floor(a)).to eq(t("2016-12-07 01:17:02.123000"))
    expect(D3.time_millisecond.ceil(a)).to eq(t("2016-12-07 01:17:02.123000"))
    expect(D3.utc_millisecond.floor(a).usec).to eq(123000)
    expect(D3.utc_millisecond.ceil(a).usec).to eq(123000)
  end
  it "d3.utc_millisecond" do
    expect(D3.utc_millisecond.floor(a)).to eq(t("2016-12-07 01:17:02.123000"))
    expect(D3.utc_millisecond.ceil(a)).to eq(t("2016-12-07 01:17:02.123000"))
    expect(D3.utc_millisecond.floor(a).usec).to eq(123000)
    expect(D3.utc_millisecond.ceil(a).usec).to eq(123000)
  end

  it "d3.time_years" do
    expect(D3.time_years(c,a).size).to eq(15)
    expect(D3.time_years(c,a,2).size).to eq(8)
  end
  it "d3.utc_years" do
    expect(D3.time_years(c,a).size).to eq(15)
    expect(D3.time_years(c,a,2).size).to eq(8)
  end

  it "d3.time_months" do
    expect(D3.time_months(c,a).size).to eq(183)
    expect(D3.time_months(c,a,12).size).to eq(16)
  end
  it "d3.utc_months" do
    expect(D3.time_months(c,a).size).to eq(183)
    expect(D3.time_months(c,a,12).size).to eq(16)
  end

  it "d3.time_mondays" do
    expect(D3.time_mondays(a,b)).to eq([
      t("2016-12-12 00:00:00"), t("2016-12-19 00:00:00"), t("2016-12-26 00:00:00")
    ])
  end
  it "d3.utc_mondays" do
    expect(D3.utc_mondays(a,b)).to eq([
      t("2016-12-12 00:00:00"), t("2016-12-19 00:00:00"), t("2016-12-26 00:00:00")
    ])
  end

  it "d3.time_tuesdays" do
    expect(D3.time_tuesdays(a,b)).to eq([
      t("2016-12-13 00:00:00"), t("2016-12-20 00:00:00")
    ])
  end
  it "d3.utc_tuesdays" do
    expect(D3.utc_tuesdays(a,b)).to eq([
      t("2016-12-13 00:00:00"), t("2016-12-20 00:00:00")
    ])
  end

  it "d3.time_wednesdays" do
    expect(D3.time_wednesdays(a,b)).to eq([
      t("2016-12-14 00:00:00"), t("2016-12-21 00:00:00")
    ])
  end
  it "d3.utc_wednesdays" do
    expect(D3.utc_wednesdays(a,b)).to eq([
      t("2016-12-14 00:00:00"), t("2016-12-21 00:00:00")
    ])
  end

  it "d3.time_thursdays" do
    expect(D3.time_thursdays(a,b)).to eq([
      t("2016-12-08 00:00:00"), t("2016-12-15 00:00:00"), t("2016-12-22 00:00:00")
    ])
  end
  it "d3.utc_thursdays" do
    expect(D3.utc_thursdays(a,b)).to eq([
      t("2016-12-08 00:00:00"), t("2016-12-15 00:00:00"), t("2016-12-22 00:00:00")
    ])
  end

  it "d3.time_fridays" do
    expect(D3.time_fridays(a,b)).to eq([
      t("2016-12-09 00:00:00"), t("2016-12-16 00:00:00"), t("2016-12-23 00:00:00")
    ])
  end
  it "d3.utc_fridays" do
    expect(D3.utc_fridays(a,b)).to eq([
      t("2016-12-09 00:00:00"), t("2016-12-16 00:00:00"), t("2016-12-23 00:00:00")
    ])
  end

  it "d3.time_saturdays" do
    expect(D3.time_saturdays(a,b)).to eq([
      t("2016-12-10 00:00:00"), t("2016-12-17 00:00:00"), t("2016-12-24 00:00:00")
    ])
  end
  it "d3.utc_saturdays" do
    expect(D3.utc_saturdays(a,b)).to eq([
      t("2016-12-10 00:00:00"), t("2016-12-17 00:00:00"), t("2016-12-24 00:00:00")
    ])
  end

  it "d3.time_sundays" do
    expect(D3.time_sundays(a,b)).to eq([
      t("2016-12-11 00:00:00"), t("2016-12-18 00:00:00"), t("2016-12-25 00:00:00")
    ])
  end
  it "d3.utc_sundays" do
    expect(D3.utc_sundays(a,b)).to eq([
      t("2016-12-11 00:00:00"), t("2016-12-18 00:00:00"), t("2016-12-25 00:00:00")
    ])
  end

  it "d3.time_weeks" do
    expect(D3.time_weeks(a,b)).to eq([
      t("2016-12-11 00:00:00"), t("2016-12-18 00:00:00"), t("2016-12-25 00:00:00")
    ])
  end
  it "d3.utc_weeks" do
    expect(D3.utc_weeks(a,b)).to eq([
      t("2016-12-11 00:00:00"), t("2016-12-18 00:00:00"), t("2016-12-25 00:00:00")
    ])
  end

  it "d3.time_hours" do
    expect(D3.time_hours(a,a+10000)).to eq([
      t("2016-12-07 02:00:00"), t("2016-12-07 03:00:00"), t("2016-12-07 04:00:00")
    ])
  end
  it "d3.utc_hours" do
    expect(D3.utc_hours(a,a+10000)).to eq([
      t("2016-12-07 02:00:00"), t("2016-12-07 03:00:00"), t("2016-12-07 04:00:00")
    ])
  end

  it "d3.time_minutes" do
    expect(D3.time_minutes(a,a+200)).to eq([
      t("2016-12-07 01:18:00"), t("2016-12-07 01:19:00"), t("2016-12-07 01:20:00")
    ])
  end
  it "d3.utc_minutes" do
    expect(D3.utc_minutes(a,a+200)).to eq([
      t("2016-12-07 01:18:00"), t("2016-12-07 01:19:00"), t("2016-12-07 01:20:00")
    ])
  end

  it "d3.time_seconds" do
    expect(D3.time_seconds(a,a+3)).to eq([
      t("2016-12-07 01:17:03"), t("2016-12-07 01:17:04"), t("2016-12-07 01:17:05")
    ])
  end
  it "d3.utc_seconds" do
    expect(D3.utc_seconds(a,a+3)).to eq([
      t("2016-12-07 01:17:03"), t("2016-12-07 01:17:04"), t("2016-12-07 01:17:05")
    ])
  end

  it "d3.time_milliseconds" do
    expect(D3.time_milliseconds(a,a+0.004).map(&:tv_usec)).to eq([
      123000, 124000, 125000, 126000
    ])
  end
  it "d3.utc_milliseconds" do
    expect(D3.utc_milliseconds(a,a+0.004).map(&:tv_usec)).to eq([
      123000, 124000, 125000, 126000
    ])
  end
end
