class SignUpMailer < ApplicationMailer
  default from: "stadeo17@gmail.com"
  
  def new_user(user)
    headers["Message-ID"] = "<comments/#{comment.id}@your-app-name.example>"
    headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
    headers["References"] = "<post/#{post.id}@your-app-name.example>"
    
    @user = user
    
    mail(to: user.email, subject: "Welcome to Blocitoff")
  end
end
