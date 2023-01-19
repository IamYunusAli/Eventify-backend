require 'swagger_helper'

RSpec.describe 'api/users', type: :request do
  path '/users' do
    post 'Creates a user' do
      tags 'Users'
      consumes 'application/json'
      parameter username: :user, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string }
        },
        required: %w[username]
      }

      response '201', 'user created' do
        let(:user) do
          {
            username: 'User 1'
          }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { id: 1 } }
        run_test!
      end
    end
    get 'List All users' do
      tags 'Users'
      consumes 'application/json'
      response '200', 'users displayed' do
        run_test!
      end
    end
  end

  path '/users/{id}' do
    get 'Retrieves a user' do
      tags 'Users'
      produces 'application/json', 'application/xml'
      parameter username: :id, in: :path, type: :integer

      response '200', 'user found' do
        schema type: :object,
               properties: {
                 username: { type: :string }
               },
               required: %w[username]

        let(:id) do
          User.create(username: 'User').id
        end
        run_test!
      end

      response '404', 'user not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
