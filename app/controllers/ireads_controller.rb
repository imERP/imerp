class IreadsController < ApplicationController
  before_action :set_iread, only: [:show, :edit, :update, :destroy]

  # GET /ireads
  # GET /ireads.json
  def index
    @ireads = Iread.all
  end

  # GET /ireads/1
  # GET /ireads/1.json
  def show
  end

  # GET /ireads/new
  def new
    @iread = Iread.new
  end

  # GET /ireads/1/edit
  def edit
  end

  # POST /ireads
  # POST /ireads.json
  def create
    @iread = Iread.new(iread_params)

    respond_to do |format|
      if @iread.save
        format.html { redirect_to @iread, notice: 'Iread was successfully created.' }
        format.json { render :show, status: :created, location: @iread }
      else
        format.html { render :new }
        format.json { render json: @iread.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ireads/1
  # PATCH/PUT /ireads/1.json
  def update
    respond_to do |format|
      if @iread.update(iread_params)
        format.html { redirect_to @iread, notice: 'Iread was successfully updated.' }
        format.json { render :show, status: :ok, location: @iread }
      else
        format.html { render :edit }
        format.json { render json: @iread.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ireads/1
  # DELETE /ireads/1.json
  def destroy
    @iread.destroy
    respond_to do |format|
      format.html { redirect_to ireads_url, notice: 'Iread was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_iread
      @iread = Iread.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def iread_params
      params.require(:iread).permit(:caption, :caption_render)
    end
end
