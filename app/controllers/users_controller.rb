# This controller is for all the CRUD operations related to a User.
MyApp.get "/new_user" do 
  erb :"users/new_user"
end

MyApp.post "/new_user/create" do
  @user = User.new
  @user.name = params["name"]
  @user.email = params["email"]
  @user.password = params["password"]
  @user.save
  erb :"users/user_success"
end