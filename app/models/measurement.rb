class Measurement < ApplicationRecord
  belongs_to :user
  validates_presence_of :twitter, :instagram, :tiktok, :other, :total_time_spent, :progress
end
