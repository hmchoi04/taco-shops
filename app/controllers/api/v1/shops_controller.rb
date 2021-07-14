module Api 
    module V1 
        class ShopsController < ApplicationController
            protect_from_forgery with: :null_session

            def index 
                shops = Shop.all
                render json: ShopSerializer.new(shops, options).serialized_json
            end

            def show
                shop = Shop.find_by(slug: params[:slug])
                render json: ShopSerializer.new(shop, options).serialized_json
            end
            def create 
                shop = Shop.new(shop_params)

                if shop.save
                    render json: ShopSerializer.new(shop).serialized_json
                else
                    render json: {error: shop.errors.message}, status: 422
                end
            end
            def update
                shop = Shop.find_by(slug: params[:slug])

                if shop.update(shop_params)
                    render json: ShopSerializer.new(shop, options).serialized_json
                else
                    render json: {error: shop.errors.message}, status: 422
                end
            end
            def destory 
                shop = Shop.find_by(slug: shop_params)

                if shop.destory
                    head :no_content
                else
                    render json: {error: shop.errors.message}, status: 422
                end
            end
            private 

            def shop_params
                params.require(:shop).permit(:name, :image_url)
            end
            def options 
                @options ||= { include: %i[reviews]}
            end
        end
    end
end