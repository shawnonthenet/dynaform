# Dynaform


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `dynaform` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:dynaform, "~> 0.1.0"}
  ]
end
```

## Usage

Add the following javascript to your app.js

```
var el = document.getElementByClassName('dynaform-link-to-add');
el.onclick = function(e){
  e.preventDefault()
  var el = document.getElementByClassName('dynaform-link-to-add');
  let time = new Date().getTime()
  let template = el.getAttribute('data-template')
  let target = el.getAttribute('data-target')
  var uniq_template = template.replace(/\[0\]/g, `[${time}]`)
  uniq_template = uniq_template.replace(/\[0\]/g, `_${time}_`)
  let target_block = document.getElementById(target)
  target_block.insertAdjacentHTML('beforeend', uniq_template)
};
```

Create a new template with the contents of the inputs\_for you want to be
dynamic.

address.html.eex
```
<div>
<%= label @f, :address %>
<%= text_input @f, :address %>
</div>
```

On your form add your inputs\_for and set a unique id

```
<%= inputs_for f, :addresses, [id: "unique_id"], fn a -> %>
  <%= render "address.html", f: a %>
<% end %>
<%= Dynaform.link_to_add("Add Address",
                         MyApp.User.change_address(%MyApp.User.Address{}, %{}),
                         "address.html",
                         "unique_id") %>
```
