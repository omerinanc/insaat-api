module Api
  class DaireController < ApplicationController
    # Create a new element
    def index
      daire_list = Daire.all # Fetch all records, you can customize this query as needed
      render json: daire_list, status: :ok
    end

    def create
      element = Daire.new(element_params)
      if element.save
        render json: element, status: :created
      else
        render json: { errors: element.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def update
      element = Daire.find(params[:id]) # Find the element by its ID
      if element.update(element_params)
        render json: element, status: :ok
      else
        render json: { errors: element.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def destroy
      element = Daire.find(params[:id]) # Find the element by its ID
      element.destroy
      head :no_content
    end

    private

    # Define strong parameters for your element model
    def element_params
      params.require(:daire).permit(
        :isim_soyisim,          # Update to match your frontend naming
        :telefon_numarasi,      # Update to match your frontend naming
        :anlasma_tarihi,        # Update to match your frontend naming
        :anlasma_miktari,       # Update to match your frontend naming
        :on_odeme,              # Update to match your frontend naming
        :taksit_tarihi,         # Update to match your frontend naming
        :taksit_miktari,        # Update to match your frontend naming
        :tapu_tarihi,
        :teslim_tarihi          # Update to match your frontend naming
      )
    end
  end
end
