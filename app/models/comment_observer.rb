class CommentObserver < ActiveRecord::Observer

  def after_create(comment)
    #do something ...
    @comment = comment
  end

end
