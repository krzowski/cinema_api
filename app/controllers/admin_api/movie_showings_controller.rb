module AdminApi
  class MovieShowingsController < BaseController
    def create
      call_action do
        MovieShowings::Operations::CreateShowing.new.call(
          movie_showing_params
        )
      end
    end

    def update
      call_action do
        MovieShowings::Operations::UpdateShowing.new.call(
          params[:id],
          movie_showing_params
        )
      end
    end

    private

    def movie_showing_params
      params.to_unsafe_hash['movie_showing']
    end
  end
end
