class Pin < ApplicationRecord
  has_one_attached :image
  has_one_attached :file
  validates :title,presence: true
  validate :acceptable_image_type?

  def acceptable_image_type?
    return unless image.attached?
    return if image.content_type.in? ["image/png", "image/jpeg"]
    errors.add :image, "must be a PNG or JPG"
  end
  validate :acceptable_image_size?

  def acceptable_image_size?
      return unless image.attached?
      return unless image.byte_size > 5.kilobytes
      errors.add :image, "is over 5kB"
  end
  validate :check_file_type

  private

  def check_file_type
    if file.attached? && !file.content_type.in?(%w(application/msword application/pdf application/vnd.openxmlformats-officedocument.wordprocessingml.document application/vnd.ms-excel application/vnd.openxmlformats-officedocument.spreadsheetml.sheet text/plain))
      file.purge # delete the uploaded file
      errors.add(:file, 'Must be any of one PDF,  DOC , DOCX , XLS , XLSX ,TEXT file')
    end
  end
  validate :acceptable_file_size?

  def acceptable_file_size?
      return unless file.attached?
      return unless file.byte_size > 100.kilobytes
      errors.add :file, "is over 100kB"
  end
end
