class Type < ActiveRecord::Base
  has_many :products

  before_save :underscores_to_spaces!

  protected
    def underscores_to_spaces!
      self.name.gsub!('_', ' ')
    end
end
