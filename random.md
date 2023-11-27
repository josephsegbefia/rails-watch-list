<%= image_tag("http://image.tmdb.org/t/p/w185/#{movie.poster_url}", class: "card-img-top", alt: "Image") %>


<div class="cards">
   <% @list.movies.each do |movie| %>
    <div class="card-category">
      <%# <%= link_to list.name, list_path(list), class: "list-category-link"%>
    </div>
  <% end %>
</div>
