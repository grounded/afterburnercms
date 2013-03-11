require 'spec_helper'

class MockRepo < Abc::Adapters::Persistence::Repositories::Base
  def self.kind; :mock; end
end

module Abc
  module Adapters
    module Persistence
      module Repositories
        describe Base do
          context "without kind" do
            let(:repo) { Base }
            it "should raise an error" do
              ->{repo.send(:kind)}.should raise_error
            end
          end

          context "with kind" do
            let(:repo) { MockRepo }
            let(:hash) { {:text => 'giggity'} }

            # Truncate each run.
            before(:each) { Abc::Adapters.enable_datastore! }

            it "can store an item" do
              Text.store(hash)[:text].should == hash[:text]
            end

            it "can retrieve an item by key" do
              key = repo.store(hash)[:key]
              repo.find(key)[:text].should == hash[:text]
            end

            it "can find an item by attributes" do
              key = Text.store(hash)[:key]
              result = Text.search(:filters => [[:text, '=', hash[:text]]])
              result.first[:key].should == key
            end
          end
        end
      end
    end
  end
end
