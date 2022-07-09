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
        
        public AddReviewView()
        {
            InitializeComponent();

            GameReviewsEntities db = new GameReviewsEntities();
            var games = from d in db.Games
                        select d;
            List<ComboData> ListData = new List<ComboData>();
            foreach (var game in games)
            {
                ComboData data = new ComboData();
                data.Id = game.ID;
                data.Value = game.Title;
                ListData.Add(data);
            }

            selectGameCBox.ItemsSource = ListData;
            
           
            
           // this.DataContext = games;
           
            
        }

        private void btnAddReview_Click(object sender, RoutedEventArgs e)
        {
            var game = selectGameCBox.Text;
            var gameGrade = gameReviewGrade.Text;
            var reviewContent = gameReviewContent.Text;
            string UserId = "";
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


            Console.WriteLine(result.ID);
            var review = new Reviews();
            review.ID_User = Int32.Parse(UserId);
            review.Rating = Int32.Parse(gameGrade);
            review.Comment = reviewContent;
            review.ID_Game = result.ID;
            db.Reviews.Add(review);
            db.SaveChanges();
        }
    }

    public class ComboData
    {
        public int Id { get; set; }
        public string Value { get; set; }
    }
}
