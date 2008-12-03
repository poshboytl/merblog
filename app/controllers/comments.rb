class Comments < Application
  # provides :xml, :yaml, :js

  def create(comment)
    @article = Article.get(params[:article_id].to_i)
    @article.comments.new(comment)
    if @article.save
      # redirect resource(@comment), :message => {:notice => "Comment was successfully created"}
       redirect resource(@article), :message => {:notice => "Mesaage was successfully left"}
    else
      message[:error] = "Comment failed to be created"
      redirect resource(@article)
    end
  end

end # Comments
