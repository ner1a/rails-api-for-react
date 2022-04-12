module Api
    class ProductsController < ApplicationController
        
        before_action :set_product, only: %i[update show destroy]

        def index
            @products = Product.all
            render json: @products
        end

        def show
            image = rails_blob_url(@product.product_image)
            render json: { "image": image, "data": @product }
        end

        def get_by_name
            @products = Product.where(name: params[:name]).order(created_at: desc)
            render json: @products
        end

        def create
            @product = Product.create(product_params)
            if @product.valid?
                @product.save
                render json: @product
            else
                render json: @product.errors.full_messages, status: :bad_request
            end
        end

        def update
            @product.update(product_params)
            render json: @product
        end

        def destroy
            @product.destroy
            render json: "Ürün Silindi"
        end

        def set_product
            @product = Product.find(params[:id])
        end

        def product_params
            params.permit(:name,:description,:quantity,:price,:sort,:product_image)
        end

    end
end

