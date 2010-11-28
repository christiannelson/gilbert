class Comment < ActiveRecord::Base

  belongs_to :article

  validates :author, :presence => true
  validates :content, :presence => true

  before_create do
    self.published_at = Time.now
  end

  after_save do
    Juggernaut.publish(article.channel, self.to_json)
  end

end
