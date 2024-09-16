// Sistema de pontos
prompt = require('prompt-sync')()

const nome = prompt('Seja bem-vindo! Qual seu nome? ')
const freq = prompt(`Olá ${nome}, quantos dias você frequentou a academia neste mês (1-30)? `)
const pontos = freq * 10

if (freq < 1 || freq > 30) {
    console.log('Número inválido! Digite um número de 1 a 30.')
} else {
    console.log(`Você foi na academia ${freq} dias e acumulou ${pontos} pontos!`)
}


const premio = prompt('Você quer resgatar algum prêmio? Digite "sim" ou "não". ')

if (premio.toLowerCase() === "não") {
    console.log('Ok, até logo!') 
} else if (premio.toLowerCase() === "sim") {
    console.log('Está é a lista de prêmios.')
    console.log('1. Whey 1kg: 300 Pontos')
    console.log('2. Creatina 500g: 300 Pontos')
    console.log('3. Whey 900g: 260 Pontos')
    console.log('4. Creatina 300g: 240 Pontos')
    console.log('5. Roupas: 210 Pontos')
    console.log('6. Creatina 150g: 200 Pontos')
    console.log('7. Munhequeira: 150 Pontos')
    console.log('8. Strap - 100 Pontos')


    const escolha = parseInt(prompt('Qual prêmio você quer resgatar? (digite o número do prêmio) '));

    switch (escolha) {
        case 1:
            if (pontos >= 300) {
                console.log(`Parabéns! Você resgatou o prêmio Whey 1kg!`);
            } else {
                console.log('Você não tem pontos suficientes para resgatar este prêmio.');
            }
            break;
        case 2:
            if (pontos >= 300) {
                console.log(`Parabéns! Você resgatou o prêmio Creatina 500g!`);
            } else {
                console.log('Você não tem pontos suficientes para resgatar este prêmio.');
            }
            break;
        case 3:
            if (pontos >= 260) {
                console.log(`Parabéns! Você resgatou o prêmio Whey 900g!`);
            } else {
                console.log('Você não tem pontos suficientes para resgatar este prêmio.');
            }
            break;
        case 4:
            if (pontos >= 240) {
                console.log(`Parabéns! Você resgatou o prêmio Creatina 300g!`);
            } else {
                console.log('Você não tem pontos suficientes para resgatar este prêmio.');
            }
            break;
        case 5:
            if (pontos >= 210) {
                console.log(`Parabéns! Você resgatou o prêmio Roupas!`);
            } else {
                console.log('Você não tem pontos suficientes para resgatar este prêmio.');
            }
            break;
        case 6:
            if (pontos >= 200) {
                console.log(`Parabéns! Você resgatou o prêmio Creatina 150g!`);
            } else {
                console.log('Você não tem pontos suficientes para resgatar este prêmio.');
            }
            break;
        case 7:
            if (pontos >= 150) {
                console.log(`Parabéns! Você resgatou o prêmio Munhequeira!`);
            } else {
                console.log('Você não tem pontos suficientes para resgatar este prêmio.');
            }
            break;
        case 8:
            if (pontos >= 100) {
                console.log(`Parabéns! Você resgatou o prêmio Strap!`);
            } else {
                console.log('Você não tem pontos suficientes para resgatar este prêmio.');
            }
            break;
        default:
            console.log('Opção inválida. Tente novamente!');
    }
}