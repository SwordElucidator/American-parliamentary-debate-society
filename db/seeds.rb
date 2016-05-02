# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Content.create([{heading_title: 'Debate Society of Berkeley'},
                {about_title: 'About'},
                {about_content: 'Placeholder'},
                {announcements_heading: 'Announcements'},
                {announcements_content: 'Placeholder'}])
Section.create([{title: 'General'}, {title: 'Topic 1'}, {title: 'Topic 2'}])
require 'digest/sha1'
email = "admin@gmail.com"
code = Digest::SHA1.hexdigest(email)
Invitation.create(code: code)
User.create(email: email, password: "adminadmin", password_confirmation: "adminadmin", code: code, is_admin: true)