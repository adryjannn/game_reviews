   M S B A M L   `   `   `  ���� G  Cgame_reviews, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:game_reviews.MVVM.ViewModelgame_reviews.MVVM.ViewModel  +clr-namespace:game_reviewsgame_reviews      game_reviews.MenuWindow   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     ?	ViewModel)clr-namespace:game_reviews.MVVM.ViewModel     ,localclr-namespace:game_reviews     $	��600��$	��920��  � WindowStyle$
  None=� � 
ResizeMode$ NoResize=� � AllowsTransparency . 
������  � DataContext /  )game_reviews.MVVM.ViewModel.MainViewModel  .���� ���#272533 �� CornerRadius$ 15��._��  � ColumnDefinitions �� $	��200 ���  � RowDefinitions �� $��75 ��� .+��� -   $��logout��$��1��$��631,11,5,11q� J� RenderTransformOrigin$ 0.5,0.5&����#272533
������$,��&/game_reviews;component/Fonts/#Poppins)�
������z�V� .~��� ��  �� AngleY$ 0Q��� 	 �� Angle$	 -0.408Q�T� 
 T� Y$
 0Q��� $��GamesReviews��$��Center=�$��Center=�$��25(�
������$��/Fonts/#Poppins)��� $��1��.+�	� $
��Home��$��55��
������$��16(�   MenuButtonTheme#��[   d� 	IsChecked$
 TrueY����� *HomeViewCommand+	� $��	Game List��$��55��
������$��16(�#��[  ���� *GameListsCommand+	� $��Reviews��$��55��
������$��16(�#��[  ���� *ReviewViewCommand+	� $��
Add review��$��55��
������$��16(�#��[  ���� *AddReviewViewCommand+	� $��Show your review��$��55��
������$��16(�#��[  ���� *ShowReviewViewCommand+�� -   $��
UserIdText��$��1��$��Center=�$��Center=�$��1(�$��Black"����#272533$��/Fonts/#Poppins)��� $��1��$��1��$��10q����� *CurrentView+