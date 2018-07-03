module IssuesHelper
  def opened_date_of(issue)
    issue.created_at.strftime('%B %d, %Y')
  end

  def closed_date_of(issue)
    issue.updated_at.strftime('%B %d, %Y')
  end
end
