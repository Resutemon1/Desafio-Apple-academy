//
//  main.swift
//  desafio
//
//  Created by CAIO TROIANO COLLINO on 14/11/25.
//

import Foundation
var  atributos: [Int] = [0,0,0,0,0,0,0]
var  classe = ""
// pos 0 - vida
// pos 1 - mana
// pos 2 - municao
// pos 3 - forca
// pos 4 - inteligencia
// pos 5 - destreza
// pos 6 - carisma
var vit = 0
var man = 0
var mun = 0
var fr = 0
var int = 0
var dex = 0
var char  = 0
var nomeGlobal = ""
func rollDice() -> Int {
return Int.random(in: 1...20)
}
var  vidaGoblin: [Int] = [100,1]
var  vidaDragao: [Int] = [300,5]
//vida pos 0
//dif pos 1
func danoM(_ n:Int) -> Int{
    var danoTotal = 0
    for _ in 0...n{
        let d =  rollDice()
         
        danoTotal += d
     }
    return danoTotal
    }
func descansar (){
    atributos[0] = vit
    atributos[1] = man
    atributos[2] = mun
}
func dano() -> Int{
    var danoTotal = 0

    switch classe{
    case "guerreiro":
        for _ in 0...atributos[3]{
           let d =  rollDice()
            
           danoTotal += d
        }
        return danoTotal
    case "mago":
        for _ in 0...atributos[4]{
           let d =  rollDice()
            
           danoTotal += d
        }
        return danoTotal
    case "arqueiro":
        for _ in 0...atributos[5]{
           let d =  rollDice()
            
           danoTotal += d
        }
        return danoTotal
    case "coach":
        for _ in 0...atributos[6]{
           let d =  rollDice()
            
           danoTotal += d
        }
        return danoTotal
    default:
        for _ in 0...atributos[3]{
           let d =  rollDice()
            
           danoTotal += d
        }
        return danoTotal
        
    }

}
func proximaFase(){
    print("Agora é o boss final")
    print("\(nomeGlobal) encontrou o Dragao com  \(vidaDragao[0])")
    var vida = atributos[0]
    var flag = true
    descansar()
    while(flag == true ){
        if(vidaDragao[0] <= 0){
            flag = false
            print("voce é o verdadeiro campeao!!!")
            exit(0)
        }
        else if(atributos[0] <= 0){
            flag = false
            print("vc perdeu !!")
            exit(0)
            
        }
        
        if(ataque() == true){
            let danoH = dano()
            print("seu ataque deu \(danoH)")
            
            vidaGoblin[0] -= danoH
           
        }
        else{
            let dano = danoM(vidaDragao[1])
            atributos[0] -= dano
            print("\(nomeGlobal) errou e tomou \(dano) restando com \(atributos[0]) restante")
        }
    }
}
func menu (){
    print("Menu")
    print("1- confronto 2 - status  3 - descansar  4 - sair")
    if let item = readLine(), let num = Int(item) {
        switch num{
        case 1:
            var vida = atributos[0]
            print("\(nomeGlobal) encontrou um goblin com \(vidaGoblin[0]) de vida")
            var flag = true
            while(flag == true ){
                if(vidaGoblin[0] <= 0){
                    flag = false
                    print("parabens \(nomeGlobal) ganhou")
                    proximaFase()
                }
                else if(atributos[0] <= 0){
                    flag = false
                    print("\(nomeGlobal) perdeu !!")
                    exit(0)
                    
                }
                
                if(ataque() == true){
                    let danoH = dano()
                    print("seu ataque deu \(danoH)")
                    
                    vidaGoblin[0] -= danoH
                   
                }
                else{
                    let dano = danoM(vidaGoblin[1])
                    atributos[0] -= dano
                    print("\(nomeGlobal) errou e tomou \(dano) restando com \(atributos[0]) restante")
                }
            }
           
            
            
        case 2:
            status()
          
            menu()
            
        case 3:
            descansar()
            menu()
            
        case 4:
            exit(0)
            
            
        default:
            print("perdeu ponto")
            
        }
    }
    
}
func ataque() -> Bool{
    let atMonstro = rollDice()
    let atHeroi = rollDice()
    if(atHeroi >= atMonstro){
        return true
    }
    else{
        return false
        
    }

}
func status(){
    print("seus status: ")
    print(nomeGlobal)
    print(classe)
    print("vida: \(atributos[0])")
    print("mana: \(atributos[1])")
    print("municao: \(atributos[2])")
    print("forca: \(atributos[3])")
    print("inteligencia: \(atributos[4])")
    print("destreza: \(atributos[5])")
    print("carisma: \(atributos[6])")
    
    // pos 0 - vida
    // pos 1 - mana
    // pos 2 - municao
    // pos 3 - forca
    // pos 4 - inteligencia
    // pos 5 - destreza
    // pos 6 - carisma

}


print("Bem Vindo a Dungeon , Qual o nome do explorador: ")

if let nome = readLine (){
    nomeGlobal = nome
    print("Bem vindo : \(nome)")
    let atri  = Int.random(in: 1...5)
    print("Atributos vao definir quantos dados de dano sera rolado exceto no carisma, nele o maior numero ganha")
    print("\(nomeGlobal) tem \(atri) para distruibuir: ")
    for _ in 1...atri {
        print("1 - forcao(fr) 2 - inteligencia(int) 3 - destreza(dex) 4 - carisma(chr):")
        if let item = readLine(), let num = Int(item){
           
            switch num{
            case 1:
                fr += 1
                atributos[3] = fr
                
                
            case 2:
                int += 1
                atributos[4] = int
                
            case 3:
                dex += 1
                atributos[5] = dex
                
            case 4:
                char += 1
                atributos[6] = char
                
            default:
                print("perdeu ponto")
                
            }

        }
    }
    print("Agora selecione a sua classe")
    print("1 - guerreiro 2 - mago 3 - arqueiro 4 - coach:")
    if let item = readLine(), let num = Int(item){
       
        switch num{
        case 1:
            classe = "guerreiro"
            var vit = 100

            atributos[0] = vit
            
        case 2:
            classe = "mago"
            var vit = 50
            var man = 5
            atributos[0] = vit
            atributos[1] = 5
        case 3:
            classe = "arqueiro"
            var vit = 70
            var mun = 10
            atributos[0] = vit
            atributos[2] = mun
        case 4:
            classe = "coach"
            var vit = 60
            atributos[0] = vit
        default:
            classe = "guerreiro"
            var vit = 100
            atributos[0] = vit
            
        }
        
    }
    status()
    menu()

    
}

