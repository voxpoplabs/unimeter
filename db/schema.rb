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

ActiveRecord::Schema.define(version: 2019_06_21_164306) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "adminpack"
  enable_extension "plpgsql"

  create_table "articles", id: :serial, force: :cascade do |t|
    t.text "title"
    t.integer "promise_id"
    t.date "date"
    t.string "link_url"
    t.text "link_name"
    t.text "paragraph1"
    t.text "paragraph2"
    t.text "paragraph3"
    t.text "note"
    t.text "note_b"
    t.date "date_b"
    t.string "link_url_b"
    t.text "link_name_b"
    t.text "paragraph1_b"
    t.text "paragraph2_b"
    t.text "paragraph3_b"
    t.text "title_b"
    t.integer "article_status"
    t.index ["promise_id"], name: "index_articles_on_promise_id"
  end

  create_table "blogposts", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "meter_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meter_id"], name: "index_blogposts_on_meter_id"
    t.index ["user_id"], name: "index_blogposts_on_user_id"
  end

  create_table "contacts", id: :serial, force: :cascade do |t|
    t.text "description"
    t.string "name"
    t.string "email"
    t.string "nickname"
  end

  create_table "invite_codes", id: :serial, force: :cascade do |t|
    t.string "code"
    t.boolean "active"
  end

  create_table "logs", force: :cascade do |t|
    t.string "action"
    t.integer "old_status"
    t.integer "new_status"
    t.bigint "promise_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "article_reference"
    t.index ["promise_id"], name: "index_logs_on_promise_id"
  end

  create_table "meters", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "subdomain"
    t.text "description"
    t.string "facebook_key"
    t.string "twitter_key"
    t.string "disqus_key"
    t.string "individual_name"
    t.date "date_elected"
    t.text "about"
    t.string "domain"
    t.text "updates"
    t.text "b_description"
    t.text "b_about"
    t.text "b_updates"
    t.string "category1"
    t.string "category2"
    t.string "category3"
    t.string "category4"
    t.string "category5"
    t.string "category6"
    t.string "category7"
    t.string "icon_category1"
    t.string "icon_category2"
    t.string "icon_category3"
    t.string "icon_category4"
    t.string "icon_category5"
    t.string "icon_category6"
    t.string "icon_category7"
    t.integer "default_category"
    t.boolean "bilingual"
    t.string "b_status1"
    t.string "b_status2"
    t.string "b_status3"
    t.string "b_status4"
    t.string "b_category1"
    t.string "b_category2"
    t.string "b_category3"
    t.string "b_category4"
    t.string "b_category5"
    t.string "b_category6"
    t.string "b_category7"
    t.string "b_language"
    t.string "b_text_days"
    t.string "country"
    t.string "level"
    t.date "date_office"
    t.string "name"
    t.string "b_text_of"
    t.string "ads"
    t.string "province"
    t.string "image_logo"
    t.string "image_politician"
    t.string "status1"
    t.string "status2"
    t.string "status3"
    t.string "status4"
    t.string "patreon_key"
    t.text "rules"
    t.text "b_rules"
    t.integer "description_width"
    t.string "text_days"
    t.string "text_of"
    t.boolean "show_date"
    t.boolean "direction"
    t.boolean "b_direction"
    t.string "meter_type"
    t.string "text_about"
    t.string "text_analytics"
    t.string "text_blog"
    t.string "text_rules"
    t.string "b_text_about"
    t.string "b_text_analytics"
    t.string "b_text_blog"
    t.string "b_text_rules"
    t.boolean "has_logs"
    t.string "google_analytics_code"
    t.index ["user_id", "created_at"], name: "index_meters_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_meters_on_user_id"
  end

  create_table "plans", force: :cascade do |t|
    t.string "plan_name"
    t.string "plan_description"
    t.float "const"
    t.string "strip_plan_id"
  end

  create_table "promises", id: :serial, force: :cascade do |t|
    t.text "description"
    t.integer "meter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "subcategory"
    t.string "description_b"
    t.string "source_link_url"
    t.string "source_link_url_b"
    t.string "source_link_name"
    t.string "source_link_name_b"
    t.string "source_section"
    t.string "source_section_b"
    t.date "source_date"
    t.date "source_date_b"
    t.integer "category"
    t.string "subcategory_b"
    t.integer "status"
    t.index ["meter_id"], name: "index_promises_on_meter_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "stripe_token"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "plan_id"
    t.string "stripe_customer_id"
    t.string "name"
    t.date "end_date"
    t.boolean "canceled"
    t.index ["plan_id"], name: "index_subscriptions_on_plan_id"
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.string "invite_code"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "articles", "promises"
  add_foreign_key "blogposts", "meters"
  add_foreign_key "blogposts", "users"
  add_foreign_key "logs", "promises"
  add_foreign_key "meters", "users"
  add_foreign_key "promises", "meters"
  add_foreign_key "subscriptions", "plans"
  add_foreign_key "subscriptions", "users"
end
