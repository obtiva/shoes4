shared_examples "movable element" do |left, top|
  context "with disposed real element" do
    before :each do
      real.stub(:disposed?) { true }
    end

    it "doesn't delegate to real" do
      real.should_not_receive(:set_location)
      subject.move left, top
    end
  end

  context "with undisposed real element" do
    before :each do
      real.stub(:disposed?) { false }
    end

    it "delegates to real" do
      real.should_receive(:set_location).with(left, top)
      subject.move left, top
    end
  end
end
