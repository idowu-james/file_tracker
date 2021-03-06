class TrackersController < ApplicationController
  before_action :set_tracker, only: [:show, :edit, :update, :destroy]
  before_action :file_movement

  # GET /trackers
  # GET /trackers.json
  def index
    #@trackers = Tracker.where(:nasfile_id => nasfile.id)
    @trackers = @nasfile.trackers.newest_first.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /trackers/1
  # GET /trackers/1.json
  def show
  end

  # GET /trackers/new
  def new
    #@tracker = @nasfile.trackers.build
    @tracker = Tracker.new({:nasfile_id => @nasfile.id})

  end

  # GET /trackers/1/edit
  def edit
  end

  # POST /trackers
  # POST /trackers.json
  def create
    @tracker = @nasfile.trackers.create(tracker_params)

    @tracker.sender_id = current_user.id
    @tracker.office_sent_from_id = current_user.office.id

    #@tracker.office_sent_to_id = @tracker.receiver.office.name
    respond_to do |format|
      if @tracker.save
        format.html { redirect_to nasfile_trackers_path(@nasfile), notice: 'Tracker was successfully created.' }
        format.json { render @tracker, status: :created, location: @tracker }
      else
        format.html { render :new }
        format.json { render json: @tracker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trackers/1
  # PATCH/PUT /trackers/1.json
  def update
    respond_to do |format|
      if @tracker.update(tracker_params)
        format.html { redirect_to @tracker, notice: 'Tracker was successfully updated.' }
        format.json { render :show, status: :ok, location: @tracker }
      else
        format.html { render :edit }
        format.json { render json: @tracker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trackers/1
  # DELETE /trackers/1.json
  def destroy
    @tracker.destroy
    respond_to do |format|
      format.html { redirect_to trackers_url, notice: 'Tracker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tracker
      @tracker = Tracker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tracker_params
      params.require(:tracker).permit(:nasfile_id, :sender_id, :receiver_id,:office_sent_to_id,:office_sent_from_id)
    end

    def file_movement
      if params[:nasfile_id]
        @nasfile = Nasfile.find(params[:nasfile_id])
      end
    end
end
