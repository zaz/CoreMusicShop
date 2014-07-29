class Type < ActiveRecord::Base
  belongs_to :parent, class_name: :type
  has_many :children, class_name: :type

  before_save :underscores_to_spaces!

  protected
    def underscores_to_spaces!
      self.name.gsub!('_', ' ')
    end
end
