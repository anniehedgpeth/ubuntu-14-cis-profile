# encoding: utf-8
# copyright: 2016, Annie Hedgpeth
# license: All rights reserved

title '5 - OS Services'

control '5.1.1' do
  impact 0.1
  title '5.1.1 Ensure NIS is not installed (Scored)'
  desc 'The Network Information Service (NIS), formerly known as Yellow Pages, is a client-server directory service protocol used to distribute system configuration files.'
  describe package('nis') do
    it { should_not be_installed}
  end
end

# 5.1.2 Ensure rsh server is not enabled
# 5.1.3 Ensure rsh client is not installed
# 5.1.4 Ensure talk server is not enabled
# 5.1.5 Ensure talk client is not installed
# 5.1.6 Ensure telnet server is not enabled
# 5.1.7 Ensure tftp-server is not enabled
# 5.1.8 Ensure xinetd is not enabled
# 5.2 Ensure chargen is not enabled
# 5.3 Ensure daytime is not enabled
# 5.4 Ensure echo is not enabled
# 5.5 Ensure discard is not enabled
# 5.6 Ensure time is not enabled