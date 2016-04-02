Given /^the following movies exist:$/ do |table|
    table.hashes.each do |movie|
        new_movie = Movie.new
        new_movie.title = movie["title"]
        new_movie.rating = movie["rating"]
        new_movie.director = movie["director"]
        new_movie.release_date = Date.parse(movie["release_date"])
        new_movie.save!
    end
end

Then /^the director of "(.*)" should be "(.*)"$/ do |title, director|
    assert Movie.find_by_title(title).director == director
end

Then /^I should see "(.*)" has no director info$/ do |title|
    movie = Movie.find_by_title(title)
    assert movie.director == ""
end