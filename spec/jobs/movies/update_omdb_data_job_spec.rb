require 'rails_helper'

RSpec.describe Movies::UpdateOmdbDataJob, type: :job do
  it "calls OmdbDataUpdater" do
    ActiveJob::Base.queue_adapter = :test
    expect {
      described_class.perform_later(1)
    }.to have_enqueued_job
  end
end
