//C:\Windows\Microsoft.NET\Framework64\v4.0.30319\csc.exe DontLock.cs


using System;
using System.Drawing;
using System.Runtime.InteropServices; // DLL Import
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

static class Program
{
    [STAThread]
    static void Main()
    {
        Application.EnableVisualStyles();
        Application.SetCompatibleTextRenderingDefault(false);
        new Form1();
        Application.Run();
    }
}

public class Form1 : Form
{
    NotifyIcon ico;
    public Form1()
    {
        // タスクバーに表示しない
        this.ShowInTaskbar = false;
        this.setComponents();
        Task.Run(() => mouseMove());
    }

    private void setComponents()
    {
        // アイコンの設定
        ico = new NotifyIcon();
        ico.Icon = new Icon(@"C:\ISHII_Tools\スリープ防止\DontLock\ico\lock_5.ico");
        ico.Visible = true;
        ico.Text = "スリープ防止-ISHII_Tools";

        // コンテキストメニュー
        ContextMenuStrip menu = new ContextMenuStrip();
        ToolStripMenuItem item = new ToolStripMenuItem();
        item.Text = "終了";
        item.Click += ((object sender, EventArgs e) => Application.Exit());
        menu.Items.Add(item);
        ico.ContextMenuStrip = menu;
    }

    [DllImport("user32.dll", CallingConvention = CallingConvention.StdCall)]
    private static extern void mouse_event(int swFrags, int dx, int dy, int dwDta, int dwExtraInfo);
    private void mouseMove()
    {
        const int MOUSEEVENTF_MOVE = 0x1;
        while (true)
        {
            mouse_event(MOUSEEVENTF_MOVE, 0, 0, 0, 0);
            Thread.Sleep(60000);
        }
    }
}








