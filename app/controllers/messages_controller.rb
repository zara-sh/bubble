class MessagesController < ApplicationController
  skip_after_action :verify_authorized
  skip_before_action :verify_authenticity_token

    before_action do
     @conversation = Conversation.find(params[:conversation_id])
    end

  def index
        policy_scope(Message)
    if @conversation.messages
      @messages = @conversation.messages
             # authorize @message
    else
      @messages = "fill out something!"
             # authorize @message
    end

    if @messages.length > 10
     @over_ten = true
     @messages = @messages[-10..-1]
    end
    if params[:m]
     @over_ten = false
     @messages = @conversation.messages
    end
   if @messages.last
    if @messages.last.user_id != current_user.id
     @messages.last.read = true;
    end
   end
  @message = @conversation.messages.build
   end

  def new
   @message = @conversation.messages.build
       authorize @message
       authorize @conversation
  end
  def create
   @message = @conversation.messages.build(message_params)
    if @message.save
       authorize @message
       authorize @conversation
      respond_to do |format|
        format.html { redirect_to conversation_messages_path(conversation_id: @conversation.id)}
        format.js
      end
    else
     respond_to do |format|
        format.html { render 'messages/index' }
        format.js  # <-- idem
      end
    end
  end

  private
   def message_params
    params.require(:message).permit(:body, :user_id, :conversation_id)
   end
end
