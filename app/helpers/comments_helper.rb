module CommentsHelper
	def counter_comment(comment)
		if(comment.length <= 1)
			comment.length.to_s + " comment"
		else
			comment.length.to_s + " comments"
		end
	end
end
