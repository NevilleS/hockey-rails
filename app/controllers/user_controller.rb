class UserController < ApplicationController
    def index
        list
        render :action => 'list'
    end

    # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
    verify :method => :post, :only => [ :destroy, :create, :update ],
        :redirect_to => { :action => :list }

    def list
        @users = User.find(:all, :order => :name)
        if params[:column]
            m = params[:column]
            begin
                @users.sort! { |a,b| b.method(m).call <=>  a.method(m).call }
            rescue NameError
                m = :username
                retry
            end
            if session[:column] and session[:column] == m
                @users.reverse!
                session[:column] = nil
            else
                session[:column] = m
            end
        end
    end

    def show
        @user = User.find(params[:id])
        @others = User.find(:all, :order => :name).delete_if do |user|
            user.id == @user.id
        end
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(params[:user])
        if @user.save
            flash[:notice] = 'User was successfully created.'
            redirect_to :action => 'list'
        else
            render :action => 'new'
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update_attributes(params[:user])
            flash[:notice] = 'User was successfully updated.'
            redirect_to :action => 'show', :id => @user
        else
            render :action => 'edit'
        end
    end

    def destroy
        User.find(params[:id]).destroy
        redirect_to :action => 'list'
    end
end
