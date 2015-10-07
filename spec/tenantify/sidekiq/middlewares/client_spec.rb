require 'tenantify'
require 'tenantify/sidekiq/middlewares/client'

RSpec.describe Tenantify::Sidekiq::Middlewares::Client do

  subject { described_class.new }

  describe '#call' do
    let(:worker_class) { double 'worker_class' }
    let(:queue)        { double 'queue' }
    let(:redis_pool)   { double 'redis_pool' }

    let(:job) { { "fake" => "value" } }

    let(:tenant_name) { "a_tenant" }

    it 'adds a tenant key to the job hash' do
      block_called = false

      Tenantify::Perform.with tenant_name do
        subject.call(worker_class, job, queue, redis_pool) do
          block_called = true
        end
      end

      expect(job["tenant"]).to eq tenant_name
      expect(block_called).to eq true
    end
  end

end
