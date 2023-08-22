require 'carrierwave/orm/activerecord'
require 'file_size_validator'

class Note < ActiveRecord::Base
    belongs_to :project
    belongs_to :noteable, :polymorphic => true

    belongs_to :author,
        :class_name => "usuário"

    attr_protected :author, :author_id

    validates_presence_of :project

    validates :note,
              :presence => true,
              :length   => { :within => 0..255 }

    validates :attachment,
              :file_size => {
                  :maximum => 10.megabytes.to_i
              }

    scope :common, where(:noteable_id => nil)

    mount_uploader :attachment, AttachmentUploader
end

# == informação de schema
#
# nome de tabela: notes
#
# id            :integer
#
# note          :string(255)
# noteable_id   :string(255)
# noteable_type :string(255)
#
# author_id     :integer
# project_id    :integer
#
# created_at    :datetime
# updated_at    :datetime
#
# attachment    :string(255)
