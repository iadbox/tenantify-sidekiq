require 'tenantify'
require 'tenantify/sidekiq/middlewares/server'

RSpec.describe Tenantify::Sidekiq::Middlewares::Server do

  subject { described_class.new }

  describe '#call' do
    let(:worker_class) { double 'worker_class' }
    let(:queue)        { double 'queue' }

    let(:tenant_name) { "a_tenant" }
    let(:job)         { { "tenant" => tenant_name } }

    it 'adds a tenant key to the job hash' do
      block_called = false

      subject.call(worker_class, job, queue) do
        expect(Tenantify::Perform.current).to eq tenant_name

        block_called = true
      end

      expect(block_called).to eq true
    end
  end

end
