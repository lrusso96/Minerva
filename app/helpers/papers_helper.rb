module PapersHelper
  def upload_day_of(paper)
    paper.created_at.strftime('%B %d, %Y')
  end
end
