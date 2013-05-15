require 'spec_helper'

module Abc
  module Adapters
    module Persistence
      module Repositories
        describe Page do
          it "should be of kind page" do
            subject.send(:kind).should == :page
          end

          it "defines an entity_class" do
            expect {subject.send :entity_class}.to_not raise_exception
          end
        end
      end
    end
  end
end
