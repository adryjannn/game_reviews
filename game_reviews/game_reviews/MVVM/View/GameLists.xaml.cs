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
        /// <summary>
        /// Create view with game list
        /// </summary>
        public GameLists()
        {
            InitializeComponent();
            GameReviewsEntities db = new GameReviewsEntities();

            var games = from d in db.Games
                        from p in db.Producers
                        from c in db.Categories
                        where d.ID_producer == p.ID && d.ID_category == c.ID
                        select new
                        {
                            Id = d.ID,
                            Title = d.Title,
                            Producer = p.Name,
                            Categorie = c.Categories1,
                                
                        };

            gameList.ItemsSource = games.ToList();
        }
    }
}
