class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.column :title, :string
      t.column :permalink, :string
      t.column :body, :text
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
      t.timestamps
      end 
    Page.create(:title => "RailsCoders Home",
    :permalink => "welcome-page",
    :body => "Welcome to RailsCoders") 
  end
end
