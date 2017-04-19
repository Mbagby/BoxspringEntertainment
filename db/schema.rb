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

ActiveRecord::Schema.define(version: 20170401020444) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "asset_libraries", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "file"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
    t.index ["user_id"], name: "index_asset_libraries_on_user_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "title"
    t.text     "description"
    t.string   "icon"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "snap_shot"
    t.string   "banner"
  end

  create_table "category_options", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "user_id"
    t.boolean  "message_board"
    t.boolean  "comment_section"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["category_id"], name: "index_category_options_on_category_id", using: :btree
    t.index ["user_id"], name: "index_category_options_on_user_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "body"
    t.string   "commentable_type"
    t.integer  "commentable_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "rate",             default: 0
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "subdivision"
    t.string   "contact_email"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "episodes", force: :cascade do |t|
    t.integer  "episode_id"
    t.integer  "series_id"
    t.integer  "topic_id"
    t.integer  "category_id"
    t.string   "title"
    t.text     "description"
    t.string   "icon"
    t.integer  "rating"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "snap_shot"
    t.integer  "season_id"
    t.string   "video_src"
  end

  create_table "mailboxer_conversation_opt_outs", force: :cascade do |t|
    t.string  "unsubscriber_type"
    t.integer "unsubscriber_id"
    t.integer "conversation_id"
    t.index ["conversation_id"], name: "index_mailboxer_conversation_opt_outs_on_conversation_id", using: :btree
    t.index ["unsubscriber_id", "unsubscriber_type"], name: "index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type", using: :btree
  end

  create_table "mailboxer_conversations", force: :cascade do |t|
    t.string   "subject",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "mailboxer_notifications", force: :cascade do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              default: ""
    t.string   "sender_type"
    t.integer  "sender_id"
    t.integer  "conversation_id"
    t.boolean  "draft",                default: false
    t.string   "notification_code"
    t.string   "notified_object_type"
    t.integer  "notified_object_id"
    t.string   "attachment"
    t.datetime "updated_at",                           null: false
    t.datetime "created_at",                           null: false
    t.boolean  "global",               default: false
    t.datetime "expires"
    t.index ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id", using: :btree
    t.index ["notified_object_id", "notified_object_type"], name: "index_mailboxer_notifications_on_notified_object_id_and_type", using: :btree
    t.index ["sender_id", "sender_type"], name: "index_mailboxer_notifications_on_sender_id_and_sender_type", using: :btree
    t.index ["type"], name: "index_mailboxer_notifications_on_type", using: :btree
  end

  create_table "mailboxer_receipts", force: :cascade do |t|
    t.string   "receiver_type"
    t.integer  "receiver_id"
    t.integer  "notification_id",                            null: false
    t.boolean  "is_read",                    default: false
    t.boolean  "trashed",                    default: false
    t.boolean  "deleted",                    default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.boolean  "is_delivered",               default: false
    t.string   "delivery_method"
    t.string   "message_id"
    t.index ["notification_id"], name: "index_mailboxer_receipts_on_notification_id", using: :btree
    t.index ["receiver_id", "receiver_type"], name: "index_mailboxer_receipts_on_receiver_id_and_receiver_type", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "body"
    t.string   "messageable_type"
    t.integer  "messageable_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["messageable_type", "messageable_id"], name: "index_messages_on_messageable_type_and_messageable_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "plans", force: :cascade do |t|
    t.string   "name"
    t.integer  "amount"
    t.string   "interval"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "quiz_id"
    t.integer  "episode_id"
    t.integer  "series_id"
    t.integer  "topic_id"
    t.integer  "category_id"
    t.string   "title"
    t.text     "question"
    t.string   "icon"
    t.integer  "value"
    t.string   "snap_shot"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "quizzes", force: :cascade do |t|
    t.integer  "quiz_id"
    t.integer  "episode_id"
    t.integer  "series_id"
    t.integer  "topic_id"
    t.integer  "category_id"
    t.string   "title"
    t.text     "description"
    t.string   "icon"
    t.integer  "score"
    t.string   "snap_shot"
    t.string   "answer"
    t.integer  "correctness"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "comment_id"
    t.integer  "user_id"
    t.integer  "score",      default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["comment_id"], name: "index_ratings_on_comment_id", using: :btree
    t.index ["user_id"], name: "index_ratings_on_user_id", using: :btree
  end

  create_table "seasons", force: :cascade do |t|
    t.integer  "series_id"
    t.integer  "topic_id"
    t.integer  "category_id"
    t.string   "title"
    t.text     "description"
    t.string   "icon"
    t.integer  "rating"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "snap_shot"
  end

  create_table "topics", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "title"
    t.text     "description"
    t.string   "icon"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "topic_id"
    t.string   "snap_shot"
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
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company_id"
    t.string   "employee_id"
    t.string   "avatar"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "user_type",              default: 0
    t.string   "card_token"
    t.integer  "plan_id"
    t.date     "end_date"
    t.string   "customer_id"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "asset_libraries", "users"
  add_foreign_key "category_options", "categories"
  add_foreign_key "category_options", "users"
  add_foreign_key "comments", "users"
  add_foreign_key "mailboxer_conversation_opt_outs", "mailboxer_conversations", column: "conversation_id", name: "mb_opt_outs_on_conversations_id"
  add_foreign_key "mailboxer_notifications", "mailboxer_conversations", column: "conversation_id", name: "notifications_on_conversation_id"
  add_foreign_key "mailboxer_receipts", "mailboxer_notifications", column: "notification_id", name: "receipts_on_notification_id"
  add_foreign_key "messages", "users"
  add_foreign_key "ratings", "comments"
  add_foreign_key "ratings", "users"
end
