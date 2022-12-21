using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Internals;
using Xamarin.Forms.Xaml;

namespace quizApp
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class finalpage : ContentPage
    {
        public finalpage(int score, int total, String title, String color)
        {
            InitializeComponent();
            TitleText.Text= title;
            ScoreText.Text = $"{score}/{total}";
            Appbar.BackgroundColor = Color.FromHex(color);
        }

        private void BackToStart(object sender, EventArgs e)
        {
            Navigation.PopToRootAsync();
        }
    }
}