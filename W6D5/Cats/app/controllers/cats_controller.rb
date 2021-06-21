class CatsController < ApplicationController

    #sets @cats to all cats
    #render :index to go through cats and display each cat
    def index 
        @cats = Cat.all
        render :index
    end

    #set @cat to find cat with :id
    #render :show to show cat info
    def show
        @cat = Cat.find(params[:id])
        render :show
    end

    #create a new empty cat
    #render :new to get new cat info
    #:new routes to create when submitting form
    def new
        @cat = Cat.new
        render :new
    end

    #create a cat with input params
    #if cat is saved, redirect to :show 
    #else redirect to :new to correct form
    def create
        @cat = Cat.new(cat_params)
        if @cat.save!
            redirect_to cat_url(@cat)
        else
            render :new   #@car.error.full_messages , status: 422 
        end
    end
    
    #find cat with :id 
    #render :edit to edit cat
    def edit
        @cat = Cat.find(params[:id])
        render :edit
    end

    #find cat with :id
    #if cat is updated, redirect :show to show updated cat info
    #else render :edit to edit again
    def update
        @cat = Cat.find(params[:id])
        if @cat.update(cat_params)
            redirect_to cat_url(@cat)
        else
            render :edit
        end
    end

    private 

    def cat_params
        params.require(:cat).permit(:name,:color,:sex,:birth_date,:description)
    end
    
end