namespace :packs do
  desc "Insert Scenario: The Wrecking Crew"
  task :the_wrecking_crew => :environment do
    pack_name = "The Wrecking Crew"
    puts "Scenario: #{pack_name}"
    pack = Pack.create(name: pack_name, pack_type: :scenario)
    pack.scenarios.create(name: pack_name, features: ['no-modular-encounter-sets'])
  end
end
