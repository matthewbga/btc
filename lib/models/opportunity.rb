class Opportunity < ActiveRecord::Base
  has_one :base, class_name: 'Currency', foreign_key: 'base_id'
  has_one :quote, class_name: 'Currency', foreign_key: 'quote_id'
end
