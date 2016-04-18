class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  before_action :check_session, only: [:new, :show, :edit, :update, :destroy]  

  # GET /activities
  # GET /activities.json
  def index
    @activities = Activity.all
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
  end

  # GET /activities/new
  def new
    
    if session[:role_type] == "Admin"
      
      @activity = Activity.new #For creating new activity
      @classroom_id = 1
      @activities = Activity.includes(:school_user).where(school_id: session[:school_id]).order("created_at DESC").page(params[:page]).per_page(10)
      
      #@activities.school_user
      
      elsif session[:role_type] == "Parent"
       
      @activity = Activity.new  
      @activities = Activity.where(classroom_id: ClassRegistration.select("classroom_id").where(student_id: params[:student_id])).order("created_at DESC").page(params[:page]).per_page(10)
     
      
      
      else 
      
      @activity = Activity.new #For creating new activity
      @classroom_id = params[:class_id]
      @classname = params[:classname]
      @activities = Activity.where("classroom_id = ? AND school_user_id = ?", params[:class_id], session[:user_id]).order("created_at DESC").page(params[:page]).per_page(10)
    end

  end

  # GET /activities/1/edit
  def edit
  end

  # POST /activities
  # POST /activities.json
  def create

    @activity = Activity.new(activity_params)
    
    if @activity.save
      @activities = Array.wrap(@activity) #converting to array


      respond_to do |format|

          format.js 
      end
    end
    
  end

  # PATCH/PUT /activities/1
  # PATCH/PUT /activities/1.json
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to @activity, notice: 'Activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to activities_url, notice: 'Activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity

      @activity = Activity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params.require(:activity).permit(:title, :message, :activity_type, :allow_comment, :classroom_id, :school_id, :school_user_id, :image)
    end

    def check_session
      if session[:user_id] || session[:parent_id]
        
        else
          redirect_to "/home/login"
      end
    end

end
