class Api::V1::EntriesController < Api::BaseController
  
  def index
    @entries = Entry.all
    if params[:name] 
      @entries = @entries.where(name: params[:name])
    end
    render json: @entries, status: 200
  end

  def create
    entry = Entry.create(entry_params)
    if entry.valid?
      render json: entry, status: 201
    else 
      render json: entry.errors, status: 422
    end
  end

  def update
    entry = Entry.find_by name: params[:name]
    entry.winner = true
    entry.save
    if entry.valid?
      render json: entry, status: 204
    else
      render nothing: true, status: 501
    end
  end

  def destroy
    entry = Entry.find params["$oid"]
    if entry.delete
      render nothing: true, status: 200
    end
  end

  private
  def entry_params
    params.require(:entry).permit(:name, :winner)
  end

end