require 'spec_helper'

describe "mysql spec" do
  # mysql command
  describe command('which mysql') do
    let(:disable_sudo) { true }
    its(:exit_status) { should eq 0 }
  end

  # service
  describe service('mysql-default') do
    it { should be_enabled }
    it { should be_running }
  end

  # port
  describe port("3306") do
    it { should be_listening }
  end
end
