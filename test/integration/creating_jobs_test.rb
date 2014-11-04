require 'test_helper'

class CreatingJobsTest < ActionDispatch::IntegrationTest
  test 'created jobs with valid data' do
    # bob = User.create(name: "bob", :password => "password1234", :email => "bob@example.com")
    post '/jobs', { job: {
      # user: bob,
      company_name: "Amazon",
      title: "Web Developer",
      url: "www.amazon.com",
      type: "Web Dev"
      } }.to_json,
      { 'Accept' => 'application/json',
        'Content-Type' => 'application/json'}

    assert_equal 201, response.status
    assert_equal Mime::JSON, response.content_type
    job = json(response.body)
    assert_equal job_url(job[:id]), response.location
    # assert_equal bob, job[:user]
    assert_equal 'Amazon', job[:company_name]
    assert_equal 'Web Developer', job[:title]
    assert_equal 'www.amazon.com', job[:url]
    assert_equal 'Web Dev', job[:type]
  end

  test 'does not create products with invalid data' do
    # post '/jobs', { job: {
    #   company_name: nil,
    #   } }.to_json,
    #   { 'Accept' => 'application/json',
    #     'Content-Type' => 'application/json'}
    # assert_equal 422, response.status
  end
end
