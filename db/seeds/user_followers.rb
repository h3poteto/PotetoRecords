# coding: utf-8
ActiveRecord::Base.connection.execute("TRUNCATE user_follows")

UserFollow.create([{user_id: 1, follow_user_id: 2},
                   {user_id: 2, follow_user_id: 1}
                  ])
