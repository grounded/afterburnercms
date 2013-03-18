# require 'spec_helper'
require 'shared/callable'
require 'abc/base_interactor'

module Abc
  describe BaseInteractor do
    subject { BaseInteractor }

    it_behaves_like "a callable"
  end
end
