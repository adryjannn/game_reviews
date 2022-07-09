using game_reviews.core;
using System;


namespace game_reviews.MVVM.ViewModel
{
    class MainViewModel: ObservableObject
    {
        public RelayCommand HomeViewCommand { get; set; }
        public RelayCommand GameListsCommand { get; set; }

        public RelayCommand ReviewViewCommand { get; set; }


        public HomeViewModel HomeVM { get; set; }
        public GameListsModel GameLM { get; set; }
        public ReviewViewModel ReviewVM { get; set; }

        private object _currentView;

        public object CurrentView
        {
            get { return _currentView; }
            set {
                _currentView = value;
                OnPropertyChanged();
            
            }
        }

        public MainViewModel()
        {
            HomeVM = new HomeViewModel();
            GameLM = new GameListsModel();
            ReviewVM = new ReviewViewModel();
            CurrentView = HomeVM;

            HomeViewCommand = new RelayCommand(o =>
            {
                CurrentView = HomeVM;
            });

            GameListsCommand = new RelayCommand(o =>
            {
                CurrentView = GameLM;
            });

            ReviewViewCommand = new RelayCommand(o =>
            {
                CurrentView = ReviewVM;
            });
        }
    }
}
