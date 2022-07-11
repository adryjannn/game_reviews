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
    /// Logika interakcji dla klasy RegisterWindow.xaml
    /// </summary>
    public partial class RegisterWindow : Window
    {
        public RegisterWindow()
        {
            InitializeComponent();
        }

        private void btnSubmitRegister_Click(object sender, RoutedEventArgs e)
        {
            
            GameReviewsEntities db = new GameReviewsEntities();

            var users = from d in db.Users
                        where d.login == username.Text
                        select d;

            var result = users.FirstOrDefault<Users>();

            if (result == null)
            {
                if (username.Text.Length >= 5 && password.Password.Length >= 5)
                {
                    var user = new Users();
                    user.login = username.Text;
                    user.password = password.Password;
                    db.Users.Add(user);
                    db.SaveChanges();
                    MessageBox.Show("Successfully registered");
                    MainWindow main = new MainWindow();
                    main.Show();
                    this.Close();
                } else
                {
                    MessageBox.Show("The length of the login and password : minimum 5 characters");
                    password.Password = "";
                    return;
                }
            } else
            {
                MessageBox.Show("This login used, choose a different one");
                username.Text = "";
                password.Password = "";
                return;
            }
        }
    }
}
