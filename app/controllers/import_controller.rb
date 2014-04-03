class ImportController < ApplicationController
  def upload
  end

  def import
    file_ref = params['upload']['data_file']
    i = 1
    @total_revenue = 0.0

    if file_ref.respond_to?(:read)
      data_array = file_ref.read.split(/\n/)
      data_array.shift
      data_array.each do |line|
        begin
          data_hash = process_line(line)
          purchase = Purchase.new(data_hash)
          purchase.save

          @total_revenue += purchase.total_price
        rescue
          #Would be nice to log issues
        end
      end
    end
  end

  protected
  def process_line(data_line)
    columns = data_line.split(/\t/)
    unless columns.size() == 6
      raise 'Bad Data Error'
    end

    {
        purchaser_name: columns[0],
        item_description: columns[1],
        item_price: columns[2].to_f,
        purchase_count: columns[3].to_i,
        merchant_address: columns[4],
        merchant_name: columns[5]
    }

  end
end
