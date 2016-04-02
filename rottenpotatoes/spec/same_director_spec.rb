require 'spec_helper'

RSpec.describe MoviesController, type: :controller do
    before(:each) do
        movies =[   {:title => 'Star Wars', :rating => 'PG', :director => 'George Lucas', :release_date => '1977-05-25'},
                    {:title => 'Blade Runner', :rating => 'PG', :director => 'Ridley Scott', :release_date => '1982-06-25'},
                    {:title => 'Alien', :rating => 'R', :director => '', :release_date => '1979-05-25'},
                    {:title => 'THX-1138', :rating => 'R', :director => 'George Lucas', :release_date => '1971-03-11'}  ]
        movies.each do |movie|
            Movie.create!(movie)
        end
    end

    describe "#find_with_same_director" do
        it "should return 2 movies for George Lucas" do
            expect(Movie.find(1).find_with_same_director.count).to eq(2)
        end
        it "should return 1 movies for blank" do
            expect(Movie.find(3).find_with_same_director.count).to eq(1)
        end
    end
    
    describe ".index" do
        it "should have 4 movies" do
            get :index
            expect(controller.instance_variable_get(:@movies).count).to eq(4)
        end
    end 
    
    describe ".director" do
        it "should have 2 movies for George" do
            get :director, id:1
            expect(controller.instance_variable_get(:@movies).count).to eq(2)
        end
        it "should be on home for blank" do
            get :director, id:3
            expect(controller.instance_variable_get(:@movies).nil?).to eq(true)
        end
    end
end