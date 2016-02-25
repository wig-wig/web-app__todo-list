# This controller is for all the CRUD operations related to a Login.

# Note that "logins" are not stored in the database. But there is still
# a reasonable way to think about a "login" as a resource which is created
# and deleted (i.e. 'logging out').
# 
# Reading and Updating a login, however, make a little less sense.


#shows login form
MyApp.get "/logins/new" do
  
  erb :"logins/new"
end

#creates new login
MyApp.post "/logins/create" do
  @user = User.find_by_email(params["email"])

  if @user == nil
    erb :"users/new_user"
  elsif @user.password == params["password"] 
    session["user_id"] = @user.id
    redirect "/todos"
  else
    erb :"logins/invalid"
  end
end

#deletes users session
MyApp.get "/logins/delete" do
  session["user_id"] = nil
  erb :"logins/success_logout"
end





