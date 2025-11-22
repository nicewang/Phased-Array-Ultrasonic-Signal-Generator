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
                    ThreadSend("a");
                    index_com = 1;
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
            ThreadSend("1");
        }

        private void button2_Click(object sender, EventArgs e)
        {
            ThreadSend("2");
        }

        private void button3_Click(object sender, EventArgs e)
        {
            ThreadSend("3");
        }

        private void button5_Click(object sender, EventArgs e)
        {
            ThreadSend("4");
        }

        private void button8_Click(object sender, EventArgs e)
        {
            ThreadSend("5");
        }

        private void button7_Click(object sender, EventArgs e)
        {
            ThreadSend("6");
        }

        private void button6_Click(object sender, EventArgs e)
        {
            ThreadSend("7");
        }

        private void button4_Click(object sender, EventArgs e)
        {
            ThreadSend("8");
        }

        private void button9_Click(object sender, EventArgs e)
        {
            ThreadSend("9");
        }

        private void button10_Click(object sender, EventArgs e)
        {
            ThreadSend("0");
        }

        private void button15_Click(object sender, EventArgs e)
        {
            ThreadSend("a");
        }

        private void button16_Click(object sender, EventArgs e)
        {
            ThreadSend("b");
        }

        private void button17_Click(object sender, EventArgs e)
        {
            ThreadSend("c");
        }

        private void button18_Click(object sender, EventArgs e)
        {
            ThreadSend("d");
        }

        private void button19_Click(object sender, EventArgs e)
        {
            ThreadSend("e");
        }

        private void button20_Click(object sender, EventArgs e)
        {
            ThreadSend("f");
        }

        private void button21_Click(object sender, EventArgs e)
        {
            ThreadSend("g");
        }

        private void button22_Click(object sender, EventArgs e)
        {
            ThreadSend("h");
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

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

    }
}
