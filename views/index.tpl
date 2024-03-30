<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calculadora de Calorias Consumidas</title>
</head>
<body>
    <h1>Calculadora de Calorias Consumidas</h1>
    <h2>Registre sua refeição:</h2>
    <form method="post">
        <label for="refeicao">Refeição:</label>
        <input type="text" name="refeicao" id="refeicao" />
        <br/>
        <label for="alimento">Alimento:</label>
        <input type="text" name="alimento" id="alimento" />
        <br/>
        <label for="calorias">Calorias:</label>
        <input type="number" name="calorias" id="calorias" />
        <br/>
        <button type="submit">Registrar Alimento</button>
    </form>
    <h2>Registro Diário de Refeições e Calorias Consumidas:</h2>
    <ul>
        % for refeicao, alimentos in registro_refeicoes.items():
            <li>
                <strong>{{ refeicao }}:</strong>
                <ul>
                    % for alimento, calorias in alimentos:
                        <li>{{ alimento }} - {{ calorias }} calorias</li>
                    % end
                    <li><strong>Total de Calorias nesta Refeição:</strong> {{ sum([calorias for _, calorias in alimentos]) }}</li>
                </ul>
            </li>
        % end
    </ul>
</body>
</html>
