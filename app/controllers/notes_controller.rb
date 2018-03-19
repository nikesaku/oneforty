class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def index
    @notes = Note.all
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to notes_path, notice: '新しいノートが作成されました'
    else
      render 'new'
    end
  end

  def new
    if params[:back]
      @note = Note.new(note_params)
    else
      @note = Note.new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @note.update(note_params)
      redirect_to notes_path, notice: 'ノートが編集されました！'
    else
      render 'edit'
    end
  end

  def destroy
    @note.destroy
    redirect_to notes_path, notice: 'ノートが削除されました！'
  end

  def confirm
    @note = Note.new(note_params)
  end

  private

  def note_params
    params.require(:note).permit(:content)
  end

  def set_note
    @note = Note.find(params[:id])
  end

end
