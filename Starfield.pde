Particle[] matt = new Particle[200];
void setup()
{
	size(800,800);
	for(int i = 0; i<200; i++)
	{
		if(i<1)
		{
			matt[i]= new OddballParticle();
		}
		else if(i==2)
		{
			matt[i] = new JumboParticle();
		}
		else
		{
			matt[i] = new NormalParticle();
		}	
	}
}
void draw()
{
	background(0);
	for(int i = 0; i<200; i++)
	{
	matt[i].show();
	matt[i].move();
}
}
class NormalParticle implements Particle
{
	int partcolor;
	double x, y, dSpeed, dAngle;
	NormalParticle()
	{
		x = 400;
		y = 400;
		dSpeed = Math.random()*10;
		dAngle = Math.PI*Math.random()*5;
		partcolor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
	}
	public void move()
	{
		x = x + Math.cos(dAngle)*dSpeed;
		y = y + Math.sin(dAngle)*dSpeed;
		if(x>=800 || y>=800 || y <= 0 || x <= 0)
		{
			x = 400;
			y = 400;
		}
	}
	public void show()
	{
		fill(partcolor);
		ellipse((float)x,(float)y,10,10);
	}
}
interface Particle
{
	public void move();
	public void show();
}
class OddballParticle implements Particle
{
	double x,y,dAngle,dSpeed;
	int partcolor;
	OddballParticle()
	{
		x = 400;
		y = 400;
		dAngle = Math.PI*Math.random()*5;
		dSpeed = Math.random()*10;
		partcolor = color(255);
	}
	public void move()
	{
		if(x>=800 || y>=800 || y<=0 || x<=0)
		{
			dAngle = Math.PI * Math.random();
			x = 400;
			y = 400;

		}
		x = x + Math.cos(dAngle)*dSpeed;
		y = y + Math.sin(dAngle)*dSpeed;
	}
	public void show()
	{
		fill(partcolor);
		ellipse((float)x, (float)y, 20, 20);
	}
}
class JumboParticle extends NormalParticle
{
	JumboParticle()
	{
		x=400;
		y=400;
		dSpeed = Math.random()*10;
		dAngle = Math.PI*Math.random()*5;
		partcolor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
	}
	public void show()
	{
		fill(partcolor);
		ellipse((float)x, (float)y, 40, 40);
	}
}
