require 'spec_helper'

module Abc
  module Adapters
    module Persistence
      module Repositories
        describe Text do
          it "should be of kind text" do
            Text.send(:kind).should == :text
          end
        end
      end
    end
  end
end
