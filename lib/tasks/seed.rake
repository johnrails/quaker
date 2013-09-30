namespace :seed do
	desc "Seeding earthquake data"
	task :seed_data => :environment do
    sh "/usr/local/mysql/bin/mysql -u root quaker_development < #{Rails.root}/db/states.sql"
		Earthquake.seed_data
	end
end