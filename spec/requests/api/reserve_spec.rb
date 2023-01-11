require 'swagger_helper'

RSpec.describe 'api/reservevation', type: :request do

    path 'users/{user_id}/events/{event_id}/reservations' do

        post 'Creates a reservation' do
            tags 'Reservations'
            consumes 'application/json'
            parameter name: :reservation, in: :body, schema: {
                type: :object,
                properties: {
                    event_id: { type: :integer },
                    user_id: { type: :integer },
                    name: { type: :string },
                    city: { type: :string },
                    date: { type: :date },
                },
                required: %w[name city date user_id event_id]
            }

            response '201', 'reservation created' do
                let(:reservation) do
                    {
                        name: 'Reservation 1', city: 'City 1', date: '2019-01-01', user_id: 1, event_id: 1
                    }
                end
                run_test!
            end

            response '422', 'invalid request' do
                let(:reservation) { { name: 'foo' } }
                run_test!
            end
        end
    end


    path 'users/{user_id}/events/{event_id}/reservations' do
        get 'Retrieves a reservation' do
            tags 'Reservations'
            produces 'application/json'
            parameter name: :user_id, :in => :path, :type => :integer
            parameter name: :event_id, :in => :path, :type => :integer

            response '200', 'reservation found' do
                schema type: :object,
                properties: {
                    id: { type: :integer },
                    event_id: { type: :integer },
                    user_id: { type: :integer },
                    name: { type: :string },
                    city: { type: :string },
                    date: { type: :date },
                },
                required: %w[id name city date user_id event_id]

                let(:id) { Reservation.create(name: 'Reservation 1', city: 'City 1', date: '2019-01-01', user_id: 1, event_id: 1).id }
                run_test!
            end

            response '404', 'reservation not found' do
                let(:id) { 'invalid' }
                run_test!
            end
        end
    end

    path 'users/{user_id}/events/{event_id}/reservations/{id}' do




        get 'Retrieves a reservation' do
            tags 'Reservations'
            produces 'application/json'
            parameter name: :user_id, :in => :path, :type => :integer
            parameter name: :event_id, :in => :path, :type => :integer
            parameter name: :id, :in => :path, :type => :string


            response '200', 'reservation found' do
                schema type: :object,
                properties: {
                    id: { type: :integer },
                    event_id: { type: :integer },
                    user_id: { type: :integer },
                    name: { type: :string },
                    city: { type: :string },
                    date: { type: :date },
                },
                required: %w[id name city date user_id event_id]

                let(:id) { Reservation.create(name: 'Reservation 1', city: 'City 1', date: '2019-01-01', user_id: 1, event_id: 1).id }
                run_test!
            end

            response '404', 'reservation not found' do
                let(:id) { 'invalid' }
                run_test!
            end
        end

        delete 'Deletes a reservation' do
            tags 'Reservations'
            parameter name: :user_id, :in => :path, :type => :integer
            parameter name: :event_id, :in => :path, :type => :integer
            parameter name: :id, :in => :path, :type => :string

            response '204', 'reservation deleted' do
                let(:id) { Reservation.create(name: 'Reservation 1', city: 'City 1', date: '2019-01-01', user_id: 1, event_id: 1).id }
                run_test!
            end
            response '404', 'reservation not found' do
                let(:id) { 'invalid' }
                run_test!
            end
        end
    end
end

