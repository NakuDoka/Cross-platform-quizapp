using Newtonsoft.Json;
using Plugin.CloudFirestore;
using quizApp.Data_Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xamarin.Forms;

namespace quizApp
{
    public partial class MainPage : ContentPage
    {

       
        public  MainPage()
        {
            
            InitializeComponent();

        }

        protected override async void OnAppearing()
        {
            base.OnAppearing();

            // Call the GetAllData method and store the returned task
            var dataTask = GetAllData();

            // Use the await operator to wait for the task to complete
            var quizzes = await dataTask;
            
            myListView.ItemsSource = quizzes;
        }


        public async Task<List<Quiz>> GetAllData()
        {
            var group = await CrossCloudFirestore.Current.Instance.Collection("quiz").GetAsync();
            var yourModels = group.Documents.ToList();

            Dictionary<string, string> colorMap = new Dictionary<string, string>
{
    { "Blue", "#4285F4" },
    { "Yellow", "#FABB05" },
    { "Green", "#34A853" },
    { "Red", "#E94235" }
};

            var quizzes = new List<Quiz>();

            foreach (var document in yourModels)
            {
                
                var quiz = new Quiz();

                // Set the properties of the Quiz object
                String color = document.Data["Color"].ToString();
                quiz.Color = colorMap[color];
                
                quiz.Title = document.Data["Title"].ToString();
               

                // Get the list of quiz questions from the document data
                dynamic questions = document.Data["questions"];
                var questionsTemp = new List<QuizQuestion>();
                
                foreach (var question in questions)
                {
                    
                    var questionTemp = new QuizQuestion();
                    questionTemp.Answer = (int)question["answer"];
                    
                    questionTemp.Question = (string)question["question"];
                    List<dynamic> options = question["options"];
                    questionTemp.Options = options.Select(x => (string)x).ToArray();
                    
                    questionsTemp.Add(questionTemp);
                }
                
                quiz.Questions = questionsTemp;

                // Add the Quiz object to the list
                quizzes.Add(quiz);
                
            }
            
            return quizzes;

        }



        private void OnFrameTapped(object sender, EventArgs e)
        {
            var frame = (Frame)sender;
            Quiz item = (Quiz)frame.BindingContext;

            Navigation.PushAsync(new quizpage(item.Title, item.Color, item.Questions));
        }
    }
}
