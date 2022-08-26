class ProcessController < ApplicationController
    def index
        @client = Client.new(params[:client])

        if @client != null
            def process
                where(attorney: @client)
            end

    end

    def show
        @numberIdProcess = = NumberIdProcess.new(params[:idProcess])

        if @numberIdProcess != null
            def process
                where(id: @numberIdProcess)
            end
    end
end
