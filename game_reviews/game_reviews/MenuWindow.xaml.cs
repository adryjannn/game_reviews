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
    /// Logika interakcji dla klasy MenuWindow.xaml
    /// </summary>
    public partial class MenuWindow : Window
    {
        public MenuWindow()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
           
        }

        private void ButtonClickGameList(object sender, RoutedEventArgs e)
        {
            MainMenuWindow.Content = new GameList();
        }

        private void ButtonClickAddGame(object sender, RoutedEventArgs e)
        {
            MainMenuWindow.Content = new AddGame();
        }

        private void MainMenuWindow_Navigated(object sender, System.Windows.Navigation.NavigationEventArgs e)
        {

        }

    }
}
