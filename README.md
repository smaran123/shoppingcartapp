
# displaying products based on categories
---------------------------------------------
categories controller
----------------------------
 def index
 # @category = Category.find(params[:id])
 #    @products = @category.products
  @categories = Category.all
  end


index.html.erb
---------------------
  <% @categories.where("name is not null" ).each do |cat| %>

	<%= link_to cat.name, cat %><br/>
	<% cat.products.each do |p|%>
	<%= p.name %>
<%= p.price%>
<%= p.description %><br/>
<%end%>
	<% end %>
	-------------------------

	o/p:
	----
	category 1
	products details
	category 2
	products details
	-----
	-----
	-----
	