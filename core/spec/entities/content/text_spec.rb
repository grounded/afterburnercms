require 'spec_helper'
require 'abc/entities/content/text'

module Abc
  module Entities
    module Content
      describe Text do
        let(:text) { rand(30).times.map{|i| ('A'..'Z').to_a.sample}.join }

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
      end
    end
  end
end

