
# 1)displaying products based on categories
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

	<%= link_to cat.name, home_path(cat) %><br/>
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

2)specific category
------------------------ 
home show page	
-----------------
<% @category.products.each do |cp| %>

<%= cp.name %>
<%= cp.description %>
<%end%>




3)testing for dropdown select of category name ajax on change
------------------------------------------------------
home/index page
-------------------
<%=form_tag root_path do%>
  
  <%=select_tag :category,options_for_select([["select", ""]]+Category.all.map{|i|[i.name,i.id]}), {:onchange => "alert('hello')"} %>
<%end%>
--------------
<%=form_tag root_path do%>
        
        <%=select_tag :category,options_for_select([["select", ""]]+Category.all.map{|i|[i.name,i.id]})%>
        <%end%>

-----------------------



4)Dropdown onchange using ajax in rails
-----------------------------------------

class HomesController < ApplicationController
  def index
# @categories = []
    @categories = Category.all
  end
  
  def category
      @categories = Category.where("id = '#{params[:category_id]}'")

    respond_to do |format|
          format.js
      end
  end
   
end

-------------------------------
index action
-----------------
<%= form_tag root_path do %>
  <%= select_tag :category, options_for_select([["Select",""]]+Category.all.map{|a| [a.name, a.id]}), :onchange => "category1(this.value)" %>
<% end %>

<div id="category1">
  <%= render :partial => "category" %>
</div>

<script>
  function category1(val){
  var category = val;
 
  $.ajax({
    type: 'GET',
    url: '/homes/category',
    dataType: 'Script',
    data: {
      category_id: category
    },
    success: function(data) {},
  });
  }
</script>
-------------------------
_category.html.erb
--------------------------

<%  @categories.each do |category|  %>
  <%= category.name %>
  <% category.products.each do |p| %>
    <%= p.name%>
  <%end%>
<% end %>
------------------
category.js.erb
-------------------

$("#category1").html('<%=escape_javascript render :partial => "category" %>');


routes
----------------
  resources :homes do
    collection do
      get :category
    end
  end
--------------------------------------------------------------------------

  5) 5)Ajax onchange only one action
---------------------------------

class HomesController < ApplicationController
  
  def index
    if params[:category_id]
      @categories = Category.where("id = '#{params[:category_id]}'")
      respond_to do |format|
        format.js
      end
    else
      @categories = []
    end
    
  end


end
------------------------------------------------

index action
-------------
<%= form_tag root_path do %>
  <%= select_tag :category, options_for_select([["Select",""]]+Category.all.map{|a| [a.name, a.id]}), :onchange => "category1(this.value)" %>
<% end %>

<div id="category1">
  <%= render :partial => "category" %>
</div>

<script>
  function category1(val) {
    var category = val;

    $.ajax({
      type: 'GET',
      url: '/homes',
      dataType: 'Script',
      data: {
        category_id: category
      },
      success: function(data) {
      },
    });
  }
</script>
--------------------
_category.html.erb
---------------------
<% if @categories.present? %>
  <%  @categories.each do |category|  %>
    <% category.products.each do |p| %>
      <div> <%= p.name%><br>
        <%=p.description%><br>
        <%=p.price%><br><br>
      </div>
    <%end%>
  <% end %>
<% end %>
-------------------------
index.js.erb
-----------------
$("#category1").html('<%=escape_javascript render :partial => "category" %>');
---------------
routes
------------
resources :homes do
    collection do
      get :category
    end
  end
