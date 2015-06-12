module BROpenData::Chamber
  class Service < ParentService
    include Singleton
    def initialize
      self.end_point = 'http://www.camara.gov.br/SitCamaraWS'
    end

    # Return projects/propositions of Laws & Constitutional
    # @params sigla: 'PL,PEC,MPV', numero: 1, ano:'2015', datApresentacaoIni:'14/11/2011',
    # @params datApresentacaoFim: '16/11/2011', parteNomeAutor: 'João', idTipoAutor:'Suplente', codEstado: 'TO', codOrgaoEstado: 12, emTramitacao: true
    # @params siglaUFAutor: 'TO', generoAutor: 'M'
    def propositions(params={})
      self.params = params
      perform_get_request
    end
  end
end