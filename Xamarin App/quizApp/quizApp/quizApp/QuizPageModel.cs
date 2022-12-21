using quizApp.Data_Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using Xamarin.Forms;

namespace quizApp
{
    public class QuizPageModel : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;

        void OnPropertyChanged([CallerMemberName] String name = "")
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(name));
        }


        // current chosen
        private int? _currentChosen;
        public int? CurrentChosen
        {
            get { return _currentChosen;  }
            set
            {
                _currentChosen = value;
                OnPropertyChanged();
            }
        }

        // current buttonText
        private string _currentButtonText;
        public string CurrentButtonText
        {
            get { return _currentButtonText; }
            set
            {
                _currentButtonText = value;
                OnPropertyChanged();
            }
        }

        // current question
        private string _currentQuestionText;
        public string CurrentQuestionText
        {
            get { return _currentQuestionText; }
            set 
            { 
                _currentQuestionText = value;
                OnPropertyChanged();
            }
        }

        // current options
        private string[] _currentoptions;
        public string[] CurrentOptions
        {
            get { return _currentoptions; }
            set
            {
                _currentoptions = value;
                OnPropertyChanged();
            }
        }

        // current options class
        private Options[] _currentOptionsClass;
        public Options[] CurrentOptionsClass
        {
            get { return _currentOptionsClass; }
            set 
            { 
            _currentOptionsClass = value;
            OnPropertyChanged();
            }
        }

        // Current answer
        private int _currentAnswerValue;
        public int CurrentAnswerValue
        {
            get { return _currentAnswerValue; }
            set { _currentAnswerValue= value; OnPropertyChanged(); }
        }

        private int _totalQuestions;
        public int TotalQuestions
        {
            get
            { return _totalQuestions; }
            set
            {
                _totalQuestions = value;
                OnPropertyChanged();
                OnPropertyChanged(nameof(TitleText));
            }
        }


        // current Question number
        private int _currentQuestionNumber;
        public int CurrentQuestionNumber
        {
            get
            {
                return _currentQuestionNumber;
            }

            set
            {
                _currentQuestionNumber = value;
                OnPropertyChanged();
                OnPropertyChanged(nameof(TitleText));
            }
        }



        // text 
        public string TitleText
        {
            get { return $"Question {_currentQuestionNumber}/{_totalQuestions}"; }
        }

        private int score;
        private int index;
        public Command NextQuestion { get; }
        public ICommand ChooseOptionCommand { get; }


        public QuizPageModel(List<QuizQuestion> questions)
        {

            // initialise quiz values
            TotalQuestions = questions.Count;
            CurrentQuestionNumber= 1;
            score= 0;
            index = 0;
            CurrentChosen = null;
            CurrentButtonText = "Next";

            // load first question
            LoadQuestion(questions);

            // NextQuestion function
            NextQuestion = new Command(async () =>
            {
                
                if (CurrentChosen != null)
                {

                    if (CurrentAnswerValue == CurrentChosen)
                    {
                        score++;
                    }
                    
                    if (index == TotalQuestions - 1)
                    {
                        await ShowResults();
                    }
                    else
                    {
                        CurrentQuestionNumber++;    
                        index++;
                        if (index == TotalQuestions - 1)
                        {
                            CurrentButtonText = "Finish";
                        }
                        LoadQuestion(questions);
                    }
                    ;
                    CurrentChosen = null;
                }
            });

            // ChooseCommand function
            ChooseOptionCommand = new Command<int>(ChooseOption);


        }

        private void ChooseOption(int indexC)
        {
            List<Options> tempOptions = new List<Options>();
            int tempindex = 0;
            foreach (var option in CurrentOptions)
            {
                Options tempOption = new Options();
                tempOption.Option = option;
                tempOption.Index = tempindex;
                tempindex++;
                tempOptions.Add(tempOption);
            }
            CurrentOptionsClass = tempOptions.ToArray();
            CurrentChosen = indexC;
            CurrentOptionsClass[indexC].ButtonColor = "#4285F4";
            CurrentOptionsClass[indexC].TextColor = "#FFFFFF";
        }

        private void LoadQuestion(List<QuizQuestion> questions)
        {
            CurrentQuestionText = questions[index].Question;
            CurrentAnswerValue = questions[index].Answer;
            CurrentOptions = questions[index].Options;
            List<Options> tempOptions = new List<Options>();
            int tempindex = 0;
            foreach (var option in CurrentOptions)
            {
                Options tempOption = new Options();
                tempOption.Option = option;
                tempOption.Index = tempindex;
                tempindex++;
                tempOptions.Add(tempOption);
            }
            CurrentOptionsClass= tempOptions.ToArray();
        }


        private async Task ShowResults() => await Application.Current.MainPage.Navigation.PushAsync(new finalpage(score, _totalQuestions, "80s Music Quiz", "#FABB05")).ConfigureAwait(false);

    }
}
