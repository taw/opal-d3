describe "d3 - path" do
  it "d3.path" do
    expect(D3.path).to be_instance_of(D3::Path)
  end

  it "path.move_to" do
    expect(D3.path.move_to(10,20).to_s).to eq("M10,20")
    expect(D3.path.move_to(10,20).move_to(30,40).to_s).to eq("M10,20M30,40")
  end

  it "path.line_to" do
    expect(D3.path.line_to(30,40).to_s).to eq("L30,40")
    expect(D3.path.line_to(10,20).line_to(30,40).to_s).to eq("L10,20L30,40")
  end

  it "path.close_path" do
    expect(D3.path.line_to(10,20).close_path.to_s).to eq("L10,20Z")
    expect(D3.path.line_to(10,20).close_path.line_to(30,40).close_path.to_s).to eq("L10,20ZL30,40Z")
  end

  it "path.rect" do # (x,y,w,h) not (x1,y1,x2,y2)
    expect(D3.path.rect(10,20,30,40).to_s).to eq("M10,20h30v40h-30Z")
    expect(D3.path.rect(10,20,30,40).rect(50,60,70,80).to_s).to eq("M10,20h30v40h-30ZM50,60h70v80h-70Z")
  end

  it "path.quadratic_curve_to" do
    expect(D3.path.quadratic_curve_to(10,20,30,40).to_s).to eq("Q10,20,30,40")
    expect(D3.path.quadratic_curve_to(10,20,30,40)
                  .quadratic_curve_to(50,60,70,80).to_s).to eq("Q10,20,30,40Q50,60,70,80")
  end

  it "path.bezier_curve_to" do
    expect(D3.path.bezier_curve_to(10,20,30,40,50,60).to_s).to eq("C10,20,30,40,50,60")
    expect(D3.path.bezier_curve_to(10,20,30,40,50,60)
                  .bezier_curve_to(70,80,90,100,110,120).to_s).to eq(
                  "C10,20,30,40,50,60C70,80,90,100,110,120")
  end

  it "path.arc" do
    expect(D3.path.arc(100,100,50,90,225).to_s).to eq(
      "M77.59631919354149,144.6998331800279"+
      "A50,50,0,1,1,122.40368080645851,55.300166819972105"+
      "A50,50,0,1,1,77.59631919354149,144.6998331800279"
    )
    expect(D3.path.arc(100,100,50,90,225,false)
                  .arc(100,100,50,90,225,true).to_s).to eq(
      "M77.59631919354149,144.6998331800279"+
      "A50,50,0,1,1,122.40368080645851,55.300166819972105" +
      "A50,50,0,1,1,77.59631919354149,144.6998331800279" +
      "A50,50,0,1,0,118.36596838651226,53.495256099773734"
    )
  end

  it "path.arc_to" do
    # To be honest it's not clear to me how that's supposed to work exactly
    # but we're just doing bindings here
    expect(D3.path
             .move_to(10,10)
             .arc_to(20,20,30,10,10)
             .to_s).to eq(
               "M10,10"+
               "L12.928932188134526,12.928932188134526"+
               "A10,10,0,0,0,27.071067811865476,12.928932188134526")
  end
end
