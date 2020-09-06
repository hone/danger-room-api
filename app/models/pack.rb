class Pack < ApplicationRecord
  enum type: {
    core: "Core",
    hero: "Hero",
    scenario: "Scenario",
    campaign: "Campaign",
    print_n_play: "Print N Play"
  }

  has_many :identities
  has_many :scenarios
  has_many :modular_encounter_sets
end
