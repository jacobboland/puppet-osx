require 'spec_helper'

describe 'osx::global::enable_standard_function_keys' do
  let(:facts) { {:boxen_user => 'ieatbees'} }

  it 'os x defaults' do
    should contain_boxen__osx_defaults('Keyboard, Use all F1, F2, etc. keys as standard function keys').with({
      :key    => 'com.apple.keyboard.fnState',
      :domain => 'NSGlobalDomain',
      :value  => 1,
      :user   => facts[:boxen_user]
    })
  end

  describe 'with parameters' do
    let(:params) { {:enabled => false} }
    it do
      should contain_boxen__osx_defaults('Keyboard, Use all F1, F2, etc. keys as standard function keys').with({
        :key    => 'com.apple.keyboard.fnState',
        :domain => 'NSGlobalDomain',
        :value  => 0,
        :user   => facts[:boxen_user]
      })
    end
  end

end
