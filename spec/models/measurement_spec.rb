require 'rails_helper'

RSpec.describe Measurement, type: :model do
  it { should validate_presence_of :twitter }
  it { should validate_presence_of :instagram }
  it { should validate_presence_of :tiktok }
  it { should validate_presence_of :other }
  it { should validate_presence_of :total_time_spent }
  it { should validate_presence_of :progress }
  it { should belong_to :user }
end
