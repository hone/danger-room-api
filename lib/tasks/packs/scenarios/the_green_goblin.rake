namespace :packs do
  desc "Insert Scenario: The Green Goblin"
  task :the_green_goblin => :environment do
    pack_name = "The Green Goblin"
    puts "Scenario: #{pack_name}"
    pack = Pack.create(name: pack_name, pack_type: :scenario)
    ["Risky Business", "Mutagen Formula"].each {|name| pack.scenarios.create(name: name) }
    ["Goblin Gimmicks", "A Mess of Things", "Power Drain", "Running Interference"].each {|name| pack.modular_encounter_sets.create(name: name) }
  end
end
