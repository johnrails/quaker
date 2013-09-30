namespace :seed do
	desc "Seeding earthquake data"
	task :seed_data => :environment do
		Earthquake.seed_data
	end
end