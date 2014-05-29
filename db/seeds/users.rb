# coding: utf-8
ActiveRecord::Base.connection.execute("TRUNCATE users")

User.create!([{:email => Settings.admin.email, :password => Settings.admin.password, :password_confirmation => Settings.admin.password},
              {:email => "seatbelts_horns@yahoo.co.jp", :password => Settings.admin.password, :password_confirmation => Settings.admin.password}
             ])
