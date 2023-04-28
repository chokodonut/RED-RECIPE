class User < ApplicationRecord
  with_options presence: true do
    validates :name
  end
  has_many :relationships, foreign_key: :following_id
  has_many :followings, through: :relationships, source: :follower

  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: :follower_id
  has_many :followers, through: :reverse_of_relationships, source: :following

  def is_followed_by?(user)
    reverse_of_relationships.find_by(following_id: user.id).present?
  end

  has_one_attached :image
  has_one_attached :back_image
  has_many :recipes, dependent: :destroy
  has_many :book_marks, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :comments, dependent: :destroy

  def already_book_mark?(recipe)
    self.book_marks.exists?(recipe_id: recipe.id)
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def self.guest
    find_or_create_by!(email: 'guest@example.com', name: 'ゲスト') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  def user_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def page_image(width, height)
    unless back_image.attached?
      file_path = Rails.root.join('app/assets/images/25486701_l.jpg')
      back_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    back_image.variant(resize_to_limit: [width, height]).processed
  end

  def self.users_search(keyword)
    if keyword.present?
      users = User.where('name LIKE ?', "%#{keyword}%")
      if users.present?
        return users
      end
    end
    User.all
  end

end
