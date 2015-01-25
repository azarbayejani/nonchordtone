class NotesController < ApplicationController
    def new
    end

    def create
        @note = Note.new(user_params)
        @note.save
        redirect_to @note
    end

    def show
        @note = Note.find(params[:id])
    end

    def user_params
        params.require(:note).permit(:text)
    end
end
