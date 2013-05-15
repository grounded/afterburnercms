require 'spec_helper'

module Abc
  module Adapters
    module Persistence
      module Repositories
        describe Text do
          it "is of kind text" do
            subject.send(:kind).should == :text
          end

          it "defines an entity_class" do
            expect {subject.send :entity_class}.to_not raise_exception
          end
        end
      end
    end
  end
end
