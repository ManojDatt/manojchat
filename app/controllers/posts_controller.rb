class PostsController < ApplicationController
	before_action :idset , only:[:show,:edit,:destroy,:likeonpost,:update,:postcomment]
  def index
  
		@post1=Post.where("id!=?",session[:user_id]).all.order("created_at DESC")
		if session[:user_id]
      @us=User.find(session[:user_id])
			@post=Post.where("user_id=?",@us).all
		end
  end
  def new
  @post=Post.new
  end

  def show
  end
  def create
  @post=Post.new(param_set)
  @post.user_id=session[:user_id]
  @post.user_type=current_user.user_type
  if @post.save
  	redirect_to home_path ,notice: "Posted Succesfully.."
  else
  	render'new'
  end
  end
  def edit
  end
  def update
    if @post.update(param_set)
      redirect_to home_path,notice:"Post updated.."
    else
      render 'edit'
    end

  end
  def destroy
    @post.destroy
    redirect_to home_path ,notice:"Post deleted succesfully.."
  end
#============================#####################=============
 

  def postcomment


     @comment=@post.comments.create(param_set)
     @comment.user_id=session[:user_id]
     @comment.user_type=User.find(session[:user_id]).user_type
     if@comment.save
      redirect_to posts_path ,notice:"You commented on this post.."
    else
      redirect_to home_path
    end
  end
#======================#####################===============
  private
  def param_set
  	params.require(:post).permit(:discription,:title,:content)
  end

  def idset
  	@post=Post.find(params[:id])
  end
end
