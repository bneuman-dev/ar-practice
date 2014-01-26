require 'faker'

PriorityLevel.create(level: "low")
PriorityLevel.create(level: "medium")
PriorityLevel.create(level: "high")

users = ["Bob", "Frank", "Dopey", "Mopey",
          "Hoozit", "Whatzit", "Fowl", "Plotz"]

users.each do |username|
  user = User.create(username: username)
  2.times do
    user.create_list(Faker::Company.bs)
  end

  user.lists.each do |list|
    10.times do
      priority = rand(1..3)
      deadline = Time.new(2016, 02, 14, 17, 15, 33)
      description = Faker::Lorem.paragraph
      params = {priority_id: priority, deadline: 
                deadline, desc: description, completed: false}
      user.create_task_for_list(list, params)
    end
  end
end

User.all.each do |user|
  user.lists.each do |list|
    User.all.reject { |u2| u2 == user}.each do |u2|
      perm = rand(1..3)
      if perm == 1
        user.make_list_readable_for_user(list, u2)
      elsif perm == 2
        user.make_list_writeable_for_user(list, u2)
      end
    end
  end
end



