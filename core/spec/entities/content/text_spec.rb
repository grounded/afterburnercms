require 'spec_helper'
require 'abc/entities/content/text'

module Abc
  module Entities
    module Content
      describe Text do
        let(:text) { "Afterburner" }

        subject { Text.new(text) }

        it 'encapsulates a block of text' do
          subject.text.should == text
        end

        it 'responds to to_s' do
          subject.to_s.should == text
        end

        it 'accepts text in the initialize call' do
          subject.class.new(text).to_s.should == text
        end

        it 'requires text in the initialize call' do
          expect { subject.class.new }.to raise_exception(ArgumentError)
        end

        it 'can be hashified' do
          text1 = text
          hsh = {:text => text1}
          subject.class.new(text).to_hash.should == hsh
        end
      end
    end
  end
end

