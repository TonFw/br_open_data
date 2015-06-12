require 'spec_helper'

describe BROpenData::Chamber::Service do
  before(:all) do
    @client = BROpenData::Chamber::Service.instance
  end

  describe 'List law projects' do
    context 'PL' do
      before(:all) do
        @pls = @client.propositions sigla: 'PL', ano: 2015
      end

      it 'must have a list of PLs' do
        expect(@pls).to be_a_kind_of Array
      end

      context 'valid PL' do
        before(:all) do
          @pl = @pls.first  
        end
        
        it 'must have an ID' do
          expect(@pl[:id]).to_not be_nil
        end

        it 'must have a name' do
          expect(@pl[:nome]).to_not be_nil
          expect(@pl[:nome].index('PL')).to_not be_nil
        end

        it 'must have a valid PropositionKind' do
          expect(@pl[:tipoProposicao]).to be_a_kind_of Hash
          @pl[:tipoProposicao].keys.each do |key|
            expect(@pl[:tipoProposicao][key]).to_not be_nil
          end
        end
        
        it 'must be up-to-date (this year)' do
          current_year = (@pl[:ano].to_s == Time.now.year.to_s)
          expect(current_year).to be_truthy
        end

        it 'must have a public agency' do
          expect(@pl[:orgaoNumerador]).to be_a_kind_of Hash
        end
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
