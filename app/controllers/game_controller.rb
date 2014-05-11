class GameController < ApplicationController
    def index
        list
        render :action => 'list'
    end

    # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
    verify :method => :post, :only => [ :destroy, :create, :update ],
        :redirect_to => { :action => :list }

    def list
        @game_pages, @games = paginate(:games,
                                       :per_page => 8,
                                       :order => 'played_on DESC, id DESC')
    end

    def new
        @game = Game.new
        @users = get_user_names
    end

    def create
        game_params = params[:game]
        @game = Game.new(game_params)
        if @game.save
            flash[:notice] = 'Game was successfully created.'
            redirect_to :action => 'list'
        else
            @users = get_user_names
            render :action => 'new'
        end
    end

    def edit
        @game = Game.find(params[:id])
        @users = get_user_names
    end

    def update
        @game = Game.find(params[:id])
        game_params = params[:game]
        if @game.update_attributes(game_params)
            flash[:notice] = 'Game was successfully updated.'
            redirect_to :action => 'list', :id => @game
        else
            @users = get_user_names
            render :action => 'edit'
        end
    end

    def destroy
        Game.find(params[:id]).destroy
        redirect_to :action => 'list'
    end

    def get_user_names
        User.find(:all, :order => :name).collect{ |user| [user.name, user.id] }
    end
end
