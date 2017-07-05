module WatsonLayer
  class ApiCall 
    def initialize(url='https://gateway.watsonplatform.net/conversation/api/v1/workspaces/875de769-ea9b-47cb-857a-84fb7334287d', username='7a44fecf-d37d-4c74-b0ef-799afc690fcc', password='kQKOkluCuclj')
      @url = url
      @username = username
      @password = password
    end
      
    def send_message(message=nil)
      @new_url =  @url + '/message?version=2017-05-26'
      if $context.present? 
        $context, message = $context, message 
      else
        $context, message = {}, nil
      end   
      payload = {:input => {:text => message}, :context => $context}
      payload = payload.to_json
      @response = RestClient::Request.execute(method: :post, url: @new_url, user: @username, password: @password, payload: payload,headers: { :accept => :json, content_type: :json })
      @response = JSON.parse(@response)
      @intent = @response['intents'][0]['intent'] if @response['intents'].present?
      $context = @response['context']
      @conversation_id = @response['context']['conversation_id'] if @response['context'].present?
      @message = @response['output']['text'].first if @response['output']['text'].present?
      return @message
    end   
  end  
end 

# curl -X POST -u "{username}":"{password}" —-header "Content-Type:application/json" --data "{\"input\": {\"text\": \"Turn on the lights\"}, \"context\": {\"conversation_id\": \"1b7b67c0-90ed-45dc-8508-9488bc483d5b\", \"system\": {\"dialog_stack\":[{\"dialog_node\":\"root\"}], \"dialog_turn_counter\": 1, \"dialog_request_counter\": 1}}}" "https://gateway.watsonplatform.net/conversation/api/v1/workspaces/25dfa8a0-0263-471b-8980-317e68c30488/message?version=2017-05-26"
# JSON.parse(RestClient::Request.execute(method: :post, url: @new_url, user: @username, password: @password, payload: {}.to_json,headers: { :accept => :json, content_type: :json }))
# {"intents"=>[], "entities"=>[], "input"=>{}, "output"=>{"text"=>["Hi!! Do you need any help?"], "nodes_visited"=>["Welcome"], "log_messages"=>[]}, "context"=>{"conversation_id"=>"48451a5f-1213-435d-a49f-3fb50617cea0", "system"=>{"dialog_stack"=>[{"dialog_node"=>"root"}], "dialog_turn_counter"=>1, "dialog_request_counter"=>1, "_node_output_map"=>{"Welcome"=>[0, 2, 3, 1, 0]}, "branch_exited"=>true, "branch_exited_reason"=>"completed"}}}

# payload = {:input => {:text => "Hi"}, :context => {}}
# {:input=>{:text=>"Turn on the lights"}, :context=>{:conversation_id=>"1b7b67c0-90ed-45dc-8508-9488bc483d5b", :system=>{:dialog_stack=>[{:dialog_node=>"root"}], :dialog_turn_counter=>1, :dialog_request_counter=>1}}}
#{:input=>{:text=>"Turn on the lights"}, :context=>{:conversation_id=>"1b7b67c0-90ed-45dc-8508-9488bc483d5b"}}