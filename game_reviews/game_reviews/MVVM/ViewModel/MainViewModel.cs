using game_reviews.core;
using System;


namespace game_reviews.MVVM.ViewModel
{
    class MainViewModel: ObservableObject
    {
        public RelayCommand HomeViewCommand { get; set; }
        public RelayCommand GameListsCommand { get; set; }

        public RelayCommand ReviewViewCommand { get; set; }
        public RelayCommand AddReviewViewCommand { get; set; }
        public RelayCommand ShowReviewViewCommand { get; set; }
     



        public HomeViewModel HomeVM { get; set; }
        public GameListsModel GameLM { get; set; }
        public ReviewViewModel ReviewVM { get; set; }
        public AddReviewModel AddReviewVM { get; set; }
        public ShowReviewModel ShowReviewVM { get; set; }
       

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
            AddReviewVM = new AddReviewModel();
            ShowReviewVM = new ShowReviewModel();
          
            

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

            AddReviewViewCommand = new RelayCommand(o =>
            {
                CurrentView = AddReviewVM;
            });

            ShowReviewViewCommand = new RelayCommand(o =>
            {
                CurrentView = ShowReviewVM;
            });

        


        }
    }
}
