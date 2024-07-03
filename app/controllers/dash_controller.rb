class DashController < ApplicationController
  use_inertia_instance_props
  def index
    receita = Entry.soma_valores(1).sum(&:amount)
    despesa = Entry.soma_valores(2).sum(&:amount)
    despesa_pendente = Entry.soma_valores(2).soma_despesas_pendentes.sum(&:amount)
    @resumo = {
      receita: receita,
      despesa: despesa,
      pendente: despesa_pendente
    }
    render inertia:true
  end
end
