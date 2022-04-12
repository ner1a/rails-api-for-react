module Api
    class CategoriesController < ApplicationController
        
        before_action :set_category, only: %i[uptade show destroy]

        def index
            @categories = Category.all
            if !@categories.blank?
                render json: @categories, status: :ok
            else
                render json: @categories, status: :bad_request
            end
        end

        def show
            if !@category.blank?
                render json: @category, status: :ok
            else
                render json: @category, status: :bad_request
            end
        end

        def update
            if @categoty.update(category_params)
                render json: @category, status: :ok
            else
                render json: "Kategori güncellenemedi", status: :bad_request
            end
        end
        
        def create
            @category = Category.create(category_params)
            if @category.save
                render json: @category, status: :ok
            else
                render json: "Kategori kaydedilemedi.", status: :bad_request
            end
        end

        def destroy
            if @category.destroy
                render json:"Kategori silindi", status: :ok
            else
                render json:"Kategori silinemedi!", status: :bad_request
            end
        end

        private
        def set_category
            @category = Category.find(params[:id])
        end

        def category_params
            params.permit(:name)
        end

    end
end
