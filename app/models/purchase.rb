class Purchase < ActiveRecord::Base
  def total_price
   item_price * purchase_count
  end
end
