module BROpenData::Chamber
  class Service < BROpenData::ParentService
    include Singleton
    def initialize
      self.domain = 'www.camara.gov.br/SitCamaraWS'
    end

    # Return projects/propositions of Laws & Constitutional
    # @params sigla: 'PL,PEC,MPV', numero: 1, ano:'2015', datApresentacaoIni:'14/11/2011',
    # @params datApresentacaoFim: '16/11/2011', parteNomeAutor: 'João', idTipoAutor:'Suplente', codEstado: 'TO', codOrgaoEstado: 12, emTramitacao: true
    # @params siglaUFAutor: 'TO', generoAutor: 'M'
    def propositions(params={})
      self.path='Proposicoes.asmx/ListarProposicoes'
      setup_propositions(params)
      resp = perform_get_request
      resp[:proposicoes][:proposicao]
    end

    private
      # SetUp the params to be not nil
      def setup_propositions(params)
        self.params = {
          sigla: params[:sigla], numero: params[:numero], ano: params[:ano], datApresentacaoIni: params[:datApresentacaoIni],
          generoAutor: params[:generoAutor], datApresentacaoFim: params[:datApresentacaoFim], parteNomeAutor: params[:parteNomeAutor],
          idTipoAutor: params[:idTipoAutor], siglaUFAutor: params[:siglaUFAutor], codEstado: params[:codEstado],
          codOrgaoEstado: params[:codOrgaoEstado], emTramitacao: params[:emTramitacao], siglaPartidoAutor: params[:siglaPartidoAutor]
        }
      end
  end
end