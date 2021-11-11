class Import < ApplicationRecord
  mount_uploader :file, ImportFileUploader
end
