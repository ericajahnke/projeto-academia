prompt = require("prompt-sync")()
const idade = Number(prompt("Digite aqui a sua idade: "))
const altura = Number(prompt("Digite aqui a sua altura em cm: "))
const peso = Number(prompt("Digite aqui o seu peso: "))
var sexo = prompt("Você é homem ou mulher? ")

const homem = (10 * peso) + (6.25 * altura) - (5 * idade) + 5
const mulher = (10 * peso) + (6.25 * altura) - (5 * idade) - 161


// homem
const tmbativah = homem + Number(974.56)
const tmbregularh = homem + Number(757.99)
const tmbnulah = homem + Number(600)

// mulher
const tmbativam = mulher + Number(721.16)
const tmbregularm = mulher + Number(540.87)
const tmbnulam = mulher + Number(360.58)

if (sexo == "homem") {
    console.log(`A sua TMB é de ${homem}`)
} else {
    console.log(`A sua TMB é de ${mulher}`)
}

console.log(" ")
const atividade = prompt("Sua atividade física é ativa, regular ou nula? ")

// parte homem tmb

if (atividade == "ativa" && sexo == "homem") {
    console.log(`A sua TMB é de ${tmbativah.toFixed(2)}`)
} else if (atividade != "ativa" && atividade == "regular" && sexo == "homem") {
    console.log(`A sua TMB é de ${tmbregularh.toFixed(2)}`)
} else if (atividade != "ativa" && atividade != "regular" && atividade == "nula" && sexo == "homem") {
    console.log(`A sua TMB é de ${tmbnulah.toFixed(2)}`)
}

// parte mulher tmb

if (atividade == "ativa" && sexo == "mulher") {
    console.log(`A sua TMB é de ${tmbativam.toFixed(2)}`)
} else if (atividade != "ativa" && atividade == "regular" && sexo == "mulher") {
    console.log(`A sua TMB é de ${tmbregularm.toFixed(2)}`)
} else if (atividade != "ativa" && atividade != "regular" && atividade == "nula" && sexo == "mulher") {
    console.log(`A sua TMB é de ${tmbnulam.toFixed(2)}`)
}

console.log(" ")
const dieta = prompt("Insira a TMB que foi apresentada anteriormente para calcularmos seus macros: ")
var sexo = prompt("Insira seu gênero novamente: ")

// parte homem dieta

if (dieta >= `${homem + Number(974.56)}` && sexo == "homem") {
    console.log(`Então seus macros são: `)
    console.log(`proteina: ${(peso * 2.6).toFixed(2) }g`)
    console.log(`carboidratos: ${(peso * 1.5).toFixed(2) }g`)
    console.log(`gorduras: ${(peso * 0.98).toFixed(2) }g`)

} else if (dieta <= `${homem + Number(757.99)}` && dieta != `${homem + Number(974.56)}` && dieta != `${homem + Number(600)} ` && sexo == "homem") {
    console.log(`Então seus macros são: `)
    console.log(`proteina: ${(peso * 1.6).toFixed(2) }g`)
    console.log(`carboidratos: ${(peso * 0.75).toFixed(2) }g`)
    console.log(`gorduras: ${(peso * 0.57).toFixed(2) }g`)
} else if (dieta != `${homem + Number(600)}` && dieta != `${homem + Number(974.56)}` && dieta <= `${homem + Number(600)}` && sexo == "homem") {
    console.log(`Então seus macros são: `)
    console.log(`proteina: ${(peso * 0.8).toFixed(2) }g`)
    console.log(`carboidratos: ${(peso * 0.37).toFixed(2) }`)
    console.log(`gorduras: ${(peso * 0.32).toFixed(2) }g`)
}

// parte mulher dieta

if (dieta >= `${mulher + Number(721.16)}` && sexo == "mulher") {
    console.log(`Então seus macros são: `)
    console.log(`proteina: ${(peso * 2.6).toFixed(2) }g`)
    console.log(`carboidratos: ${(peso * 1.5).toFixed(2) }g`)
    console.log(`gorduras: ${(peso * 0.98).toFixed(2) }g`)

} else if (dieta <= `${mulher + Number(540.87)}` && dieta != `${mulher + Number(721.16)}` && dieta != `${mulher + Number(360.58)} ` && sexo == "mulher") {
    console.log(`Então seus macros são: `)
    console.log(`proteina: ${(peso * 1.6).toFixed(2) }g`)
    console.log(`carboidratos: ${(peso * 0.75).toFixed(2) }g`)
    console.log(`gorduras: ${(peso * 0.57).toFixed(2) }g`)
} else if (dieta != `${mulher + Number(540.87)}` && dieta != `${mulher + Number(721.16)}` && dieta <= `${mulher + Number(360.58)}` && sexo == "mulher") {
    console.log(`Então seus macros são: `)
    console.log(`proteina: ${(peso * 0.8).toFixed(2) }g`)
    console.log(`carboidratos: ${(peso * 0.37).toFixed(2) }`)
    console.log(`gorduras: ${(peso * 0.32).toFixed(2) }g`)
}