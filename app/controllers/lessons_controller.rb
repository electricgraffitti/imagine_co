class LessonsController < ApplicationController
  
   before_filter :require_teacher, :except => [:edit, :update]
   
   layout 'internal'
  # GET /lessons
  # GET /lessons.xml
  def index
    
    if params[:student_id]
      @student = Student.find(params[:student_id]);
    else
      @lessons = Lesson.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lessons }
    end
  end

  # GET /lessons/1
  # GET /lessons/1.xml
  def show
    @lesson = Lesson.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lesson }
    end
  end

  # GET /lessons/new
  # GET /lessons/new.xml
  def new
    if params[:student_id]
      @student = Student.find(params[:student_id])
    end
    @lesson = Lesson.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lesson }
    end
  end

  # GET /lessons/1/edit
  def edit
    @lesson = Lesson.find(params[:id])
  end

  # POST /lessons
  # POST /lessons.xml
  def create
    @lesson = Lesson.new(params[:lesson])
    respond_to do |format|
      if @lesson.save
        format.html { redirect_to(students_path, :notice => 'Lesson was successfully assigned.') }
        format.xml  { render :xml => @lesson, :status => :created, :location => @lesson }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @lesson.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /lessons/1
  # PUT /lessons/1.xml
  def update
    @lesson = Lesson.find(params[:id])
    
    score = Question.score_answers(params)
    video_watched = true
    complete = true
    
    respond_to do |format|
      if @lesson.update_attributes(:score => score, :video_watched => video_watched, :complete => complete )
        LessonResult.file_answers(params, @lesson)
        format.html { redirect_to(student_dashboard_path, :notice => 'Lesson was successfully completed.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @lesson.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1
  # DELETE /lessons/1.xml
  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy

    respond_to do |format|
      format.html { redirect_to(lessons_url) }
      format.xml  { head :ok }
    end
  end
end
