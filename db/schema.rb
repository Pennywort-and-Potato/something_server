# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_02_26_134837) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collection_contents", force: :cascade do |t|
    t.bigint "collection_id"
    t.bigint "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "thumbnail"
    t.index ["collection_id"], name: "index_collection_contents_on_collection_id"
    t.index ["post_id"], name: "index_collection_contents_on_post_id"
  end

  create_table "collections", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_private", default: false
    t.string "thumbnail"
    t.boolean "is_deleted", default: false
    t.index ["user_id"], name: "index_collections_on_user_id"
  end

  create_table "contents", force: :cascade do |t|
    t.bigint "post_id"
    t.string "alt"
    t.string "src"
    t.string "content_type"
    t.bigint "view", default: 0
    t.bigint "like", default: 0
    t.bigint "dislike", default: 0
    t.float "rating", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_deleted", default: false
    t.index ["post_id"], name: "index_contents_on_post_id"
  end

  create_table "post_tags", force: :cascade do |t|
    t.bigint "tag_id"
    t.bigint "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_post_tags_on_post_id"
    t.index ["tag_id"], name: "index_post_tags_on_tag_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.string "body"
    t.bigint "view", default: 0
    t.bigint "like", default: 0
    t.bigint "dislike", default: 0
    t.float "rating", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_deleted", default: false
    t.string "thumbnail"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "tag"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "upload_pools", force: :cascade do |t|
    t.string "src"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.date "date_of_birth"
    t.string "email"
    t.string "role", default: "member"
    t.boolean "is_deleted", default: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
  end

  add_foreign_key "collection_contents", "collections", on_delete: :cascade
  add_foreign_key "collection_contents", "posts", on_delete: :cascade
  add_foreign_key "collections", "users", on_delete: :cascade
  add_foreign_key "contents", "posts", on_delete: :cascade
  add_foreign_key "post_tags", "posts", on_delete: :cascade
  add_foreign_key "post_tags", "tags", on_delete: :cascade
  add_foreign_key "posts", "users", on_delete: :cascade
end
