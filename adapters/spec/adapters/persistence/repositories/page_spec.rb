require 'spec_helper'

module Abc
  module Adapters
    module Persistence
      module Repositories
        describe Page do
          it "should be of kind page" do
            subject.send(:kind).should == :page
          end
        end
      end
    end
  end
end
