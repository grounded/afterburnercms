require 'spec_helper'
require 'abc/entities/content/image'

module Abc
  module Entities
    module Content
      describe Image do
        subject { Image }

        let(:relative_url) { '/' }
        let(:absolute_url) {
          "http://images.wikia.com/brutallegend/images/8/8c/You_Don't_Say.jpg"
        }

        context '#url' do
          it 'can be relative' do
            subject.new(relative_url).url.should == relative_url
          end

          it 'can be absolute' do
            subject.new(absolute_url).url.should == absolute_url
          end
        end

        it 'responds to to_s with the URL' do
          subject.new(relative_url).to_s.should == relative_url
        end
      end
    end
  end
end

