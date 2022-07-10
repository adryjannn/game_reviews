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
    /// Logika interakcji dla klasy ReviewView.xaml
    /// </summary>
    public partial class ReviewView : UserControl
    {
        public ReviewView()
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
        }

        private void selectGameBtn_Click(object sender, RoutedEventArgs e)
        {
            var game = selectGameCBox.Text;
            GameReviewsEntities db = new GameReviewsEntities();

            var gameId = from d in db.Games
                         where d.Title == game
                         select d;

            var result = gameId.FirstOrDefault<Games>();

            var reviews = from d in db.Reviews
                          from u in db.Users
                          where d.ID_Game == result.ID && d.ID_User == u.ID
                          select new 
                          {
                              User = u.login,
                              Comment = d.Comment,
                              Grade = d.Rating,
                          };


            ReviewList.ItemsSource = reviews.ToList();
        }
    }
}
