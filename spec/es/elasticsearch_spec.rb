require 'spec_helper'

describe "elasticsearch spec" do
  # package
  describe package('java-1.8.0-openjdk') do
    it { should be_installed }
  end

  # command
  describe command('which elasticsearch') do
    let(:disable_sudo) { true }
    its(:exit_status) { should eq 0 }
  end

  # service
  describe service('elasticsearch') do
    it { should be_enabled }
    it { should be_running }
  end

  # port
  describe port("9200") do
    it { should be_listening }
  end

  # plugin
  describe command('curl http://127.0.0.1:9200/_plugin/head/ -o /dev/null -w "%{http_code}\n" -s') do
    its(:stdout) { should match /^200$/ }
  end
end
