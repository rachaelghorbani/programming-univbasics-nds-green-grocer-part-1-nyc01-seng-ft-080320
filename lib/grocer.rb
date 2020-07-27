require "pry"


def find_item_by_name_in_collection(name, collection)
  
  counter = 0 
  
  while counter < collection.length do
    if collection[counter][:item] == name
      return collection[counter]
    end
      counter += 1
  end
  return nil
end

def consolidate_cart(cart)

  new_cart = []
  counter = 0 
  while counter < cart.length 
    name = cart[counter][:item]
    new_cart_item = find_item_by_name_in_collection(name, new_cart)
    if new_cart_item  
      new_cart_item[:count] += 1
    else
      new_cart_item = {
        :item => name,
        :price => cart[counter][:price],
        :clearance => cart[counter][:clearance],
        :count => 1
      }
      new_cart << new_cart_item
    end
    counter += 1
  end    
new_cart
end 

######### USING ENUMERABLES #########

def find_item_by_name_in_collection(item_name, cart)
  cart.each do |item_hash|
    if item_hash[:item] == item_name.upcase
      return item_hash
    end
  end
  nil
end

def consolidate_cart(unconsolidated_cart)
  consolo_cart = []
  unconsolidated_cart.each do |item_hash| 
    item_name = item_hash[:item]
    new_cart_item = find_item_by_name_in_collection(item_name, consolo_cart)
  if new_cart_item
    new_cart_item[:count] += 1
  else 
    consolo_cart.push(item_hash)
    item_hash[:count] = 1
  end
 end
 consolo_cart
end
  