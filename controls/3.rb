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
  title '3.2 Title (Not Scored)'
  desc 'Description.'
  # describe file('/tmp') do
  #   it { should be_directory }
  # end
end