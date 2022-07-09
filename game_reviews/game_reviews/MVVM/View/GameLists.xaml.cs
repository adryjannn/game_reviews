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
    /// Logika interakcji dla klasy GameLists.xaml
    /// </summary>
    public partial class GameLists : UserControl
    {
        public GameLists()
        {
            InitializeComponent();
            GameReviewsEntities db = new GameReviewsEntities();
            var games = from d in db.Games
                        select d;

            gameList.ItemsSource = games.ToList();
        }
    }
}
