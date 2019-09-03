class PostMailer < ApplicationMailer
  def post_mail(post,user)    
    @post = post
    @posts = Post.all
    @user = user

    mail(:to => "snowdevin.sd@gmail.com", :subject => "Posted Successfully!!!")  
  end
end
