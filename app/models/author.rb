class Author < ActiveRecord::Base
	include AuthorsHelper
	belongs_to :image
	
	validates :name, presence: true
	validates :email, presence: true, uniqueness: true, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i , on: :create} 
	validates :title, presence: true
	validates :description, presence: true
scope :by_jai, lambda {|a| Author.all.collect{|b|b.name}.grep(/Vis/)}
scope :tectra, lambda {|a| Author.find a}
end
