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
using game_reviews.MVVM.ViewModel;
namespace game_reviews
{
    /// <summary>
    /// Logika interakcji dla klasy MenuWindow.xaml
    /// </summary>
    public partial class MenuWindow : Window
    {
        public int UserID;
        public MenuWindow(int userID)
        {
            InitializeComponent();
            this.UserID = userID;
            UserIdText.Text = userID.ToString();
        }

       
        private void Button_Click(object sender, RoutedEventArgs e)
        {
           
        }


        private void MainMenuWindow_Navigated(object sender, System.Windows.Navigation.NavigationEventArgs e)
        {
          
        }

        private void ButtonLogout_Click(object sender, RoutedEventArgs e)
        {
            MainWindow main = new MainWindow();
            main.Show();
            this.Close();
        }
    }
}
