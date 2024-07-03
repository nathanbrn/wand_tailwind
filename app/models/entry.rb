class Entry < ApplicationRecord
  belongs_to :category

  validates :description, :amount, :status, :entry_type, :category_id, presence: true

  scope :por_tipo, ->(entry_type) { where(entry_type: entry_type).includes(:category) }
  scope :soma_valores, ->(entry_type) { where(entry_type: entry_type) }
  scope :soma_despesas_pendentes, -> { where(status: false) }
end
