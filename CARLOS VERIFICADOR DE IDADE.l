<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cadastro 18+</title>

<style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: linear-gradient(135deg, #5f9c76, #c2e59c);
}

.container {
    background: #fff;
    width: 320px;
    margin: 40px auto;
    padding: 20px;
    border-radius: 12px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.2);
}

h2 {
    text-align: center;
}

input, select {
    width: 100%;
    padding: 10px;
    margin: 6px 0;
    border-radius: 6px;
    border: 1px solid #ccc;
    font-size: 14px;
}

/* 🔥 DATA ALINHADA PERFEITA */
.data {
    display: flex;
    gap: 8px;
}

.data select {
    flex: 1;
    height: 40px;
    padding: 0 10px;
    border-radius: 6px;
    border: 1px solid #ccc;
    background: white;
    font-size: 14px;
}

button {
    width: 100%;
    padding: 12px;
    background: #4e7d4e;
    color: white;
    border: none;
    border-radius: 8px;
    cursor: pointer;
}

button:hover {
    background: #3d663d;
}
</style>
</head>

<body>

<div class="container">
    <h2>Cadastro 18+</h2>

    <form id="formCadastro">

        <input type="text" id="nome" placeholder="Nome completo" required>
        <input type="text" id="email" placeholder="Email" required>
        <input type="text" id="senha" placeholder="Senha" required>

        <label>Data de nascimento:</label>

        <div class="data">
            <select id="dia" required></select>
            <select id="mes" required>
                <option value="">Mês</option>
                <option value="1">Jan</option>
                <option value="2">Fev</option>
                <option value="3">Mar</option>
                <option value="4">Abr</option>
                <option value="5">Mai</option>
                <option value="6">Jun</option>
                <option value="7">Jul</option>
                <option value="8">Ago</option>
                <option value="9">Set</option>
                <option value="10">Out</option>
                <option value="11">Nov</option>
                <option value="12">Dez</option>
            </select>
            <select id="ano" required></select>
        </div>

        <button type="submit">Cadastrar</button>
    </form>
</div>

<script>
// dias
for (let i = 1; i <= 31; i++) {
    let opt = document.createElement("option");
    opt.value = i;
    opt.text = i;
    document.getElementById("dia").appendChild(opt);
}

// anos
let anoAtual = new Date().getFullYear();
for (let i = anoAtual; i >= 1900; i--) {
    let opt = document.createElement("option");
    opt.value = i;
    opt.text = i;
    document.getElementById("ano").appendChild(opt);
}

// validação 18+
document.getElementById("formCadastro").addEventListener("submit", function(e) {
    e.preventDefault();

    let dia = document.getElementById("dia").value;
    let mes = document.getElementById("mes").value;
    let ano = document.getElementById("ano").value;

    let nascimento = new Date(ano, mes, dia);
    let hoje = new Date();

    let idade = hoje.getFullYear() - nascimento.getFullYear();
    let m = hoje.getMonth() - nascimento.getMonth();

    if (m < 0 || (m === 0 && hoje.getDate(16) < nascimento.getDate(4))) {
        idade--;
    }

    if (idade < 18) {
        alert("❌ Apenas maiores de 18 anos podem se cadastrar.");
        return;
    }

    alert("✅ Cadastro liberado!");
    this.reset();
});
</script>

</body>
</html>
