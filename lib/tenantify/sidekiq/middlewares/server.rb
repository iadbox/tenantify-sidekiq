module Tenantify
  module Sidekiq
    module Middlewares
      class Server

        def call worker, job, queue
          tenant = job.fetch("tenant")

          ::Tenantify::Perform.with(tenant) { yield }
        end

      end
    end
  end
end
