module Tenantify
  module Sidekiq
    module Middlewares
      class Client

        def call worker_class, job, queue, redis_pool
          job["tenant"] = ::Tenantify::Perform.current
          yield
        end

      end
    end
  end
end
