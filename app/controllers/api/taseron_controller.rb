module Api
  class TaseronController < ApplicationController
    # Create a new element
    def index
      taseron_list = Taseron.all # Fetch all records, you can customize this query as needed
      render json: taseron_list, status: :ok
    end
    def create
      element = Taseron.new(element_params)
  
      if element.save
        render json: element, status: :created
      else
        render json: { errors: element.errors.full_messages }, status: :unprocessable_entity
      end
    end
    def update
      element = Taseron.find(params[:id]) # Find the element by its ID
      if element.update(element_params)
        render json: element, status: :ok
      else
        render json: { errors: element.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def destroy
      element = Taseron.find(params[:id]) # Find the element by its ID
      element.destroy
      head :no_content
    end

    private
  
    # Define strong parameters for your element model
    def element_params
      params.require(:taseron).permit(
        :iş_türü,          # Update to match your frontend naming
        :anlaşma_miktari,  # Update to match your frontend naming
        :iş_süresi,        # Update to match your frontend naming
        :odenen_miktar,    # Update to match your frontend naming
        :parametre_5,      # Update to match your frontend naming
        :parametre_6,      # Update to match your frontend naming
        :parametre_7,      # Update to match your frontend naming
        :anlaşma_tarihi    # Update to match your frontend naming
      )
    end
  end
end