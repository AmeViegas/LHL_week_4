class Song < ActiveRecord::Base
  validates :song_title,
  presence: true,
  length: { maximum: 40 }

  validates :author,
  presence: true,
  length: { maximum: 50 }

  validates_format_of :url,
  with: /\A(http(?:s)?).+/ , allow_blank: true
end
