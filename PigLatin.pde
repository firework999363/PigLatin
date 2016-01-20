import java.util.*;

boolean comma = false;
boolean period = false;
String q = new String();

public void setup() {
	String lines[] = loadStrings("words.txt");
	System.out.println("There are " + lines.length + " lines");
	for (int i = 0 ; i < lines.length; i++) 
	{
	  System.out.println(pigLatin(lines[i]));
	}

	System.out.println();
	System.out.println();

	String liness[] = loadStrings("LowellHymn.txt");
	String placeholder = new String();
	System.out.println("There are " + liness.length + " lines");
	for (int j = 0 ; j < liness.length; j++) 
	{
		int x = 0;
		placeholder = "";
	  for (int k = 0; k < liness[j].length(); k++)
	  {
	  	if (liness[j].substring(k,k+1).equals(" "))
	  	{
	  		placeholder = placeholder + pigLatin(liness[j].substring(x, k)) + " ";
	  		x = k + 1;
	  	}
	  }
	  System.out.println(placeholder);
	}
}
public void draw()
{

}
public int findFirstVowel(String sWord)
//precondition: sWord is a valid String of length greater than 0.
//postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
{
	for (int i = 0; i<sWord.length(); i++)
  	{
	    String t = sWord.substring(i,i+1);
	    if (t.equals("a") || t.equals("e") || t.equals("i") || t.equals("o") || t.equals("u") || t.equals("A") || t.equals("E") || t.equals("I") || t.equals("O") || t.equals("U"))
    	{
      		return i;
    	}
  	}
  	return -1;
}

public String pigLatin(String sWord)
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
{
	q = sWord;
	comma = false;
	period = false;
	if (sWord.charAt(sWord.length()-1) == ',')
	{
		q = sWord.substring(0, sWord.length()-2);
		comma = true;
	}
	if (sWord.charAt(sWord.length()-1) == '.')
	{
		q = sWord.substring(0, sWord.length()-2);
		period = true;
	}
	if(findFirstVowel(sWord) == -1)
	{
		if (comma)
		{
			return q + "ay" + ",";
		}
		else if (period)
		{
			return q + "ay" + ".";
		}
		else
		{
			return q + "ay";
		}
	}
	else if (findFirstVowel(sWord) == 0)
	{
		if (comma)
		{
			return q + "way" + ",";
		}
		else if (period)
		{
			return q + "way" + ".";
		}
		else 
		{
			return q + "way";
		}
	}
	else if (sWord.substring(0,2).equals("qu"))
	{
		if (comma)
		{
			return q.substring(2) + "quay" + ",";
		}
		else if (period)
		{
			return q.substring(2) + "quay" + ".";
		}
		else
		{
			return q.substring(2) + "quay";
		}
	}
	else
	{
		if (comma)
		{
			String temp2 = sWord.substring(findFirstVowel(sWord),sWord.length()-1);
			return temp2 + sWord.substring(0,findFirstVowel(sWord)) + "ay" + ",";
		}
		else if (period)
		{
			String temp2 = sWord.substring(findFirstVowel(sWord),sWord.length()-1);
			return temp2 + sWord.substring(0,findFirstVowel(sWord)) + "ay" + ".";
		}
		else 
		{
			String temp3 = sWord.substring(findFirstVowel(sWord),sWord.length());
			return temp3 + sWord.substring(0,findFirstVowel(sWord)) + "ay";
		}
	}
}
