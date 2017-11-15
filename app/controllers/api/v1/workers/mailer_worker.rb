module Api
  module V1
    class MailerWorker
      include Sidekiq::Worker

      def perform(*args)
        # Do something
      end
    end
  end
end
