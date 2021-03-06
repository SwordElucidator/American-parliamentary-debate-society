# Add a declarative step here for populating the DB with movies.

Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    User.create(user)
  end
end

Given /the following contents exist/ do |contents_table|
  contents_table.hashes.each do |content|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Content.create(content)
  end
end

Given /the following posts exist/ do |post_table|
  post_table.hashes.each do |po|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Post.create(po)
  end
end

Given /the following sections exist/ do |section_table|
  section_table.hashes.each do |po|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Section.create(po)
  end
end

Given /the following debates exist/ do |debate_table|
  debate_table.hashes.each do |debate|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Debate.create(debate)
  end
end

Given /the following slots exist/ do |slot_table|
  slot_table.hashes.each do |slot|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Slot.create(slot)
  end
end

Given /the following invitation codes exist/ do |code_table|
  code_table.hashes.each do |code|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Invitation.create(code)
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page



# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  rating_list.split(", ").each do |rate|
    uncheck ? uncheck(rate) : check(rate)
  end
end

