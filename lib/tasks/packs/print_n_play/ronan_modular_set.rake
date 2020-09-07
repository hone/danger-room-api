namespace :packs do
  desc "Insert Print N Play: Ronan Modular Set"
  task :ronan_modular_set => :environment do
    pack_name = "Ronan Modular Set"
    puts "Print N Play: #{pack_name}"
    pack = Pack.create(name: pack_name, pack_type: "print-n-play")
    pack.modular_encounter_sets.create(name: "Kree Fanatic")
  end
end
