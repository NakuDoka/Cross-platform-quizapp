using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Input;

namespace quizApp.Data_Models
{

    public class QuizQuestion
    {
        public int Answer { get; set; }
        public string[] Options { get; set; }
        public string Question { get; set; }
    }
    public class Quiz
    {
        public string Color { get; set; }
        public string Title { get; set; }
        public List<QuizQuestion> Questions { get; set; }

        

    }

    public class Options
    {
        public string Option { get; set; }
        public int Index { get; set; }
        public string TextColor { get; set; } = "#000000";
        public string ButtonColor { get; set; } = "#FFFFFF";


    }

}
