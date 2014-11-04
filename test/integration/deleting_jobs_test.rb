require 'test_helper'

class DeletingJobsTest < ActionDispatch::IntegrationTest
  setup do
    @job = Job.create!(company_name: "Google",
            title: "Junior Developer",
            url: "www.google.com/about/careers/",
            type: "online")
  end

  test 'delete jobs' do
    delete "/jobs/#{@job.id}"

    assert_equal 204, response.status
  end
end