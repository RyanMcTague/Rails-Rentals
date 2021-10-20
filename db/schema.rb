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

ActiveRecord::Schema.define(version: 2021_10_20_135519) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.integer "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "fines", force: :cascade do |t|
    t.integer "rental_transaction_id", null: false
    t.decimal "amount", default: "0.0"
    t.boolean "paid", default: false
    t.datetime "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["rental_transaction_id"], name: "index_fines_on_rental_transaction_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", default: "Movie Description..."
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "active", default: true
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "rental_id", null: false
    t.integer "movie_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "audio_rating", default: 5
    t.integer "effects_rating", default: 5
    t.integer "plot_rating", default: 5
    t.integer "experience_rating", default: 5
    t.index ["movie_id"], name: "index_ratings_on_movie_id"
    t.index ["rental_id"], name: "index_ratings_on_rental_id"
  end

  create_table "rental_transactions", force: :cascade do |t|
    t.decimal "price", default: "0.0"
    t.integer "rental_id", null: false
    t.integer "user_id", null: false
    t.string "given_condition", default: "0"
    t.string "returned_condition", default: "0"
    t.integer "state", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "due"
    t.boolean "rated", default: false
    t.index ["rental_id"], name: "index_rental_transactions_on_rental_id"
    t.index ["user_id"], name: "index_rental_transactions_on_user_id"
  end

  create_table "rentals", force: :cascade do |t|
    t.string "condition", default: "new"
    t.integer "movie_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "state", default: 0
    t.integer "user_id"
    t.index ["movie_id"], name: "index_rentals_on_movie_id"
    t.index ["user_id"], name: "index_rentals_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.boolean "is_admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "fines", "rental_transactions"
  add_foreign_key "ratings", "movies"
  add_foreign_key "ratings", "rentals"
  add_foreign_key "rental_transactions", "rentals"
  add_foreign_key "rental_transactions", "users"
  add_foreign_key "rentals", "movies"
  add_foreign_key "rentals", "users"
end
