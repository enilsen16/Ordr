require 'test_helper'

class ListingJobsTest < ActionDispatch::IntegrationTest
  setup do
  Job.create!(company_name: "XYZ",
            title: "Junior Developer",
            url: "www.google.com/about/careers/",
            type: "online")
  Job.create!(company_name: "XYZ",
           title: "Subway Artist",
           url: "www.google.com/about/careers/",
           type: "Artist Convention")
  end

  test 'listing jobs' do
    get '/jobs'

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type

    assert_equal Job.where(company_name: 'XYZ').count, 2

  end

end