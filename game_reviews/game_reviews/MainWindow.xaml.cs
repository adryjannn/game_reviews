﻿using System;
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

namespace game_reviews
{
    /// <summary>
    /// Logika interakcji dla klasy MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
       
        public MainWindow()
        {
            InitializeComponent();
        }

        private void btnSubmitLogin_Click(object sender, RoutedEventArgs e)
        {
            Console.WriteLine(password.Password.ToString());
            Console.WriteLine(username.Text);
            GameReviewsEntities db = new GameReviewsEntities();
            

            var users = from d in db.Users
                        where d.login == username.Text && d.password == password.Password
                        select d;

            var result = users.FirstOrDefault<Users>();

            

            if (result != null)
            {
                MenuWindow menu = new MenuWindow(result.ID);
                menu.Show();
                this.Close();
            }
            else
            {
                MessageBox.Show("Login albo hasło niepoprawne");
            }
            

        }
    }
}
