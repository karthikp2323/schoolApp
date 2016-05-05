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

ActiveRecord::Schema.define(version: 20160504151225) do

  create_table "activities", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.text     "message",            limit: 65535
    t.boolean  "activity_type"
    t.boolean  "allow_comment"
    t.integer  "classroom_id",       limit: 4
    t.integer  "school_user_id",     limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.integer  "school_id",          limit: 4
    t.integer  "student_id",         limit: 4
  end

  add_index "activities", ["classroom_id"], name: "index_activities_on_classroom_id", using: :btree
  add_index "activities", ["school_id"], name: "index_activities_on_school_id", using: :btree
  add_index "activities", ["school_user_id"], name: "index_activities_on_school_user_id", using: :btree
  add_index "activities", ["student_id"], name: "index_activities_on_student_id", using: :btree

  create_table "class_registrations", force: :cascade do |t|
    t.integer  "classroom_id", limit: 4
    t.integer  "student_id",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "class_registrations", ["classroom_id"], name: "index_class_registrations_on_classroom_id", using: :btree
  add_index "class_registrations", ["student_id"], name: "index_class_registrations_on_student_id", using: :btree

  create_table "classrooms", force: :cascade do |t|
    t.string   "class_name",     limit: 255
    t.string   "class_location", limit: 255
    t.string   "class_level",    limit: 255
    t.integer  "school_id",      limit: 4
    t.integer  "school_user_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "classrooms", ["school_id"], name: "index_classrooms_on_school_id", using: :btree
  add_index "classrooms", ["school_user_id"], name: "index_classrooms_on_school_user_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "comment_text",   limit: 65535
    t.integer  "activity_id",    limit: 4
    t.integer  "parent_id",      limit: 4
    t.integer  "school_user_id", limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "comments", ["activity_id"], name: "index_comments_on_activity_id", using: :btree
  add_index "comments", ["parent_id"], name: "index_comments_on_parent_id", using: :btree
  add_index "comments", ["school_user_id"], name: "index_comments_on_school_user_id", using: :btree

  create_table "event_statuses", force: :cascade do |t|
    t.integer  "parent_id_declined", limit: 4
    t.integer  "event_id",           limit: 4
    t.integer  "parent_id",          limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "event_statuses", ["event_id"], name: "index_event_statuses_on_event_id", using: :btree
  add_index "event_statuses", ["parent_id"], name: "index_event_statuses_on_parent_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "event_title",       limit: 255
    t.string   "event_description", limit: 255
    t.date     "event_date"
    t.string   "event_time",        limit: 255
    t.string   "event_location",    limit: 255
    t.integer  "school_user_id",    limit: 4
    t.integer  "classroom_id",      limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.date     "event_end_time"
    t.integer  "school_id",         limit: 4
  end

  add_index "events", ["classroom_id"], name: "index_events_on_classroom_id", using: :btree
  add_index "events", ["school_id"], name: "index_events_on_school_id", using: :btree
  add_index "events", ["school_user_id"], name: "index_events_on_school_user_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.text     "message_text", limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "receiver_id",  limit: 4
    t.integer  "sender_id",    limit: 4
    t.string   "subject",      limit: 255
    t.integer  "school_id",    limit: 4
    t.integer  "classroom_id", limit: 4
  end

  add_index "messages", ["classroom_id"], name: "index_messages_on_classroom_id", using: :btree
  add_index "messages", ["receiver_id"], name: "index_messages_on_receiver_id", using: :btree
  add_index "messages", ["school_id"], name: "index_messages_on_school_id", using: :btree
  add_index "messages", ["sender_id"], name: "index_messages_on_sender_id", using: :btree

  create_table "messages_and_events_count_for_parents", force: :cascade do |t|
    t.integer  "unread_messages", limit: 4
    t.integer  "unread_events",   limit: 4
    t.integer  "parent_id",       limit: 4
    t.integer  "school_user_id",  limit: 4
    t.integer  "school_id",       limit: 4
    t.integer  "classroom_id",    limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "messages_and_events_count_for_parents", ["classroom_id"], name: "index_messages_and_events_count_for_parents_on_classroom_id", using: :btree
  add_index "messages_and_events_count_for_parents", ["parent_id"], name: "index_messages_and_events_count_for_parents_on_parent_id", using: :btree
  add_index "messages_and_events_count_for_parents", ["school_id"], name: "index_messages_and_events_count_for_parents_on_school_id", using: :btree
  add_index "messages_and_events_count_for_parents", ["school_user_id"], name: "index_messages_and_events_count_for_parents_on_school_user_id", using: :btree

  create_table "parents", force: :cascade do |t|
    t.string   "mom_fname",                             limit: 255
    t.string   "mom_lname",                             limit: 255
    t.string   "dad_fname",                             limit: 255
    t.string   "dad_lname",                             limit: 255
    t.string   "email_id",                              limit: 255
    t.string   "contact",                               limit: 255
    t.string   "login_id",                              limit: 255
    t.string   "password",                              limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.integer  "{:index=>true, :foreign_key=>true}_id", limit: 4
    t.string   "image_file_name",                       limit: 255
    t.string   "image_content_type",                    limit: 255
    t.integer  "image_file_size",                       limit: 4
    t.datetime "image_updated_at"
  end

  create_table "push_notifications_for_parents", force: :cascade do |t|
    t.string   "devise_type",  limit: 255
    t.string   "devise_token", limit: 255
    t.integer  "parent_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "push_notifications_for_parents", ["parent_id"], name: "index_push_notifications_for_parents_on_parent_id", using: :btree

  create_table "push_notifications_for_schoo_users", force: :cascade do |t|
    t.string   "devise_type",    limit: 255
    t.string   "devise_token",   limit: 255
    t.integer  "school_user_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "push_notifications_for_schoo_users", ["school_user_id"], name: "index_push_notifications_for_schoo_users_on_school_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "role_type",  limit: 25
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "school_users", force: :cascade do |t|
    t.string   "first_name",                            limit: 255
    t.string   "last_name",                             limit: 255
    t.string   "email_id",                              limit: 255
    t.string   "contact",                               limit: 255
    t.string   "login_id",                              limit: 255
    t.integer  "role_id",                               limit: 4
    t.integer  "school_id",                             limit: 4
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "password_digest",                       limit: 255
    t.integer  "{:index=>true, :foreign_key=>true}_id", limit: 4
    t.string   "image_file_name",                       limit: 255
    t.string   "image_content_type",                    limit: 255
    t.integer  "image_file_size",                       limit: 4
    t.datetime "image_updated_at"
  end

  add_index "school_users", ["role_id"], name: "index_school_users_on_role_id", using: :btree
  add_index "school_users", ["school_id"], name: "index_school_users_on_school_id", using: :btree

  create_table "schools", force: :cascade do |t|
    t.string   "school_name",    limit: 100
    t.string   "address_line1",  limit: 100
    t.string   "address_line2",  limit: 100
    t.string   "city",           limit: 100
    t.string   "zip",            limit: 100
    t.string   "state",          limit: 100
    t.string   "country",        limit: 100
    t.string   "fax",            limit: 15
    t.string   "contact",        limit: 15
    t.string   "working_hours",  limit: 50
    t.string   "contact_person", limit: 100
    t.string   "email_id",       limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "studentlogindetails", force: :cascade do |t|
    t.string   "login_id",        limit: 255
    t.string   "password_digest", limit: 255
    t.integer  "student_id",      limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "studentlogindetails", ["student_id"], name: "index_studentlogindetails_on_student_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "first_name",        limit: 255
    t.string   "last_name",         limit: 255
    t.date     "dob"
    t.string   "emergency_contact", limit: 255
    t.string   "address_line1",     limit: 255
    t.string   "address_line2",     limit: 255
    t.string   "city",              limit: 255
    t.string   "zip",               limit: 255
    t.string   "state",             limit: 255
    t.string   "country",           limit: 255
    t.integer  "school_id",         limit: 4
    t.integer  "parent_id",         limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "IsLogIn"
    t.string   "email_id",          limit: 255
  end

  add_index "students", ["parent_id"], name: "index_students_on_parent_id", using: :btree
  add_index "students", ["school_id"], name: "index_students_on_school_id", using: :btree

  create_table "unread_count_for_school_users", force: :cascade do |t|
    t.integer  "unread_messages", limit: 4
    t.integer  "unread_events",   limit: 4
    t.integer  "parent_id",       limit: 4
    t.integer  "school_user_id",  limit: 4
    t.integer  "school_id",       limit: 4
    t.integer  "classroom_id",    limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "unread_count_for_school_users", ["classroom_id"], name: "index_unread_count_for_school_users_on_classroom_id", using: :btree
  add_index "unread_count_for_school_users", ["parent_id"], name: "index_unread_count_for_school_users_on_parent_id", using: :btree
  add_index "unread_count_for_school_users", ["school_id"], name: "index_unread_count_for_school_users_on_school_id", using: :btree
  add_index "unread_count_for_school_users", ["school_user_id"], name: "index_unread_count_for_school_users_on_school_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "activities", "classrooms"
  add_foreign_key "activities", "school_users"
  add_foreign_key "activities", "schools"
  add_foreign_key "activities", "students"
  add_foreign_key "class_registrations", "classrooms"
  add_foreign_key "class_registrations", "students"
  add_foreign_key "classrooms", "school_users"
  add_foreign_key "classrooms", "schools"
  add_foreign_key "comments", "activities"
  add_foreign_key "comments", "parents"
  add_foreign_key "comments", "school_users"
  add_foreign_key "event_statuses", "events"
  add_foreign_key "event_statuses", "parents"
  add_foreign_key "events", "classrooms"
  add_foreign_key "events", "school_users"
  add_foreign_key "events", "schools"
  add_foreign_key "messages", "classrooms"
  add_foreign_key "messages", "schools"
  add_foreign_key "messages_and_events_count_for_parents", "classrooms"
  add_foreign_key "messages_and_events_count_for_parents", "parents"
  add_foreign_key "messages_and_events_count_for_parents", "school_users"
  add_foreign_key "messages_and_events_count_for_parents", "schools"
  add_foreign_key "push_notifications_for_parents", "parents"
  add_foreign_key "push_notifications_for_schoo_users", "school_users"
  add_foreign_key "school_users", "roles"
  add_foreign_key "school_users", "schools"
  add_foreign_key "studentlogindetails", "students"
  add_foreign_key "students", "parents"
  add_foreign_key "students", "schools"
  add_foreign_key "unread_count_for_school_users", "classrooms"
  add_foreign_key "unread_count_for_school_users", "parents"
  add_foreign_key "unread_count_for_school_users", "school_users"
  add_foreign_key "unread_count_for_school_users", "schools"
end
