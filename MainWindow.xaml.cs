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
using Microsoft.Data.SqlClient;
using System.Data;

namespace VINparser
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        static bool flag = false;
        public MainWindow()
        {
            
            InitializeComponent();
            string connectionString = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True";
            SqlConnection connection = new SqlConnection(connectionString);
            try
            {
                // Открываем подключение
                 connection.OpenAsync();
                Error_block.Text = "Подключение открыто";
            }
            catch (SqlException ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                // если подключение открыто
                if (connection.State == ConnectionState.Open)
                {
                    // закрываем подключение
                     connection.Close();
                    Error_block.Text = "Подключение закрыто...";
                }
            }
            Error_block.Text = $"Строка подключения: {connection.ConnectionString}"; ;

        }

        private void TextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
           
        }

        private void TextBox_LostFocus(object sender, RoutedEventArgs e)
        {
            if (InputLine.GetLineLength(0)==0)
            {
                InputLine.Text = "XXXXXXXXXXXXXXXXX";
                flag = false;
            }
        }

        private void TextBox_GotFocus(object sender, RoutedEventArgs e)
        {
            Error_block.Text = "";
            if (!flag) {
                InputLine.Text = "";
                flag = true;
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (InputLine.GetLineLength(0) == 17)
            {
                string WMI = InputLine.Text.Substring(0,3);
                string VDS = InputLine.Text.Substring(3, 6);
                string VIS = InputLine.Text.Substring(9, 8);

        
               
            
        }
            else
            {
                Error_block.Text = "Ой вы вели не все символы";
                Error_block.Foreground= Brushes.Red;
            }
        }

   
    }
}
