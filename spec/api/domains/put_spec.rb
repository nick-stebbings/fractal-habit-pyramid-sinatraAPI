# frozen_string_literal: true

RSpec.describe 'Feature: domains resource' do
  context 'Given a valid domain json AND a persisted domain tuple with the same id' do
    before do
      @domain = valid_domain.create
      @domain_id = @domain.attributes[:id]
      @domain_as_json = @domain.attributes.to_json
      
      domain_repo.create(@domain.attributes)
    end
    
    describe 'When #put to /api/domains/:domain_id' do
      let(:response) { put("/api/domains/#{@domain_id}", @domain_as_json) }
      let(:resource) { JSON.load response.body }

      it 'Then returns status code 201' do
        expect(response.status).to eq 201
      end

      describe 'And it persisted the new domain json' do
        it do
          response
          expect(domain_repo.as_json(@domain_id)).to eq (parse_json @domain_as_json)
        end
      end
    end
  end
end