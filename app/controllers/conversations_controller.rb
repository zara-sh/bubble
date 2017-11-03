class ConversationsController < ApplicationController
 before_action :authenticate_user!

  def index
    policy_scope(Conversation)
   @users = User.all
   @conversations = Conversation.all
   end

  #    def show
  #          @conversation = Conversation.find(params[:id])

  #         authorize @conversation
  #       # policy_scope(Message)
  #   if @conversation.messages
  #     @messages = @conversation.messages
  #            # authorize @message
  #   else
  #     @messages = "fill out something!"
  #            # authorize @message
  #   end

  #   if @messages.length > 10
  #    @over_ten = true
  #    @messages = @messages[-10..-1]
  #   end
  #   if params[:m]
  #    @over_ten = false
  #    @messages = @conversation.messages
  #   end
  #  if @messages.last
  #   if @messages.last.user_id != current_user.id
  #    @messages.last.read = true;
  #   end
  #  end
  # @message = @conversation.messages.build
  #  end



  def create
   if Conversation.between(params[:sender_id],params[:recipient_id])
     .present?
      @conversation = Conversation.between(params[:sender_id],
       params[:recipient_id]).first
    authorize @conversation
   else
    @conversation = Conversation.create!(conversation_params)
    authorize @conversation
   end
   redirect_to conversation_messages_path(@conversation)
  end
  private
   def conversation_params
    params.permit(:sender_id, :recipient_id)
   end
end
