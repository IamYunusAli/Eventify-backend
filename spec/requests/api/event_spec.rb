require 'swagger_helper'

RSpec.describe 'api/events', type: :request do
  path 'users/{user_id}/events' do
    post 'Creates a event' do
      tags 'Events'
      consumes 'application/json'
      parameter name: :event, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          image: { type: :string },
          category: { type: :string },
          date: { type: :date },
          time: { type: :time },
          description: { type: :string },
          organizer: { type: :string },
          location: { type: :string },
          price: { type: :integer },
          user_id: { type: :integer }
        },
        required: %w[name image category date time description organizer location price user_id]
      }

      response '201', 'event created' do
        let(:event) do
          {
            name: 'Event 1',
            image: 'Event 1',
            category: 'Event 1',
            date: '2019-01-01',
            time: '2019-01-01 00:00:00',
            description: 'Event 1',
            organizer: 'Event 1',
            location: 'Event 1',
            price: 1,
            user_id: 1
          }
        end
        let(:user_id) do
          User.create(username: 'User').id
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:event) { { name: 'foo' } }
        run_test!
      end
    end

    get 'Retrieves events' do
      tags 'Events'
      produces 'application/json'

      response '200', 'events found' do
        let(:user_id) do
          User.create(username: 'User').id
        end
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   name: { type: :string },
                   image: { type: :string },
                   category: { type: :string },
                   date: { type: :date },
                   time: { type: :time },
                   description: { type: :string },
                   organizer: { type: :string },
                   location: { type: :string },
                   price: { type: :integer },
                   user_id: { type: :integer }
                 }
               }

        run_test!
      end
    end

    path 'users/{user_id}/events' do
      get 'Retrieves a event' do
        tags 'Events'
        produces 'application/json'
        parameter name: :user_id, in: :path, type: :integer

        response '200', 'event found' do
          schema type: :object,
                 properties: {
                   id: { type: :integer },
                   name: { type: :string },
                   image: { type: :string },
                   category: { type: :string },
                   date: { type: :date },
                   time: { type: :time },
                   description: { type: :string },
                   organizer: { type: :string },
                   location: { type: :string },
                   price: { type: :integer },
                   user_id: { type: :integer }
                 },
                 required: %w[id name image category date time description organizer location price user_id]

          let(:user_id) do
            User.create(username: 'User').id
          end
          run_test!
        end

        response '404', 'event not found' do
          let(:user_id) { 'invalid' }
          run_test!
        end
      end
    end

    path 'users/{user_id}/events/{id}' do
      get 'Retrieves a event' do
        tags 'Events'
        produces 'application/json'
        parameter name: :id, in: :path, type: :string
        parameter name: :user_id, in: :path, type: :integer

        response '200', 'event found' do
          schema type: :object,
                 properties: {
                   id: { type: :integer },
                   name: { type: :string },
                   image: { type: :string },
                   category: { type: :string },
                   date: { type: :date },
                   time: { type: :time },
                   description: { type: :string },
                   organizer: { type: :string },
                   location: { type: :string },
                   price: { type: :integer },
                   user_id: { type: :integer }
                 },
                 required: %w[id name image category date time description organizer location price user_id]

          let(:id) do
            Event.create(name: 'Event 1',
                         image: 'Event 1',
                         category: 'Event 1',
                         date: '2019-01-01',
                         time: '2019-01-01 00:00:00',
                         description: 'Event 1',
                         organizer: 'Event 1',
                         location: 'Event 1',
                         price: 1,
                         user_id: 1).id
          end
          let(:user_id) do
            User.create(username: 'User').id
          end
          run_test!
        end

        response '404', 'event not found' do
          let(:user_id) { 'invalid' }
          run_test!
        end
      end

      delete 'Deletes a event' do
        tags 'Events'
        produces 'application/json'
        parameter name: :id, in: :path, type: :string
        parameter name: :user_id, in: :path, type: :integer

        response '204', 'event deleted' do
          let(:id) do
            Event.create(name: 'Event 1',
                         image: 'Event 1',
                         category: 'Event 1',
                         date: '2019-01-01',
                         time: '2019-01-01 00:00:00',
                         description: 'Event 1',
                         organizer: 'Event 1',
                         location: 'Event 1',
                         price: 1,
                         user_id: 1).id
          end
          let(:user_id) do
            User.create(username: 'User').id
          end
          run_test!
        end
      end
    end
  end
end
