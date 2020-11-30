class DictionariesController < ApplicationController 
  before_action :set_dictionary, only: [:show, :edit, :update, :destroy]

  def index
    @dictionaries = Dictionary.includes(:user).order('created_at DESC')
  end

  def new
    @dictionary = Dictionary.new
  end
  
  def create
    @dictionary = Dictionary.new(dictionary_params)
    if @dictionary.valid?
       @dictionary.save 
       redirect_to root_path
    else
      render :new 
    end
  end

  def show 
  end

  def edit
   
  end

  def update
    if @dictionary.update(dictionary_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @dictionary.destroy
    redirect_to root_path
  end
  

  private
  def set_dictionary
    @dictionary = Dictionary.find(params[:id])
  end
  def dictionary_params
    params.require(:dictionary).permit(
      :word,
      :meaning,
      :pronunciation,
      :definition,
      :speech_id,
      :level_id,
      :image
    ).merge(user_id: current_user.id)
  end
end
