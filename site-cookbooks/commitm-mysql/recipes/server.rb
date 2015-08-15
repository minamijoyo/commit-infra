mysql_service 'default' do
  port '3306'
  version '5.5'
  initial_root_password 'change_after_install'
  action [:create, :start]
end
