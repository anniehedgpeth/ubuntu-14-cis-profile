# encoding: utf-8
# copyright: 2016, Annie Hedgpeth
# license: All rights reserved

title '4 - Additional Process Hardening'

control '4.1' do
  impact 0.1
  title '4.1 Restrict Core Dumps (Scored)'
  desc 'A core dump is the memory of an executable program. It is generally used to determine why a program aborted. It can also be used to glean confidential information from a core file. The system provides the ability to set a soft limit for core dumps, but this can be overridden by the user.'
  describe limits_conf('/etc/security/limits.conf') do
    its('*') { should include ['hard', 'core', '0'] }
  end
  # describe file('/etc/sysctl.conf') do
  #   its('content') { should match /^\s*fs.suid_dumpable = 0\s*(#.*)?$/ }
  # end
  # audit = command('sysctl fs.suid_dumpable').stdout
  #   options = {
  #     assignment_re: /^\s*([^:]*?)\s*:\s*(.*?)\s*$/
  #   }
  describe parse_config('/etc/sysctl.conf') do
    its('fs.suid_dumpable') { should eq '0' }
  end
  describe package('apport') do
    it { should_not be_installed }
  end
  describe package('whoopsie') do
    it { should_not be_installed }
  end
end

control '4.3' do
  impact 0.1
  title '4.3 Enable Randomized Virtual Memory Region Placement'
  desc 'Set the system flag to force randomized virtual memory region placement.'
  describe kernel_parameter('kernel.randomize_va_space') do
    its('value') { should eq 2 }
  end
end

control '4.4' do
  impact 0.1
  title '4.4 Disable Prelink'
  desc 'The prelinking feature changes binaries in an attempt to decrease their startup time.'
  describe package('prelink') do
    it { should_not be_installed }
  end
end

# Commented out because, while the CIS benchmark recommends it be activated, Chef cannot be run if Apparmor is enabled. 
# control '4.5' do
#   impact 0.2
#   title '4.5 Activate AppArmor'
#   desc 'AppArmor provides a Mandatory Access Control (MAC) system that greatly augments the default Discretionary Access Control (DAC) model.'
#   describe package('apparmor') do
#     it { should exist }
#   end
#   describe package('apparmor-utils') do
#     it { should exist }
#   end
# end