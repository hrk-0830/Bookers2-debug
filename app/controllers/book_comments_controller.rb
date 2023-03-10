class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    comment = current_user.book_comment.new(book_comment_params)
    comment.book_id = @book.id
    comment.save
    render :comments
  end

  def destroy
    @book = Book.find(params[:book_id])
    BookComment.find(params[:id]).destroy
    render :comments
  end



  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
