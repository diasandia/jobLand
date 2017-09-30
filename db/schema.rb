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

ActiveRecord::Schema.define(version: 20170930012825) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "CalendarEvents", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "location"
    t.bigint "user_id"
    t.string "attendable_type", null: false
    t.bigint "attendable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attendable_type", "attendable_id"], name: "index_CalendarEvents_on_attendable_type_and_attendable_id"
    t.index ["user_id"], name: "index_CalendarEvents_on_user_id"
  end

  create_table "job_steps", force: :cascade do |t|
    t.bigint "step_id"
    t.boolean "complete"
    t.integer "users_jobs_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["step_id"], name: "index_job_steps_on_step_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "company"
    t.string "job_title"
    t.string "url"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "networking_events", force: :cascade do |t|
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.string "description"
    t.bigint "user_id"
    t.string "notable_type", null: false
    t.bigint "notable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notable_type", "notable_id"], name: "index_notes_on_notable_type_and_notable_id"
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "point_categories", force: :cascade do |t|
    t.string "source"
    t.integer "number_of_points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "steps", force: :cascade do |t|
    t.string "step_text"
    t.string "phase_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_jobs", force: :cascade do |t|
    t.bigint "job_id"
    t.bigint "user_id"
    t.integer "criteria_one_score"
    t.integer "criteria_two_score"
    t.integer "criteria_three_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_user_jobs_on_job_id"
    t.index ["user_id"], name: "index_user_jobs_on_user_id"
  end

  create_table "user_points", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "point_categories_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["point_categories_id"], name: "index_user_points_on_point_categories_id"
    t.index ["user_id"], name: "index_user_points_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "criteria_one"
    t.string "criteria_two"
    t.string "criteria_three"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
