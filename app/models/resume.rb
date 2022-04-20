class Resume < ApplicationRecord
    extend FriendlyId
    friendly_id :random_slug, use: :slugged

    # validations
    validates :title, presence: true
    validates :content, presence: true

    # scope
  scope :published, -> { where(status: "published") }
  scope :draft, -> { where(status: "draft") }


    # relationships
    belongs_to :user
    def self.all_status
        [
            ["草稿","draft"],
            ["公開","published"],
        ]
    end
    private
    def random_slug
        [*'a'..'z',*'0'..'9',"-","_"].sample(10).join
    end
end
