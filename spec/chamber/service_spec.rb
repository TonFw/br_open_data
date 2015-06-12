require 'spec_helper'

describe BROpenData::Chamber::Service do
  before(:all) do
    @client = BROpenData::Chamber::Service.instance
  end

  describe 'List law projects' do
    context 'PL' do
      before(:all) do
        @pl = @client.propositions sigla: 'PL'
      end

      it 'must have a list of PLs' do
        expect(@pl).to be_a_kind_of Array
      end
    end

    context 'PEC' do
      before(:all) do
      end
    end

    context 'MVP' do
      before(:all) do
      end
    end
  end
end
