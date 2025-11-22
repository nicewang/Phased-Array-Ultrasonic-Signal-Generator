using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Threading;
using System.IO.Ports;
namespace xkz
{
    public partial class Form1 : Form
    {
        Thread th = null;
        //int index = 0;
        SerialPort port = new SerialPort();
        int k = 0;
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
           // th = new Thread(ThreadSend);
           // th.Start(index);
        }
        private void ThreadSend(string message)
        {
            try
            {

                byte[] buf = Encoding.Default.GetBytes(message);
                    if (port.IsOpen)
                    {
                       
                      // port.WriteLine(message);
                        port.Write(buf, 0, buf.Length);
                    }

            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message);
                // Console.ReadLine();
            }
        }
        int index_com = 0;
        private void button11_Click(object sender, EventArgs e)
        {
            if (index_com == 0)
            {
                port.BaudRate = Convert.ToInt32(cB_baud.Text);
                port.PortName = cB_COM.Text;
                int end = 1;

                port.DataBits = 8;

                int stopBits = 0;

                stopBits = end;
                switch (stopBits)
                {
                    case 0:
                        port.StopBits = StopBits.None;
                        break;
                    case 1:
                        port.StopBits = StopBits.One;
                        break;
                    case 2:
                        port.StopBits = StopBits.Two;
                        break;
                    default:
                        port.StopBits = StopBits.None;
                        break;
                }
                try
                {
                    if (port.IsOpen)
                    {
                        port.Close();
                    }
                    //port.Close();
                    port.Open();

                }
                catch (Exception ex)
                {
                    
                }
                if (cB_baud.Text != "" && cB_COM.Text != "")
                {
                    textBox1.Text = "0";
                    textBox2.Text = "0";
                    ThreadSend("a");
                    index_com = 1;
                    k = 1;
                    th = new Thread(new ThreadStart(ThreadMethod_Recv));
                    th.Start();
                }
                else
                {
                    MessageBox.Show("请选择波特率和串口号！");
                }
            }
            else
            {
                MessageBox.Show("串口已打开！");
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (k == 1)
            {
                textBox1.Text = "1";
            }
            else if (k == 2)
            {
                textBox2.Text = "1";
            }
            ThreadSend("1");
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (k == 1)
            {
                textBox1.Text = "2";
            }
            else if (k == 2)
            {
                textBox2.Text = "2";
            }
            ThreadSend("2");
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if (k == 1)
            {
                textBox1.Text = "3";
            }
            else if (k == 2)
            {
                textBox2.Text = "3";
            }
            ThreadSend("3");
        }

        private void button5_Click(object sender, EventArgs e)
        {
            if (k == 1)
            {
                textBox1.Text = "4";
            }
            else if (k == 2)
            {
                textBox2.Text = "4";
            }
            ThreadSend("4");
        }

        private void button8_Click(object sender, EventArgs e)
        {
            if (k == 1)
            {
                textBox1.Text = "5";
            }
            else if (k == 2)
            {
                textBox2.Text = "5";
            }
            ThreadSend("5");
        }

        private void button7_Click(object sender, EventArgs e)
        {
            if (k == 1)
            {
                textBox1.Text = "6";
            }
            else if (k == 2)
            {
                textBox2.Text = "6";
            }
            ThreadSend("6");
        }

        private void button6_Click(object sender, EventArgs e)
        {
            if (k == 1)
            {
                textBox1.Text = "7";
            }
            else if (k == 2)
            {
                textBox2.Text = "7";
            }
            ThreadSend("7");
        }

        private void button4_Click(object sender, EventArgs e)
        {
            if (k == 1)
            {
                textBox1.Text = "8";
            }
            else if (k == 2)
            {
                textBox2.Text = "8";
            }
            ThreadSend("8");
        }

        private void button9_Click(object sender, EventArgs e)
        {
            if (k == 1)
            {
                textBox1.Text = "9";
            }
            else if (k == 2)
            {
                textBox2.Text = "9";
            }
            ThreadSend("9");
        }

        private void button10_Click(object sender, EventArgs e)
        {
            if (k == 1)
            {
                textBox1.Text = "0";
            }
            else if (k == 2)
            {
                textBox2.Text = "0";
            }
            ThreadSend("0");
        }

        private void button12_Click(object sender, EventArgs e)
        {
            textBox1.Text = "0";
            textBox2.Text = "0";
            k = 1;
            ThreadSend("a");

        }

        private void button13_Click(object sender, EventArgs e)
        {
            textBox1.Text = "0";
            textBox2.Text = "0";
            k = 2;
            ThreadSend("b");
        }

        private void ThreadMethod_Recv()
        {
            try
            {
                string aData = "";
                bool exitFlag = false;
                while (exitFlag == false)
                {
                   
                    //判断线程安全退出 
                   // if (mEventStopAll.WaitOne(10, false) == true) break;

                    if (port.IsOpen)
                    {

                        aData = port.ReadExisting();    
                        if (aData != "" && aData=="d")
                        {
                            if (k == 1)
                            {
                                k = 2;
                            }
                            else if (k == 2)
                            {
                                k = 1;
                            }
                        }   

                    }
                    //Thread.Sleep(1000);
                    //Refresh();
                }

            }
            catch (Exception e)
            {
;
            }

            // return aResp;

        }

        private void button14_Click(object sender, EventArgs e)
        {
            if (port.IsOpen)
            {
                ThreadSend("c");
                port.Close();
                MessageBox.Show("关闭串口成功！");
                index_com = 0;
                th.Abort();
            }
            else 
            {
                MessageBox.Show("串口已关闭！");
            }
        }
    }
}
