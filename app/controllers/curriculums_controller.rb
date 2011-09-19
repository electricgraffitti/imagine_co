class CurriculumsController < ApplicationController
  
  before_filter :require_teacher
  layout 'internal'
  
  def index
    @curriculums = Curriculum.all
  end

  def new
    @curriculum = Curriculum.new
  end

  def create
    @curriculum = Curriculum.new(params[:curriculum])
    @curriculum.teacher_id = current_teacher.id
    
    respond_to do |format|
      if @curriculum.save
        format.html { redirect_to(curriculums_path, :notice => 'Lesson was successfully added to your curriculums.') }
      else
        format.html { redirect_to(curriculums_path, :notice => 'Processing Error, Please try again.')  }
      end
    end
  end

  def show
    @curriculum = Curriculum.find(params[:curriculum])
  end

  def edit
    @curriculum = Curriculum.find(params[:curriculum])
  end

  def update
    @curriculum = Curriculum.find(params[:curriculum])
  end

  def destroy
    @curriculum = Curriculum.find(params[:curriculum])
  end

end
