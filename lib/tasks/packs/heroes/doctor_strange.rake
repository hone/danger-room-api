namespace :packs do
  desc "Insert Hero: Doctor Strange"
  task :doctor_strange => :environment do
    pack_name = "Doctor Strange"
    puts "Hero: #{pack_name}"
    pack = Pack.create(name: pack_name, pack_type: :hero)
    pack.identities.create(alter_ego: "Stephen Strange", hero: pack_name)
  end
end
