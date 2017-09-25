import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import java.util.Stack;

public class SimpleCalculator extends JFrame {

  JTextField field = new JTextField();
  
  double operand1; // 被演算数
  double temp;
  String operator;   // 演算子
  String command; // added
  String arg;     // 入力された数字列
  String input = ""; //入力列

  public static void main(String[] args) {
  SimpleCalculator w = new SimpleCalculator ( "Calculator" );
    w.setDefaultCloseOperation( JFrame.EXIT_ON_CLOSE );
    w.setSize( 200, 220 );
    w.setVisible( true );
  }

  public SimpleCalculator ( String title ) {
    super( title );

    JPanel pane = (JPanel)getContentPane();

    pane.add( field, BorderLayout.NORTH );
    field.setEditable(false);
    field.setBackground( Color.white );

    // キーパネル(4×配置)を生成、表示されるようにする
    JPanel keyPanel = new JPanel( new GridLayout( 4,5 ) );
    pane.add( keyPanel, BorderLayout.CENTER ); 

    // ボタンの文字列
    String[] a = { 
    		       "7","8","9","*","sqrt",
                   "4","5","6","/","sin",
                   "1","2","3","C","cos",
                   "0","+","-","=","+/-"};

    // ボタンが選択された際に実行されるActionインスタンスの配列を初期化
    Action[] action = {
      new NumKey(a[0]),  new NumKey(a[1]),   new NumKey(a[2]),   new FuncKey(a[3]),  new FunKey(a[4]), 
      new NumKey(a[5]),  new NumKey(a[6]),   new NumKey(a[7]),   new FuncKey(a[8]),  new FunKey(a[9]), 
      new NumKey(a[10]),  new NumKey(a[11]),   new NumKey(a[12]),  new FuncKey(a[13]),  new FunKey(a[14]), 
      new NumKey(a[15]), new FuncKey(a[16]), new FuncKey(a[17]), new FuncKey(a[18]),  new FunKey(a[19]), 
    };

    // NumKeyもしくはFuncKey のインスタンスをActionとするボタンを生成し、パネルに追加
    for( int i=0; i < action.length ; i++ ){
      keyPanel.add( new JButton( action[i] ) ); 
    }

    operand1    = 0;   // 左被演算数を0に
    operator = "+"; // 演算子を+に
    command = " "; //added
    arg     = "";  // 入力数字列をクリア
  }

  class NumKey extends AbstractAction {
    NumKey( String num ){
      putValue( Action.NAME, num );
    }
    public void actionPerformed( ActionEvent e ){
      String num = (String)getValue( Action.NAME );
        arg += num;
        field.setText( arg );
    }
  }
  
  class FunKey extends AbstractAction {
	    FunKey( String label ){
	      putValue( Action.NAME, label );
	    }
	    public void actionPerformed( ActionEvent e ){
	      command = e.getActionCommand();
	      temp = Double.parseDouble( arg );
	      if(command.equals("+/-"))
	      {
	    	  temp = (-1) * temp;
	    	  System.out.println("反転した。");
	      }
	      if(command.equals("sqrt"))
	      {
	    	  temp = Math.sqrt(temp);
	    	  System.out.println("平方根を使った。");
	      }
	      if(command.equals("sin"))
	      {
	    	  temp = Math.sin(temp);
	    	  System.out.println("sinを使った。");
	      }
	      if(command.equals("cos"))
	      {
	    	  temp = Math.cos(temp);
	    	  System.out.println("cosを使った。");
	      }
	      arg = Double.toString(temp);
	      field.setText( arg );
	    }
	  }
  class FuncKey extends AbstractAction {
    FuncKey( String label ){
      putValue( Action.NAME, label );
    }
    public void actionPerformed( ActionEvent e ){
      operator = e.getActionCommand(); // 文字列の先頭の文字を取り出す
      
      if( operator.equals("C") ){
        arg = "";
        input = ""; 
        operand1 = 0;
        operator = "+";
        field.setText( Double.toString( operand1 ) );
        System.out.println("クリアが動作されました。");
        System.out.println(); //見やすくため
        return;
      }
      
      operand1 = Double.parseDouble( arg ); // 文字列arg を整数に変換する     
      System.out.println("入力された数字： " + operand1); //見やすくため     
      input += operand1; 

      if(operator.equals("+") || operator.equals("-") || operator.equals("*") || operator.equals("/"))
      {
        input += " " + operator + " ";
      }
 
      else if(operator.equals("="))
      {
        System.out.println("演算式：" + input); //見やすくため
        input = compute(input);
        field.setText(input);
        input = "";
      }

      arg = ""; // 入力数字列をクリア
    }
    
    private String compute(String input)
    {
      String str[];
      str = input.split(" ");
      Stack<Double> s = new Stack<Double>();
      double m = Double.parseDouble(str[0]);
      s.push(m);
      for(int i = 1; i < str.length; i++)
      {
        if(i % 2 == 1)
        {
          if(str[i].compareTo("+") == 0)
          {
            double temp = Double.parseDouble(str[i+1]);
            s.push(temp);
          }
          if(str[i].compareTo("-") == 0)
          {
            double temp = Double.parseDouble(str[i+1]);
            s.push(-temp);
          }
          if(str[i].compareTo("*") == 0)
          {
            double temp = Double.parseDouble(str[i+1]);
            double ans = s.peek();
            s.pop();
            ans *= temp;
            s.push(ans);
          }
          if(str[i].compareTo("/") == 0)
          {
            double temp = Double.parseDouble(str[i+1]);
            if(temp == 0)
            {
              System.out.println("エラー");
              System.exit(0);
            } //分母をぜろにする場合に、プロセスを中止する
            double ans = s.peek();
            s.pop();
            ans /= temp;
            s.push(ans);
          }
          if(str[i].compareTo("+/-") == 0)
          {
        	  double ans = s.peek();
        	  ans = (-1) * ans;
        	  s.push(ans);
          }
        }
      }
      double ans = 0;
      while(!s.isEmpty())
      {
        ans += s.peek();
        s.pop();
      }
      String result = String.valueOf(ans);
      return result;     
    }
  }

}
