# This test will fail in any non-UTC timezone
require "time"

# Running these specs in weird timezone will fail because javascript timezones are pile of fail
describe "d3 - time format" do
  let(:us) {{
    date_time: "%x, %X",
    date: "%-m/%-d/%Y",
    time: "%-I:%M:%S %p",
    periods: ["AM", "PM"],
    days: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
    short_days: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
    months: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
    short_months: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
  }}
  let(:pl) {{
    date_time: "%A, %e %B %Y, %X",
    date: "%d/%m/%Y",
    time: "%H:%M:%S",
    periods: ["AM", "PM"],
    days: ["Niedziela", "Poniedziałek", "Wtorek", "Środa", "Czwartek", "Piątek", "Sobota"],
    short_days: ["Niedz.", "Pon.", "Wt.", "Śr.", "Czw.", "Pt.", "Sob."],
    months: ["Styczeń", "Luty", "Marzec", "Kwiecień", "Maj", "Czerwiec", "Lipiec", "Sierpień", "Wrzesień", "Październik", "Listopad", "Grudzień"],
    short_months: ["Stycz.", "Luty", "Marz.", "Kwie.", "Maj", "Czerw.", "Lipc.", "Sierp.", "Wrz.", "Paźdz.", "Listop.", "Grudz."],
  }}

  it "d3.time_format" do
    f = D3.time_format("%B %d, %Y")
    expect(f).to be_instance_of(Proc)
    expect(f.(Time.parse("June 30, 2015"))).to eq("June 30, 2015")
  end

  it "d3.time_parse" do
    f = D3.time_parse("%B %d, %Y")
    expect(f).to be_instance_of(Proc)
    expect(f.("June 30, 2015")).to eq(Time.parse("June 30, 2015 00:00:00"))
  end

  it "d3.utc_format" do
    f = D3.utc_format("%B %d, %Y")
    expect(f).to be_instance_of(Proc)
    expect(f.(Time.parse("June 30, 2015 12:00:00"))).to eq("June 30, 2015")
  end

  it "d3.utc_parse" do
    f = D3.utc_parse("%B %d, %Y")
    expect(f).to be_instance_of(Proc)
    expect(f.("June 30, 2015")).to eq(Time.parse("June 30, 2015 00:00:00 UTC"))
  end

  it "d3.iso_format / d3.iso_parse" do
    t = Time.parse("June 30, 2015 12:30:45 UTC")
    s = "2015-06-30T12:30:45.000Z"
    expect(D3.iso_format(t)).to eq(s)
    expect(D3.iso_parse(s)).to eq(t)
  end

  describe "locale" do
    let(:locale) { D3.time_format_locale(pl) }

    it "d3.format" do
      f = locale.format("%B %d, %Y")
      expect(f).to be_instance_of(Proc)
      expect(f.(Time.parse("June 30, 2015"))).to eq("Czerwiec 30, 2015")
    end

    it "d3.parse" do
      f = locale.parse("%B %d, %Y")
      expect(f).to be_instance_of(Proc)
      expect(f.("Czerwiec 30, 2015")).to eq(Time.parse("June 30, 2015 00:00:00"))
    end

    it "d3.utc_format" do
      f = locale.utc_format("%B %d, %Y")
      expect(f).to be_instance_of(Proc)
      expect(f.(Time.parse("June 30, 2015 12:00:00"))).to eq("Czerwiec 30, 2015")
    end

    it "d3.utc_parse" do
      f = locale.utc_parse("%B %d, %Y")
      expect(f).to be_instance_of(Proc)
      expect(f.("Czerwiec 30, 2015")).to eq(Time.parse("June 30, 2015 00:00:00 UTC"))
    end
  end

  # This test affects global state, so we must be sure to restore it
  it "d3.time_format_default_locale" do
    t = Time.parse("June 30, 2015 12:30:00")
    expect(D3.time_format("%c").(t)).to eq("6/30/2015, 12:30:00 PM")

    locale_pl = D3.time_format_default_locale(pl)
    expect(D3.time_format("%c").(t)).to eq("Wtorek, 30 Czerwiec 2015, 12:30:00")

    locale_us = D3.time_format_default_locale(us)
    expect(D3.time_format("%c").(t)).to eq("6/30/2015, 12:30:00 PM")

    expect(locale_pl.format("%c").(t)).to eq("Wtorek, 30 Czerwiec 2015, 12:30:00")
    expect(locale_us.format("%c").(t)).to eq("6/30/2015, 12:30:00 PM")
  end
end
