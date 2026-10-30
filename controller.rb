class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    # 1. Recuperar todas as recipes do cookbook
    recipes = @cookbook.all
    # 2. enviar as recipes para a view listar
    @view.display_list(recipes)

  end

  def add
    # 1. Perguntar o nome e a descriçao da recipe
    name = @view.ask_name
    description = @view.ask_description

    # 2. Criar uma instância da recipe
    recipe = Recipe.new(name, description)

    # 3. Adicionar a recipe no cookbook
    @cookbook.create(recipe)
  end

  def remove
    # 1. listar todas receitas
    list
    # 2. Perguntar qual o index da recipe
    index = @view.ask_index
    # 3. Mandar o cookbook remover a recipe pelo index
    @cookbook.destroy(index)
  end
end
