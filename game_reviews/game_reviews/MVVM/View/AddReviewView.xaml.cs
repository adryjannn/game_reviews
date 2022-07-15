using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace game_reviews.MVVM.View
{
    /// <summary>
    /// Logika interakcji dla klasy AddReviewView.xaml
    /// </summary>
    public partial class AddReviewView : UserControl
    {

        /// <summary>
        /// Create form for add game review
        /// </summary>
        public AddReviewView()
        {
            InitializeComponent();

            GameReviewsEntities db = new GameReviewsEntities();
            var games = from d in db.Games
                        select d;
            List<ComboData> ListData = new List<ComboData>();
            IList<int> reviewGrade = new List<int>();
            foreach (var game in games)
            {
                ComboData data = new ComboData();
                data.Id = game.ID;
                data.Value = game.Title;
                ListData.Add(data);
            }

            for (int i = 1; i <= 10; i++)
            {
                reviewGrade.Add(i);
            }

                selectGameCBox.ItemsSource = ListData;
                selectGradeCBox.ItemsSource = reviewGrade;    
        }

        /// <summary>
        /// Add review by button click
        /// </summary>
        private void btnAddReview_Click(object sender, RoutedEventArgs e)
        {
            string game = selectGameCBox.Text;
            string gameGrade = selectGradeCBox.Text;
            string reviewContent = gameReviewContent.Text;
            string UserId = "";


            if (game == "" || gameGrade == "" || reviewContent == "")
            {
                MessageBox.Show("input cannot be empty");
                return;
            }
           

            foreach (Window window in Application.Current.Windows)
            {
                if (window.GetType() == typeof(MenuWindow))
                {
                    UserId = (window as MenuWindow).UserIdText.Text;
                }
            }
            GameReviewsEntities db = new GameReviewsEntities();

            var gameId = from d in db.Games
                        where d.Title == game
                        select d;

            var result = gameId.FirstOrDefault<Games>();


            var review = new Reviews();
            review.ID_User = Int32.Parse(UserId);
            review.Rating = Int32.Parse(gameGrade);
            review.Comment = reviewContent;
            review.ID_Game = result.ID;
            db.Reviews.Add(review);

            try
            {
                //Clean data in form
                db.SaveChanges();
                MessageBox.Show("Sucessfully added review");
                selectGameCBox.Text = "";
                selectGradeCBox.Text = "";
                gameReviewContent.Text = "";
            } catch
            {
                MessageBox.Show("Incorrect data");
            }
            
        }
    }

    /// <summary>
    /// Class for combobox with games data 
    /// </summary>
    public class ComboData
    {
        public int Id { get; set; }
        public string Value { get; set; }
    }
}
