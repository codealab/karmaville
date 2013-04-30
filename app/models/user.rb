class User < ActiveRecord::Base
  has_many :karma_points

  attr_accessible :first_name, :last_name, :email, :username, :karma_points_count

  validates :first_name, :presence => true
  validates :last_name, :presence => true

  validates :username,
            :presence => true,
            :length => {:minimum => 2, :maximum => 32},
            :format => {:with => /^\w+$/},
            :uniqueness => {:case_sensitive => false}

  validates :email,
            :presence => true,
            :format => {:with => /^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/i},
            :uniqueness => {:case_sensitive => false}

  DISPLAY_PER_PAGE = 50

  def self.by_karma
    # joins(:karma_points).group('users.id').order('SUM(karma_points.value) DESC')
    order('karma_points_count DESC')
  end

  def total_karma
    # self.karma_points.sum(:value)
    karma_points_count
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.page(page_num = 1)
    limit(DISPLAY_PER_PAGE).offset(DISPLAY_PER_PAGE * (page_num-1))
  end
end
