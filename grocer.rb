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

def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    name = coupon[:item]
    if cart[name] && cart[name][:count] >= coupon[:num]
      if cart["#{name} W/COUPON"]
        cart["#{name} W/COUPON"][:count] += 1
      else
        cart["#{name} W/COUPON"] = {:count => 1, :price => coupon[:cost]}
        cart["#{name} W/COUPON"][:clearance] = cart[name][:clearance]
      end
      cart[name][:count] -= coupon[:num]
    end
  end
  cart
end

def apply_clearance(cart)
  
end

def checkout(cart, coupons)
  # code here
end
