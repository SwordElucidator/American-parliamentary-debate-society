# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160415210210) do

  create_table "comments", force: :cascade do |t|
    t.text     "comment"
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "contents", force: :cascade do |t|
    t.string "heading_title",         default: "The Debate Society of Berkeley"
    t.text   "heading_content",       default: ""
    t.string "heading_image_url"
    t.string "about_title",           default: "We're the Debate Society of Berkeley!"
    t.text   "about_content",         default: "We compete in the American Parliamentary Debate Association (APDA) circuit, which has member schools nationwide, but is most prominent along the East Coast. We've travelled to tournaments at UChicago, Harvard, Stanford, Brown, and many more - we're also holding our own tournament this spring, in late February.\n\nNetworking is an important part of debate culture. Many debaters in this league go on to become lawyers from the top 14 schools, join well-reputed consulting firms, and run for political office. If you have any intention of pursuing those kinds of career paths, you'd feel right at home in APDA.\n\nNew debaters don't need to be focused on becoming lawyers or Senators to get the most out of our team though: honing public speaking ability, mastering the elements of grounded and coherent argumentation, and understanding how to pick apart even the strongest opposition, are useful skills for any career.\n\nNo prior debate experience is necessary! The style of the APDA circuit is similar to some styles of high school debate, but is different in some very crucial ways, so all new members will have a thing or two to learn."
    t.string "announcements_heading", default: "Announcements"
    t.text   "announcements_content", default: "This is a sample announcement.\n\nLorem ipsum dolor sit amet, ea mollis invenire conclusionemque mel, oblique constituam ea per. Te putent inciderint comprehensam vel, te iudico homero gubergren pro. Te qui timeam senserit referrentur. Eos at elit debet, admodum nostrum ad mea. Tantas legere tritani eam in. Id ius idque minim blandit, nobis quidam assueverit ad vim, ancillae scaevola no est."
  end

  create_table "debates", force: :cascade do |t|
    t.string   "topic"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "time"
  end

  create_table "invitations", force: :cascade do |t|
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "login_users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "section_id"
  end

  create_table "sections", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sign_users", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "slots", force: :cascade do |t|
    t.string   "slottype"
    t.string   "status"
    t.datetime "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "debate_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "major"
    t.datetime "time"
    t.boolean  "is_admin"
    t.string   "code"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
