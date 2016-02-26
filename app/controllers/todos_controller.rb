# This controller is for all the CRUD operations related to a Todo.

#Form for a new user
MyApp.get "/todos/new" do
  @users = User.all 
  erb :"todos/new"
end

#Creates new user
MyApp.post "/todos/create" do
  @todo = Todo.new
  @todo.category_id = params["category_id"]
  @todo.title = params["title"]
  @todo.description = params["description"]
  @todo.completed = params["completed"]
  @todo.user_id  = params["user_id"]
  @todo.todo_creator = session["user_id"]
  binding.pry
  @todo.save
  erb :"todos/success"
end

#Gets all To Dos
MyApp.get "/todos" do
  @todos = Todo.all
  erb :"todos/todos_view"
end

#gets To Do edit form
MyApp.get "/edit_todos/:id" do
  @current_user = User.find_by_id(session["user_id"]) 
  if @current_user != nil
    @todos = Todo.find_by_id(params[:id])
    erb :"todos/edit_todos"
  else
    erb :"todos/invalid_request"
  end    
end

#Processes edit form
MyApp.post "/edit_todos_form/:id" do
  @todo = Todo.find_by_id(params[:id])
  @todo.title = params["title"]
  @todo.description = params["description"]
  @todo.completed = params["completed"]
  @todo.user_id  = params["user_id"]
  @todo.save
  erb :"todos/edit_success"
end

#Deletes to do
MyApp.get "/delete_todos/:id" do
  @current_user = User.find_by_id(session["user_id"]) 
  if @current_user != nil
    @todos = Todo.find_by_id(params[:id])
    @todos.delete
    erb :"todos/deleted"
  else
    erb :"todos/invalid_request"
  end
end



