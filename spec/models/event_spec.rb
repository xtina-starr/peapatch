require 'spec_helper'

describe Event do 
  let(:event) { create(:event) }
  describe "validates" do

    it 'is valid' do
      expect(event).to be_valid
    end

    it 'presence of title' do 
      event.update(title: nil)
      expect(event.errors[:title]).to include "can't be blank"
    end

    it 'presence of start_time' do
      event.update(start_time: nil)
      expect(event.errors[:start_time]).to include "can't be blank"
    end

    it 'start_time is after Time.now' do 
      event.update(start_time: Time.now - 60 * 60)
      expect(event.errors[:start_time]).to include "must be in the future"
    end

    it 'end_time occurs after start_time' do
      event.update(end_time: Time.now - 60 * 60)
      expect(event.errors[:end_time]).to include "must end after it begins"
    end
  end
end