class NasfilesController < ApplicationController
  before_action :set_nasfile, only: [:show, :edit, :update, :destroy]
  before_action :registry_officer, only: [:new, :create, :edit, :destroy]

  # GET /nasfiles
  # GET /nasfiles.json
  def index
    #@user = User.find(receiver.id)
    if current_user.registry_officer?
      @nasfiles = Nasfile.all
    else
      @nasfiles = Nasfile.where("office_id = ?", current_user.office_id)
    end
  end

  # GET /nasfiles/1
  # GET /nasfiles/1.json
  def show
    #@nasfile = Nasfile.find(params[:id])
  end

  # GET /nasfiles/new
  def new
    @nasfile = Nasfile.new
  end

  # GET /nasfiles/1/edit
  def edit
  end

  # POST /nasfiles
  # POST /nasfiles.json
  def create
    @nasfile = Nasfile.new(nasfile_params)

    respond_to do |format|
      if @nasfile.save
        format.html { redirect_to @nasfile, notice: 'Nasfile was successfully created.' }
        format.json { render :show, status: :created, location: @nasfile }
      else
        format.html { render :new }
        format.json { render json: @nasfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nasfiles/1
  # PATCH/PUT /nasfiles/1.json
  def update
    respond_to do |format|
      if @nasfile.update(nasfile_params)
        format.html { redirect_to @nasfile, notice: 'Nasfile was successfully updated.' }
        format.json { render :show, status: :ok, location: @nasfile }
      else
        format.html { render :edit }
        format.json { render json: @nasfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nasfiles/1
  # DELETE /nasfiles/1.json
  def destroy
    @nasfile.destroy
    respond_to do |format|
      format.html { redirect_to nasfiles_url, notice: 'Nasfile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nasfile
      @nasfile = Nasfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nasfile_params
      params.require(:nasfile).permit(:file_name, :file_number, :file_sub, :file_volume, :category_id, :file_description, :office_id)
    end
end
