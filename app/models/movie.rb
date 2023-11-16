class Movie < ApplicationRecord
  has_many :bookmarks
  before_destroy :check_if_associated_bookmarks

  validates :title, :overview, presence: true
  validates :title, uniqueness: true

  private

  def check_if_associated_bookmarks
    nil unless bookmarks.exists?
  end
end
