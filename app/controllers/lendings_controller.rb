class LendingsController < ApplicationController
  before_action :set_lending, only: %i[ update ]

 # GET /lendings or /lendings.json
 def index
  @lendings = Lending.all
  if params[:search].present?
    search_term = "%#{params[:search].downcase}%"
    @lendings = @lendings.where("lower(borrower_name) LIKE ?", search_term)
  end
  if params[:active] == "true"
    @lendings = @lendings.where(returned_at: nil)
  end
end

  # GET /lendings/new
  def new
    @lending = Lending.new
    @lending.book = Book.find(params[:book_id]) if params[:book_id].present?
  end

  # POST /lendings or /lendings.json
  def create
    @lending = Lending.new(lending_params)
    @lending.borrowed_at = Time.current

    respond_to do |format|
      if @lending.save
        format.html { redirect_to lendings_path, notice: "Lending was successfully created." }
        format.json { render json: @lending, status: :created, location: lendings_path }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lending.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lendings/1 or /lendings/1.json
  def update
    respond_to do |format|
      if @lending.update(returned_at: Time.current)
        format.html { redirect_to lendings_path, notice: "Lending was successfully updated." }
        format.json { render json: @lending, status: :ok, location: lendings_path }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lending.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_lending
      @lending = Lending.find(params.expect(:id))
    end

    def lending_params
      params.expect(lending: [ :book_id, :borrower_name, :borrowed_at, :returned_at ])
    end
end
