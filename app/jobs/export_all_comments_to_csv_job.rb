require 'csv'
class ExportAllCommentsToCsvJob < ApplicationJob
  queue_as :default

  def perform(*args)
    csv_string = CSV.generate do |csv|
      csv << %w[author text post_id]
      Comment.all.each do |comment|
        csv << [comment[:author], comment[:text], comment[:post_id]]
      end
    end
    puts csv_string
  end
end
