class PitchDeck < ApplicationRecord
  mount_uploader :file, PitchDeckUploader

  belongs_to :project
  has_many :slides

  delegate :current_path, to: :file

  validates :file, presence: true
  validates :project, presence: true

  after_create :extract_and_upload_slides

  def slide_image_urls
    slides.map{ |slide| slide.image.url }
  end

  private

  def tmp_pdf
    return if File.extname(current_path) == '.pdf'

    Docsplit.extract_images(current_path, output: '/tmp').first
  end

  def extract_and_upload_slides
    image = MiniMagick::Image.open(tmp_pdf || current_path)
    image.pages.each do |page|
      page.format 'png'
      page.background 'white'
      page.flatten
      slides << Slide.new(image: page)
    end
  end
end
