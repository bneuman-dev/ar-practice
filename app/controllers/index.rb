get '/' do
  @users = User.all
  #   @users.each.reduce("") do |string, user|
  #   string += user.username
  # end
  erb :index
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :user
end

get '/lists/:id' do
  @list = List.find(params[:id])
  erb :list
end

get '/lists/:id/completed' do
  @list = List.find(params[:id])
  erb :completed_list
end

get '/lists/:id/all' do
  @list = List.find(params[:id])
  erb :full_list
end

put '/lists/:list_id/tasks/:task_id/mark_complete' do
  @list = List.find(params[:list_id])
  task = @list.tasks.all[params[:task_id].to_i]
  task.update(completed: true)
  redirect "/lists/#{params[:list_id]}"
end
