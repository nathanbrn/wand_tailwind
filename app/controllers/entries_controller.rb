# app/controllers/entries_controller.rb
class EntriesController < ApplicationController

  before_action :set_categories, only: [:new, :edit]

  def index
    tipo = params[:tipo].present? ? params[:tipo] : 2
    @entries = Entry.por_tipo(tipo)
    render inertia: 'Entries/Index', props: { entries: @entries.as_json(include: :category), tipo: tipo }
  end

  def new
    @entry = Entry.new
    render inertia: 'Entries/New', props: { entry: @entry, categories: @categories }
  end

  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      redirect_to entries_path, notice: 'Operação realizada com sucesso.', turbolinks: false
    else
      redirect_to new_entry_path, inertia:{ errors: @entry.errors.full_messages }
    end
  end

  def edit
    @entry = Entry.find(params[:id])
    render inertia: 'Entries/Edit', props: { entry: @entry, categories: @categories }
  end

  def update
    @entry = Entry.find(params[:id])
    if @entry.update(entry_params)
      redirect_to entries_path, notice: 'Operação realizada com sucesso.'
    else
      render inertia: 'Entries/Edit', props: { entry: @entry, categories: @categories }
    end
  end

  def destroy
    @entry = Entry.find(params[:id])

    if @entry.destroy
      redirect_to entries_path, notice: 'Registro deletado com sucesso!', turbolinks: false
    else
      redirect_to entries_path, notice: 'Erro ao deletar registro'
    end
  end

  private

  def set_categories
    @categories = Category.all
  end

  def entry_params
    params.require(:entry).permit(:description, :amount, :status, :entry_type, :category_id)
  end
end
