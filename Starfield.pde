Particle[] stars;//your code here
void setup()
{
	size(600, 600);
	//background(0, 0, 0); //your code here
	stars = new Particle[200];
	for(int i = 0; i < stars.length; i++)
	{
		stars[i] = new NormalParticle();
	}
	stars[0] = new OddballParticle();
	stars[1] = new JumboParticle();
}

void mousePressed(){
	for(int i = 0; i < stars.length; i++)
	{
		stars[i] = new NormalParticle();
	}
	stars[0] = new OddballParticle();
	stars[1] = new JumboParticle();
}
void draw()
{
	
	background(0, 0, 0);
	for(int i = 0; i < stars.length; i++)
	{
		stars[i].move();
		stars[i].show();
	} //your code here

}
class NormalParticle implements Particle
{
	int myColor;
	double x, y, myAngle, mySpeed;
	NormalParticle()
	{
		myColor = color(255,(int)(Math.random()*255),(int)(Math.random()*255));
		mySpeed = (Math.random()*10) + 1;
		myAngle = Math.random() * 360;
		x = 300;
		y = 300;

	}
	public void move()
	{
		double cosine = (Math.cos(myAngle)) * mySpeed;
		x += cosine;

		double sine = (Math.sin(myAngle)) * mySpeed;
		y += sine;

		
		/*if((x > 600 || x < 0) || (y > 600 || y < 0))
		{
			x = 300;
			y = 300;
		}*/

		if((x > 600 || x < 0) || (y > 600 || y < 0))
		{
			mySpeed = (Math.random()* 10) -20;

		}
	}
	public void show()
	{
		fill(myColor);
		noStroke();
		ellipse((float)x,(float)y,10,10);
		//your code here
	}
}
interface Particle
{
	public void show();
	public void move();//your code here
}
class OddballParticle implements Particle//uses an interface
{
	int myX, myY, myColor, myOpacity;
 	float mySize; 
 	double xDirection, yDirection, xBiased, yBiased;
	OddballParticle()
	{
		myX = 200;
	 	myY = 200;
	 	myColor = color(250,(int)(Math.random()*250),(int)(Math.random()*250));
	 	mySize = 10.0;

	 	//move variables
	 	xBiased = 0.5;
	 	yBiased = 0.5;
	 }
		
		public void move()
		{
			xDirection = (Math.random());
	 		yDirection = (Math.random());

 		
 		//horizontal
	 		if(xDirection >= xBiased)
	 		{
	 			myX = myX + 5; //to the right
	 		}
	 		else if(xDirection <= xBiased)
	 		{
	 			myX = myX - 5; //to the left
	 		}
	 		
	 		//vertical
	 		if(yDirection >= yBiased)
	 		{
	 			myY = myY + 5; //down
	 		}
	 		else if(yDirection <= yBiased)
	 		{
	 			myY = myY - 5;		//up	
	 		}

	 		//mouseReact hor
	 		if(mouseX >= myX)
	 		{
	 			xBiased = 0.70; //biased left

	 		}
	 		else if(mouseX <= myX) //biased right
	 		{
	 			xBiased = 0.30;
	 		}

	 		//mouseReact vert
	 		if(mouseY >= myY) //biased up
	 		{
	 			yBiased = 0.70;
	 		}
	 		else if(mouseY <= myY) //biased down
	 		{
	 			yBiased = 0.30;
	 		}

	 		//bounce off wall hor
	 		if(myX > 400)
	 		{
	 			xBiased = 1.0;
	 		}
	 		else if(myX < 200)
	 		{
	 			xBiased = 0.0;
	 		}
	 		//bounce off wall ver
	 		if(myY > 400)
	 		{
	 			yBiased = 1.0;
	 		}
	 		else if(myY < 200)
	 		{
	 			yBiased = 0.0;
	 		}
	 	}
	 	public void show()
	 	{
	 		noStroke();
 			fill(myColor);
 			ellipse(myX, myY, mySize, mySize);

	 	}




 }



		//your code here

class JumboParticle extends NormalParticle//uses inheritance
{
	JumboParticle()
	{
		myColor = color(255,(int)(Math.random()*255),255);
		mySpeed = (Math.random()*3) + 1;
		myAngle = Math.random() * 360;
		x = 300;
		y = 300;
	}
	public void show()
	{
		fill(myColor);
		ellipse((float)x,(float)y,60,60);
	}


}



