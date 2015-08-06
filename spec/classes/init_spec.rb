require 'spec_helper'
describe 'puppet_solaris_service' do

  context 'with defaults for all parameters' do
    it { should contain_class('puppet_solaris_service') }
  end
end
