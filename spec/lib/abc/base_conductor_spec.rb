require 'shared/callable'
require 'abc/base_conductor'

module Abc
  describe BaseConductor do
    subject { BaseConductor }
    it_behaves_like "a callable"
  end
end
