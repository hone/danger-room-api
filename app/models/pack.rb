class Pack < ApplicationRecord
  enum type: {
    core: "core",
    hero: "hero",
    scenario: "scenario",
    campaign: "campaign",
    print_n_play: "print-n-play"
  }

  has_many :identities
  has_many :scenarios
  has_many :modular_encounter_sets
end
