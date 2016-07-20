# encoding: utf-8
# copyright: 2016, Annie Hedgpeth
# license: All rights reserved

title '3 - Secure Boot Settings'

control '3.1' do
  impact 0.1
  title '3.1 Set User/Group Owner on bootloader config (Scored)'
  desc 'Set the owner and group of your boot loaders config file to the root user. These instructions default to GRUB stored at /boot/grub/grub.cfg.'
  describe file('/boot/grub/grub.cfg') do
    it { should exist }
    it { should be_owned_by 'root' }
    its('group') { should eq 'root'}
  end
end

control '3.2' do
  impact 0.1
  title '3.2 Set Permissions on bootloader config (Scored)'
  desc 'Set permission on the your boot loaders config file to read and write for root only.'
  describe file('/boot/grub/grub.cfg') do
    it { should exist }
    its("gid") { should cmp 0 }
    its("uid") { should cmp 0 }
    it { should be_owned_by 'root' }
    it { should be_readable.by "owner" }
    it { should be_writable.by "owner" }
    it { should be_executable.by "owner" }
    it { should_not be_executable.by "group" }
    it { should_not be_readable.by "group" }
    it { should_not be_writable.by "group" }
    it { should_not be_executable.by "other" }
    it { should_not be_readable.by "other" }
    it { should_not be_writable.by "other" }
  end
end