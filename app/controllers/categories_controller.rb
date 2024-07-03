class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    render inertia: 'Categories/Index', props: { categories: @categories.as_json }
  end

  def new
    @category = Category.new
    render inertia: 'Categories/New', props: { category: @category }
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, notice: 'Categoria criada com sucesso'
    else
      redirect_to new_category_path, inertia:{ errors: @category.errors.full_messages }
    end
  end

  def edit
    @category = Category.find(params[:id])
    render inertia: 'Categories/Edit', props: { category: @category, categories: @categories }
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to categories_path, notice: 'Categoria atualizada com sucesso.'
    else
      render inertia: 'Categories/Edit', props: { category: @category, categories: @categories }
    end
  end

  def destroy
    @category = Category.find(params[:id])

    if @category.destroy
      redirect_to categories_path, notice: 'Registro deletado com sucesso!'
    else
      redirect_to categories_path, notice: 'Erro ao deletar registro'
    end
  end

  private

  def set_categories
    @categories = Category.all
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
