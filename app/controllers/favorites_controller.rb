class FavoritesController < ApplicationController
    def index
        @favorites = current_user.favorites.uniq
    end
end