class Article < ActiveRecord::Base

  has_many :comments, :dependent => :destroy

  validates :title, :presence => true
  validates :author, :presence => true
  validates :content, :presence => true

  before_save do
    self.published_at = Time.now
  end

  def channel
    "article-#{id}"
  end

end
