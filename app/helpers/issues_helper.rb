module IssuesHelper
  def opened_date_of(issue)
    issue.created_at.strftime('%B %d, %Y')
  end
end
