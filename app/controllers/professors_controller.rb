class ProfessorsController < ApplicationController
  before_action :department_list, only: [:new, :edit]
  before_action :set_professor, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :search, :show]
  before_filter :authorize, only: [:edit, :destroy]


  # GET /professors
  # GET /professors.json
  def index
    @professors = Professor.all.order("name")
  end

  def search
    #@professors = Professor.search(params[:search])
    if params[:search]
      @professors = Professor.search(params[:search])
    else
      @professor = Professor.all.order("name")
    end
  end

  # GET /professors/1
  # GET /professors/1.json
  def show
    @reviews = @professor.reviews.order("created_at DESC").page params[:page]
    if !@professor.reviews.blank?
      @avg_score = @professor.reviews.average(:rating).round(1)
    else
      @avg_score = 0
    end
  end

  # GET /professors/new
  def new
    @professor = Professor.new
  end

  # GET /professors/1/edit
  def edit
  end

  # POST /professors
  # POST /professors.json
  def create
    @professor = Professor.new(professor_params)
    @professor.user_id = current_user.id
    respond_to do |format|
      if @professor.save
        format.html { redirect_to @professor, notice: 'Professor was successfully created.' }
        format.json { render :show, status: :created, location: @professor }
      else
        format.html { render :new }
        format.json { render json: @professor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /professors/1
  # PATCH/PUT /professors/1.json
  def update
    respond_to do |format|
      if @professor.update(professor_params)
        format.html { redirect_to @professor, notice: 'Professor was successfully updated.' }
        format.json { render :show, status: :ok, location: @professor }
      else
        format.html { render :edit }
        format.json { render json: @professor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /professors/1
  # DELETE /professors/1.json
  def destroy
    @professor.destroy
    respond_to do |format|
      format.html { redirect_to professors_url, notice: 'Professor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  protected

    def authorize
      unless admin?
        flash[:error] = "Unauthorized Access"
        redirect_to @professor
        false
      end
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professor
      @professor = Professor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def professor_params
      params.require(:professor).permit(:name, :title, :department, :link, :image)
    end

    def department_list
      @dept_list = ['Africana Studies', 'Anthropology', 'Arabic', 'Archaeology', 'Architecture',
        'Arts Program – Creative Writing', 'Arts Program – Dance', 'Arts Program – Fine Arts', 
        'Arts Program - Music', 'Arts Program - Theater', 'Astronomy', 'Biology',
        'Biochemistry & Molecular Biology', 'Chemistry', 'Child and Family Studies','Classics', 
        'Comparative Literature', 'Computer Science', 'East Asian Languages and Cultures', 'Economics', 
        'Education', 'English', 'Environmental Studies', 'Film Studies', 'French', 'Gender and Sexuality', 
        'Geology', 'German', 'Greek, Latin and Classical Studies', 'Growth and Structure of Cities',
        'Hebrew and Judaic Studies', 'History', 'History of Art', 'International Studies', 'Italian', 
        'Latin-American Studies', 'Linguistics', 'Mathematics', 'Mathematics & Statistics', 
        'Middle Eastern Studies', 'Philosophy','Physics','Political Science', 'Psychology', 'Religion',
        'Romance Languages', 'Russian', 'Social Work and Social Research', 'Sociology','Spanish'
      ]
    end
end
