class AddDraftAndPermalinkToPost < ActiveRecord::Migration
  def change
    add_column :posts, :dft, :boolean
    add_column :posts, :permalink, :string
  end
end
