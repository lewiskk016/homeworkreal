# == Schema Information
#
# Table name: seeds
#
#  id         :bigint           not null, primary key
#  count      :integer          not null
#  plant_id   :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Seed < ApplicationRecord
  belongs_to :plant,
    class_name: 'Plant',
    foreign_key: :plant_id,
    primary_key: :id


  def better_seeds_query
    Seed.joins(plant: :gardener)
        .where(gardeners: { house_id: self.id })
  end
end
