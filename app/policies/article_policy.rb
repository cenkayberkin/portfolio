class ArticlePolicy
  attr_accessor :user, :article

  def initialize(user, article)
    @user = user
    @article = article
  end

  def publish?
    @user.editor?
  end

  def update?
    @user.editor?
  end

  def destroy?
    @user.editor?
  end
end
