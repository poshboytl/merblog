class Articles < Application
  # provides :xml, :yaml, :js
  params_accessible :put => [:title, :body, :slug]
  before :ensure_authenticated, :only => [:new,:edit,:create,:update,:destroy,:delete]
  
  def index
    q = params['q']
    unless q.blank? then
      @articles = Article.paginate :page => params[:page], :per_page => 5, :title.like => "%#{q}%", :order => [:created_at.desc] 
    else 
      @articles = Article.paginate :page => params[:page], :per_page => 5, :order => [:created_at.desc] 
    end
    display @articles
  end

  def show(id)
    @article = Article.get(id)
    @comment = Comment.new
    raise NotFound unless @article
    display @article
  end

  def new
    only_provides :html
    @article = Article.new
    display @article
  end

  def edit(id)
    only_provides :html
    @article = Article.get(id)
    raise NotFound unless @article
    display @article
  end

  def create(article)
    @article = Article.new(article)
    if @article.save
      redirect resource(:articles), :message => {:notice => "Article was successfully created"}
    else
      message[:error] = "Article failed to be created"
      render :new
    end
  end

  def update(id, article)
    @article = Article.get(id)
    raise NotFound unless @article
    if @article.update_attributes(article) && @article.save
       redirect resource(:articles)
    else
      display @article, :edit
    end
  end

  def destroy(id)
    @article = Article.get(id)
    raise NotFound unless @article
    if @article.destroy
      redirect resource(:articles)
    else
      raise InternalServerError
    end
  end
  
  def delete(id)
    @article = Article.get(id) 
    raise NotFound unless @article  
    if @article.destroy
      redirect resource(:articles)  
    else
      raise InternalServerError
    end
  end  

end # Articles
