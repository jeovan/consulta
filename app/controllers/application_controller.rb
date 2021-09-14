class ApplicationController < ActionController::Base
  before_action :valida_token


  def valida_token
    @dados = JSON.parse(Sefin::Sso::Autenticacao.new.valida_token(cookies,params))
    if @dados['redirecionar']
      redirect_to "https://sistemas.sefin.ro.gov.br/login?url=#{request.url}"
    end
  end

end
