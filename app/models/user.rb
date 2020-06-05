class User < ApplicationRecord
  # attr_accessor :username, :plain_pass, :token, :id
  attribute :username, :string
  attribute :plain_pass, :string
  attribute :token, :string
  attribute :id, :string



end


