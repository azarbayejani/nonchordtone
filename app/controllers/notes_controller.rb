class NotesController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  def new
  end

  def create
    @note = Note.new(user_params)
    @note.save
    redirect_to action: 'show', uid: @note.uid
  end

  def show
    @note = Note.find_by! uid: params[:uid]
  end

  def destroy
    old_note = Note.find_by! uid: params[:uid]
    new_note = old_note.dup
    new_note.save
    old_note.destroy
    render :json => { 
      :uid => old_note.uid,
      :text => old_note.text,
      :new_uid => new_note.uid
    }
  end

  def record_not_found
    render 'record_not_found'
  end

  private
  def user_params
    params.require(:note).permit(:text)
  end
end
