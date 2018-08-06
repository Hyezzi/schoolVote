class Pledgenewee < ActiveRecord::Base
    mount_uploader :image, S3Uploader
    mount_uploader :image2, S3Uploader
end
