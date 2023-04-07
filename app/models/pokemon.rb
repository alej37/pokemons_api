class Pokemon < ApplicationRecord
  validates_presence_of :name, :type_1, :total, :hp, :attack, :defense, :sp_atk, :sp_def, :speed, :generation, :legendary
  validates_uniqueness_of :name
  validates_inclusion_of :legendary, in: [true, false]
end
