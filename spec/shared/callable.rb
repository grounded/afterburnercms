shared_examples "a callable" do
  it "is not publicly instantiable" do
    subject.new({}).should raise_error NoMethodError
  end

  describe "::call" do
    it "returns with #to_response" do
      mock = double "object"
      mock.should_receive(:to_response)
      subject.stub!(:new).and_return(mock)
      subject.call({:stub => 'abc'})
    end
  end

  describe "#new" do
    it "receives the data passed to call" do
      args = %w(andaone andatwo)
      instance = subject.send(:new, args)
      instance.stub!(:to_response).and_return(nil)
      subject.should_receive(:new).with(*args).and_return(instance)
      subject.call(*args)
    end
  end
end
