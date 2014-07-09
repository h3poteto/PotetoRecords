# coding: utf-8
ActiveRecord::Base.connection.execute("TRUNCATE users")

User.create!([{:email => Settings.admin.email, :name => "poteto" ,:password => Settings.admin.password, :password_confirmation => Settings.admin.password},
              {:email => "seatbelts_horns@yahoo.co.jp", :name => "poteto_sub",:password => Settings.admin.password, :password_confirmation => Settings.admin.password}
             ])
