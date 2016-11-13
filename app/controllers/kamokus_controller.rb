class KamokusController < ApplicationController
  before_action :set_kamoku, only: [:show, :edit, :update, :destroy]

  # GET /kamokus
  # GET /kamokus.json
  def index
    @kamokus = Kamoku.all
  end

  # GET /kamokus/1
  # GET /kamokus/1.json
  def show
  end

  # GET /kamokus/new
  def new
    @kamoku = Kamoku.new
  end

  # GET /kamokus/1/edit
  def edit
  end

  # POST /kamokus
  # POST /kamokus.json
  def create
    @kamoku = Kamoku.new(kamoku_params)

    respond_to do |format|
      if @kamoku.save
        format.html { redirect_to @kamoku, notice: 'Kamoku was successfully created.' }
        format.json { render :show, status: :created, location: @kamoku }
      else
        format.html { render :new }
        format.json { render json: @kamoku.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kamokus/1
  # PATCH/PUT /kamokus/1.json
  def update
    respond_to do |format|
      if @kamoku.update(kamoku_params)
        format.html { redirect_to @kamoku, notice: 'Kamoku was successfully updated.' }
        format.json { render :show, status: :ok, location: @kamoku }
      else
        format.html { render :edit }
        format.json { render json: @kamoku.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kamokus/1
  # DELETE /kamokus/1.json
  def destroy
    @kamoku.destroy
    respond_to do |format|
      format.html { redirect_to kamokus_url, notice: 'Kamoku was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kamoku
      @kamoku = Kamoku.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kamoku_params
      params.require(:kamoku).permit(:name)
    end
end
