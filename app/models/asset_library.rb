class AssetLibrary < ApplicationRecord
  mount_uploader :file, FileUploader
  belongs_to :user
end
