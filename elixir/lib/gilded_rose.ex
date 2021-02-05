defmodule GildedRose do

  def update_quality(items) do
    Enum.map(items, &update_item/1)
  end

  def update_item(item = %{ name: name }) do
    cond do
      PassesHandler.is_handled?(name) ->
        PassesHandler.handle(item)

      BrieHandler.is_handled?(name) ->
        BrieHandler.handle(item)

      SulfurasHandler.is_handled?(name) -> 
        SulfurasHandler.handle(item)

      ConjuredHandler.is_handled?(name) ->
        ConjuredHandler.handle(item)

      DefaultHandler.is_handled?(name) ->
        DefaultHandler.handle(item)
    end
  end

end
