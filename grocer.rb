def consolidate_cart(cart)
  consolidate_hash = {}
  cart.each do |item_hash|
    item_hash.each do |name, value_hash|
      unless consolidate_hash[name] 
        consolidate_hash[name] = value_hash
        consolidate_hash[name][:count] = 0
      end
      consolidate_hash[name][:count] += 1
    end
  end
  consolidate_hash 
end

def apply_coupons(cart, coupon)
  cart.each do |item, description_hash|
    description_hash.each do |price, clearance, count|
      if item == coupon[:item]
        if count.to_i % 2 == 1
          cart[item][:count] = 1
          cart["#{item} W/ COUPON"][:price] = coupon[:cost]
        end
      end
    end
  end
end

def apply_clearance(cart)
  
end

def checkout(cart, coupons)
  # code here
end
