class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.references :article
      t.string :author
      t.text :content
      t.datetime :published_at

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
