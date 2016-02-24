# This controller is for all the CRUD operations related to a User.
#new user form
MyApp.get "/new_user" do 
  erb :"users/new_user"
end

#creates new user
MyApp.post "/new_user/create" do
  @user = User.new
  @user.name = params["name"]
  @user.email = params["email"]
  @user.password = params["password"]
  @user.save
  erb :"users/user_success"
end

#creates view of all users
MyApp.get "/users_view" do
  @users = User.all
  erb :"users/users_view"
end

#edits user
MyApp.get "/edit_user/:id" do
  @user = User.find_by_id(params[:id])
  @user.name = params["name"]
  @user.email = params["email"]
  @user.password = params["password"]
  @user.save
  erb :"users/edit_success"
end

#deletes user
MyApp.get "/delete_user/:id" do
  @user = User.find_by_id(params[:id])
  @user.delete
  erb :"users/delete_success"
end

