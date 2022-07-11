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
using System.Windows.Shapes;

namespace game_reviews
{
    /// <summary>
    /// Logika interakcji dla klasy UpdateReviewWindow.xaml
    /// </summary>
    public partial class UpdateReviewWindow : Window
    {
        public int IdReview;
        public UpdateReviewWindow(int id)
        {
            InitializeComponent();
            IdReview = id;
            IList<int> reviewGrade = new List<int>();
            for (int i = 1; i <= 10; i++)
            {
                reviewGrade.Add(i);
            }
            GameReviewsEntities db = new GameReviewsEntities();
            var reviews = db.Reviews.First(a => a.ID == IdReview);
            gameReviewContent.Text = reviews.Comment.ToString();
            selectGradeCBox.SelectedItem = Int32.Parse(reviews.Rating.ToString());

            selectGradeCBox.ItemsSource = reviewGrade;
        }

        private void btnUpdateReview_Click(object sender, RoutedEventArgs e)
        {
            GameReviewsEntities db = new GameReviewsEntities();
            var reviews = db.Reviews.First(a => a.ID == IdReview);
            if (gameReviewContent.Text.Length >= 5)
            {
                reviews.Comment = gameReviewContent.Text;
                reviews.Rating = Int32.Parse(selectGradeCBox.Text);
                db.SaveChanges();
                MessageBox.Show("successfully updated");
                this.Close();
                
            } else
            {
                MessageBox.Show("The length comment : minimum 5 characters");
            }

        }
    }
}
