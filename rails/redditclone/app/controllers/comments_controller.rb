class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]# GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end# GET /comments/1
  # GET /comments/1.json
  #def show
  #end# GET /comments/new
  def new
    @comment = Comment.new
  end# GET /comments/1/edit
  #def edit
  #end# POST /comments
  # POST /comments.json
  def create
    @link = Link.find(params[:link_id])
    @comment = @link.comments.new(comment_params)
    @comment.user = current_userrespond_to do |format|
      if @comment.save
        format.html { redirect_to @link, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { redner json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end# PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  
  #def update
    #respond_to do |format|
      #if @comment.update(comment_params)
        #format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        #format.json { render :show, status: :ok, location: @comment }
      #else
        #format.html { render :edit }
        #format.json { render json: @comment.errors, status: :unprocessable_entity }
      #end
    #end
  #end# DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  endprivate
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end# Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:link_id, :body, :user_id)
    end
end