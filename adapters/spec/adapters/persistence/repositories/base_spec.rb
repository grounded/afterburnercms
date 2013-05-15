require 'spec_helper'

module Abc
  module Adapters
    module Persistence
      module Repositories
        describe Base do
          context "without kind" do
            it "raises an error" do
              expect{ subject.send(:kind) }.to raise_error NotImplementedError
            end
          end

          context "without entity_class" do
            it "raises an error" do
              expect{ subject.send(:entity_class) }.to raise_error NotImplementedError
            end
          end

          context "with entity_class" do
            before do
              Abc::Adapters.enable_datastore!
              subject.stub!(:entity_class).and_return(mock(:new => hash))
            end

            context "with kind" do
              let(:hash) { {:text => 'giggity'} }

              # Truncate each run.
              before do
                subject.stub!(:kind).and_return(:mock)
              end

              it "can store an item" do
                subject.store(hash)[:text].should == hash[:text]
              end

              it "can retrieve an item by key" do
                key = subject.store(hash)[:key]
                subject.find(key)[:text].should == hash[:text]
              end

              it "can find an item by attributes" do
                key = subject.store(hash)[:key]
                result = subject.search(:filters => [[:text, '=', hash[:text]]])
                result.first[:key].should == key
              end
            end
          end
        end
      end
    end
  end
end
