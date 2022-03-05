class Quote < ApplicationRecord
  belongs_to :company

  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }

  # after_create_commit: Everytime a new quote is inserted into database.
  # after_create_commit -> { broadcast_prepend_later_to "quotes" }
  # after_update_commit -> { broadcast_replace_later_to "quotes" }
  # after_destroy_commit -> { broadcast_remove_later_to "quotes" }

  # Those three callbacks are equivalent to the following single line
  # broadcasts_to ->(quote) { "quotes" }, inserts_by: :prepend => This line will be created same channel to all users. It's is a big security concern.
  broadcasts_to ->(quote) { [quote.company, "quotes"] }, inserts_by: :prepend
end
