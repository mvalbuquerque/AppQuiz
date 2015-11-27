//
//  QuizModel.swift
//  Quiz
//
//  Created by Marcos Vinicius Albuquerque on 11/26/15.
//  Copyright © 2015 Marcos Vinicius Albuquerque. All rights reserved.
//

import Foundation
import UIKit

class Question {
    var strQuestion : String!     // String para armazenar o texto da questão
    var imgQuestion : UIImage!    // UIImagem para armazenar a imagem para ilustrar a pergunta
    var answers: [Answer]!        // Vetor de objetos da classe Anser para armazenar as respostas

    
    //função que inicializa o objeto da classe Question
    
    init(question : String, strImageFileName : String, answers : [Answer]){
    self.strQuestion = question
    self.imgQuestion = UIImage(named: strImageFileName)
    self.answers = answers
    
    }

}


class Answer {
    
    var strAnswer : String!  // String para armazenar o texto da resposta
    var isCorrect : Bool!    // Booleana para armazenar se a resposta é correta ou não
    
    // função que inicializa o objeto da classe Answer
    
    init(answer: String, isCorrect : Bool) {
    self.strAnswer = answer
    self.isCorrect = isCorrect
    
    }
    
    
}