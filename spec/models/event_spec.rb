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

  describe 'class methods' do 
    describe 'get_date' do 
      it 'returns a date object' do
        expect(Event.get_date({"time(1i)" => '01',
                               "time(2i)" => '01',
                               "time(3i)" => '01',
                               "time(4i)" => '01',
                               "time(5i)" => '01'}).class).to eq(Time)
      end
    end

    describe 'upcoming' do 
      it 'returns an array' do 
        expect(Event.upcoming.class).to eq(Array)
      end
    end
  end
end