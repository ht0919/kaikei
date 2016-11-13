class KeihisController < ApplicationController
  before_action :set_keihi, only: [:show, :edit, :update, :destroy]

  # GET /keihis
  # GET /keihis.json
  def index
    @keihis = Keihi.all
  end

  # GET /keihis/1
  # GET /keihis/1.json
  def show
  end

  # GET /keihis/new
  def new
    @keihi = Keihi.new
  end

  # GET /keihis/1/edit
  def edit
  end

  # POST /keihis
  # POST /keihis.json
  def create
    @keihi = Keihi.new(keihi_params)

    respond_to do |format|
      if @keihi.save
        format.html { redirect_to @keihi, notice: 'Keihi was successfully created.' }
        format.json { render :show, status: :created, location: @keihi }
      else
        format.html { render :new }
        format.json { render json: @keihi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /keihis/1
  # PATCH/PUT /keihis/1.json
  def update
    respond_to do |format|
      if @keihi.update(keihi_params)
        format.html { redirect_to @keihi, notice: 'Keihi was successfully updated.' }
        format.json { render :show, status: :ok, location: @keihi }
      else
        format.html { render :edit }
        format.json { render json: @keihi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /keihis/1
  # DELETE /keihis/1.json
  def destroy
    @keihi.destroy
    respond_to do |format|
      format.html { redirect_to keihis_url, notice: 'Keihi was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_keihi
      @keihi = Keihi.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def keihi_params
      params.require(:keihi).permit(:date, :kamoku_id_id, :tekiyou, :kingaku)
    end
end
