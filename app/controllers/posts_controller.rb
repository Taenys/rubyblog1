class PostsController < ApplicationController

  before_action :set_post, only:[:show, :edit, :update, :destroy]

  def index
    # permet l'affichage de msg d'alerte seulement une fois
    # flash.now[:success] = "Salut"
    @posts = Post.all
    respond_to do |format|
      format.html
      format.json {render json: @posts}
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json {render json: @post}

    end
  end

  def edit
  end

  def update
   if @post.update(post_params)
    redirect_to posts_path, success: "L'article à bien été modifié"
   else
     render 'edit'
     end
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create(post_params)
    redirect_to post_path(post.id), success: "L'article à bien été créer"
  end

  def destroy
    @post.destroy
    redirect_to posts_path, success: "L'article à bien été supprimé"
  end

  private

  def post_params
    params.require(:post).permit(:name, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
