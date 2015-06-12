module BROpenData::Senate
  class Service < BROpenData::ParentService
    include Singleton
    def initialize
      self.end_point = 'http://legis.senado.leg.br/dadosabertos'
    end
  end
end