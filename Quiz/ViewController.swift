//
//  ViewController.swift
//  Quiz
//
//  Created by Marcos Vinicius Albuquerque on 11/26/15.
//  Copyright © 2015 Marcos Vinicius Albuquerque. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Arraste a label aqui
    
    @IBOutlet weak var lbQuestion: UILabel!
    @IBOutlet weak var imgQuestion: UIImageView!
    @IBOutlet weak var btnAnswer1: UIButton!
    @IBOutlet weak var btnAnswer2: UIButton!
    @IBOutlet weak var btnAnswer3: UIButton!
    
    
    @IBOutlet weak var viewFeedback: UIView!
    @IBOutlet weak var lbFeedback: UILabel!
    @IBOutlet weak var btnFeedback: UIButton!
    

    //Declarando um vetor de questões
    var questions : [Question]!   // Vetor que contém as questões do quiz
    var currentQuestion = 0       // Int que indica qual questão atual
    var grade = 0.0               // Double para cálculo da nota
    var quizEnded = false         // Bool que indica se o quiz terminou ou não
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        let q0answer0 = Answer(answer: "120 anos", isCorrect: true)
        let q0answer1 = Answer(answer: "130 anos", isCorrect: false)
        let q0answer2 = Answer(answer: "140 anos", isCorrect: false)
       
        let question0 = Question (question: "Quantos anos vive em média um elefante africano?", strImageFileName: "elefante", answers: [q0answer0,q0answer1,q0answer2])
        
        
        let q1answer0 = Answer(answer: "2,5 m", isCorrect: true)
        let q1answer1 = Answer(answer: "3,5 m", isCorrect: false)
        let q1answer2 = Answer(answer: "4,5 m", isCorrect: false)
        
        let question1 = Question (question: "Quantos metros tem uma girafa adulta?", strImageFileName: "girafa", answers: [q1answer0,q1answer1,q1answer2])
        
        
        let q2answer0 = Answer(answer: "2300 kg", isCorrect: true)  //Questão correta
        let q2answer1 = Answer(answer: "3300 kg", isCorrect: false)
        let q2answer2 = Answer(answer: "4300 kg", isCorrect: false)
        
        let question2 = Question (question: "Quanto pesa em média um rinoceronte-branco macho adulto?", strImageFileName: "rinoceronte", answers: [q2answer0,q2answer1,q2answer2])
        
        
        let q3answer0 = Answer(answer: "54 km/h", isCorrect: true)  //Questão correta
        let q3answer1 = Answer(answer: "64 km/h", isCorrect: false)
        let q3answer2 = Answer(answer: "74 km/h", isCorrect: false)
        
        let question3 = Question (question: "Qual é a velocidade de uma zebra?", strImageFileName: "zebra", answers: [q3answer0,q3answer1,q3answer2])
        
        
        questions = [question0, question1, question2, question3]
        
        //Inicia o Quiz
        startQuiz()
    }
    
    func startQuiz()  {
    
    questions.shuffle() //Embaralha o vetor de questões
        for(var i=0;i<questions.count;i++) {
        questions[i].answers.shuffle() //Embaralha o vetor de respostas para cada questão.
        
        }
        
        //reseta as variáveis de progresso do usuário
        quizEnded = false
        grade = 0.0
        currentQuestion = 0
        
        showQuestion(0)  //mostra a primeira questão
        
    }
    
    //Atualiza o label de questão, imagem e texto dos 3 botões de alternativas
    func showQuestion(questionid :Int){
    
    //Habilitando os 3 botões das alternativas
    btnAnswer1.enabled = true
    btnAnswer2.enabled = true
    btnAnswer3.enabled = true
    
    lbQuestion.text = questions[questionid].strQuestion
    imgQuestion.image = questions[questionid].imgQuestion
    btnAnswer1.setTitle(questions[questionid].answers[0].strAnswer, forState: UIControlState.Normal)
    btnAnswer2.setTitle(questions[questionid].answers[1].strAnswer, forState: UIControlState.Normal)
    btnAnswer3.setTitle(questions[questionid].answers[2].strAnswer, forState: UIControlState.Normal)
    
    
    }
    
    // Função que seleciona uma alternativa
    func selectAnswer(answerid : Int) {
    btnAnswer1.enabled = false
    btnAnswer2.enabled = false
    btnAnswer3.enabled = false
        
        //Mostra a view de feedback
        viewFeedback.hidden = false
    
        //Seleciona a resposta
        let answer : Answer = questions[currentQuestion].answers[answerid]
        
        if(answer.isCorrect == true) {
        grade = grade + 1.0 // coma 1 ponto caso a resposta esteja correta
      
         // Quando acertar a resposta
        lbFeedback.text = answer.strAnswer + "\n\nResposta correta!"
        }
        else
        {
        // Quando a resposta esta errada
        lbFeedback.text = answer.strAnswer + "\n\nRespota Errada"
        }
        if(currentQuestion < questions.count-1) {
        // Caso a questão atual não seja a última, atualiza o texto do botão feedback para "Próxima"
        btnFeedback.setTitle("Próxima", forState: UIControlState.Normal)
        }
        else
        {
        //Caso a questão atual seja a última o texto do botão feedback para "Ver Nota"
        btnFeedback.setTitle("Ver Nota", forState: UIControlState.Normal)
            
        }
        
        
        
    }
    
    
    
    //Ação do botão resposta 1
    @IBAction func choosebtnAnswer1(sender: AnyObject) {
        
        
        selectAnswer(0)
        
    }
    
    
    //Ação do botão resposta 2
    @IBAction func ChoosebtnAnswer2(sender: AnyObject) {
        
        selectAnswer(1)
    }
    
    
    //Ação do botão resposta 3
    @IBAction func choosebtnAnswer3(sender: AnyObject) {
        
        selectAnswer(2)
    }

    
    
    
    @IBAction func btnFeedbackAction(sender: AnyObject) {
        
        viewFeedback.hidden = true
        
        if(quizEnded) {
        
        startQuiz()
        
        }else
        
        {
        
        nextQuestion()
        
        }
        
    }
    
    
    
    func  nextQuestion(){
        //Incrementa em 1 o valor da variável de questão atual
        currentQuestion++
        
        if(currentQuestion < questions.count) {
            
            showQuestion(currentQuestion)
        }
        else
        {
            
            endQuiz()
            
        }
        
    }
    

    func endQuiz() {
            //Calcula a nota do jogador de 0 a 100
            grade = grade / Double(questions.count) * 100.0
            quizEnded = true
            viewFeedback.hidden = false
            lbFeedback.text = "Sua Nota: \(grade)"
            btnFeedback.setTitle("Refazer", forState: UIControlState.Normal)
            
            
        }
        
    }


