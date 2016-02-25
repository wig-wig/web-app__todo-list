MyApp.get "/categories/new" do
  erb :"categories/new"
end

MyApp.post "/categories/create" do
  @categories = Category.new
  @categories.name = params["name"]
  @categories.save
  redirect "/categories/index"
end

MyApp.get "/categories/index" do
  @categories = Category.all
  erb :"categories/index"
end
