class BookStoreController<ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    def index
        @book_stores=BookStore.all
    end
    def show
        @book_store=BookStore.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        redirect_to "/"
    end
    def new
        @book_store=BookStore.new
    end
    def create
        @book_store=BookStore.new(book_store_params)
        if @book_store.save
            redirect_to @book_store
        else
            render :new, status: :unprocessable_entity
        end
    end
    def edit
        @book_store=BookStore.find(params[:id])
    end
    def update
        @book_store=BookStore.find(params[:id])
        if @book_store.update(book_store_params)
            redirect_to @book_store
        else
            render :edit, status: :unprocessable_entity
        end
    end
    def delete
        @book_store=BookStore.find(params[:id])
        @book_store.destroy
        redirect_to "/"
    end
    private
    def book_store_params
        params.require(:book_store).permit(:title, :body)
    end
end