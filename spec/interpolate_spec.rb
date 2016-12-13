describe "d3 - interpolate" do
  let(:f) { D3.send(name, a, b) }
  let(:v) { f.(0.5) }
  let(:f2) { D3.send(name).(a, b) }
  let(:v2) { f2.(0.5) }

  describe "numbers" do
    let(:a) { 10 }
    let(:b) { 20 }

    describe "d3.interpolate_number" do
      let(:name) { :interpolate_number }
      it do
        expect(f.(0.3)).to eq(13)
        expect(f.(0.31)).to eq(13.1)
        expect(f.(0.31)).to eq(f2.(0.31))
      end
    end

    describe "d3.interpolate_round" do
      let(:name) { :interpolate_round }
      it do
        expect(f.(0.3)).to eq(13)
        expect(f.(0.31)).to eq(13)
        expect(f.(0.31)).to eq(f2.(0.31))
      end
    end
  end

  describe "d3.interpolate_string" do
    let(:a) { "300 12px sans-serif" }
    let(:b) { "500 36px Comic-Sans" }
    let(:name) { :interpolate_string }

    it do
      expect(f.(0.5)).to eq("400 24px Comic-Sans")
      expect(f.(0.5)).to eq(f2.(0.5))
    end
  end

  describe "d3.interpolate_array" do
    let(:a) { [0, 200] }
    let(:b) { [10, 500] }
    let(:name) { :interpolate_array }

    it do
      expect(f.(0.5)).to eq([5, 350])
      expect(f.(0.5)).to eq(f2.(0.5))
    end
  end

  describe "d3.interpolate_date" do
    let(:a) { Time.parse("June 30, 2015 00:00:00 UTC") }
    let(:b) { Time.parse("December 31, 2016 12:00:00 UTC") }
    let(:name) { :interpolate_date }

    it do
      expect(f.(0.5)).to eq(Time.parse("March 31, 2016 06:00:00 UTC"))
      expect(f.(0.5)).to eq(f2.(0.5))
    end
  end

  describe "colors" do
    let(:a) { "purple" }
    let(:b) { "orange" }

    describe "d3.interpolate_rgb" do
      let(:name) { :interpolate_rgb }
      it do
        expect(v).to eq("rgb(192, 83, 64)")
        expect(v).to eq(v2)
      end
    end

    describe "basis" do
      let(:f) { D3.send(name, [a, b]) }
      let(:f2) { D3.send(name).([a, b]) }

      describe "d3.interpolate_rgb_basis" do
        let(:name) { :interpolate_rgb_basis }
        it do
          expect(v).to eq("rgb(192, 83, 64)")
          expect(v).to eq(v2)
        end
      end

      describe "d3.interpolate_rgb_basis_closed" do
        let(:name) { :interpolate_rgb_basis_closed }
        it do
          expect(v).to eq("rgb(213, 110, 43)")
          expect(v).to eq(v2)
        end
      end
    end

    describe "d3.interpolate_hsl" do
      let(:name) { :interpolate_hsl }
      it do
        expect(v).to eq("rgb(192, 0, 34)")
        expect(v).to eq(v2)
      end
    end

    describe "d3.interpolate_hsl_long" do
      let(:name) { :interpolate_hsl_long }
      it do
        expect(v).to eq("rgb(0, 192, 158)")
        expect(v).to eq(v2)
      end
    end

    describe "d3.interpolate_lab" do
      let(:name) { :interpolate_lab }
      it do
        expect(v).to eq("rgb(197, 93, 91)")
        expect(v).to eq(v2)
      end
    end

    describe "d3.interpolate_hcl" do
      let(:name) { :interpolate_hcl }
      it do
        expect(v).to eq("rgb(236, 46, 83)")
        expect(v).to eq(v2)
      end
    end

    describe "d3.interpolate_hcl_long" do
      let(:name) { :interpolate_hcl_long }
      it do
        expect(v).to eq("rgb(0, 153, 169)")
        expect(v).to eq(v2)
      end
    end

    describe "d3.interpolate_cubehelix" do
      let(:name) { :interpolate_cubehelix }
      it do
        expect(v).to eq("rgb(255, 32, 68)")
        expect(v).to eq(v2)
      end
    end

    describe "d3.interpolate_cubehelix_long" do
      let(:name) { :interpolate_cubehelix_long }
      it do
        expect(v).to eq("rgb(0, 194, 158)")
        expect(v).to eq(v2)
      end
    end
  end
end
