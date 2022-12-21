using quizApp.Data_Models;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Reactive.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace quizApp
{
    [XamlCompilation(XamlCompilationOptions.Compile)]

    public partial class quizpage : ContentPage
    {
        public quizpage(string title, string color, List<QuizQuestion> questions)
        {

            InitializeComponent();
            BindingContext = new QuizPageModel(questions);
            TitleText.Text = title;
            AppBar.BackgroundColor = Color.FromHex(color);
            
        }

    }
}