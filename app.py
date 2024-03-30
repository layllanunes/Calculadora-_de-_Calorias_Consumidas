from bottle import get, post, request, run, template

# Dicionário para armazenar o registro diário de refeições e calorias
registro_refeicoes = {}

@get('/')
def index():
    return template("index", registro_refeicoes=registro_refeicoes)

@post('/')
def cadastrar():
    try:
        # Obter dados do formulário
        refeicao = request.forms.get("refeicao")
        alimento = request.forms.get("alimento")
        calorias = float(request.forms.get("calorias"))

        # Adicionar alimento à refeição atual
        if refeicao in registro_refeicoes:
            registro_refeicoes[refeicao].append((alimento, calorias))
        else:
            registro_refeicoes[refeicao] = [(alimento, calorias)]

        return template("index", registro_refeicoes=registro_refeicoes)
    except Exception as e:
        return f"Ocorreu um erro: {e}"

run(host='localhost', port=8080)
