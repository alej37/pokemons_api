FactoryBot.define do
  factory :pokemon do
    sequence(:name) { |n| "pokemon#{n}" }
    type_1 {"Electric"}
    type_2 { }
    total { 320 }
    hp { 35 }
    attack { 55 }
    defense { 40 }
    sp_atk { 50 }
    sp_def { 50 }
    speed { 90 }
    generation { 1 }
    legendary { true }
  end
end