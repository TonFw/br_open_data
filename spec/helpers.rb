require 'file_helper'
module Helpers
  def http_success
    200
  end

  def accessible? url
    RestClient.proxy = Rents.proxy
    resp = RestClient.get url
    RestClient.proxy = nil
    resp.code == 200 ? true : false
  end

  def fake_sold_items
    sold_items = []

    count = 0
    items_amount = 3

    until count == items_amount do
      count = count+1
      rand_count_departments = Random.new.rand(1..10)
      sold_items.push({
          remote_id: Faker::Number.number(count),
          name: Faker::Commerce.product_name,
          description: Faker::Commerce.department(rand_count_departments, rand_count_departments==2)
      })
    end

    return sold_items
  end

  def get_json url
    resp = RestClient.get url
    JSON.parse(resp).it_keys_to_sym
  end
end