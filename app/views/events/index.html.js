<h1>##The calendar will go here!</h1>

<% current_user.calendars %>
<ul>
  <% @calendar_list.items.each do |calendar| %>
    <li><%= calendar.summary %> (<%= calendar.id %>)</li>
  <% end %>
</ul>