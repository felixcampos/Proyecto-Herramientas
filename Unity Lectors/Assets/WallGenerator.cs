using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.IO;

public class WallGenerator : MonoBehaviour
{
	List<Vector4> walls = new List<Vector4>();
	List<float> numbers;
	public GameObject Cols;

	void Start()
	{
		GameObject Pistta = Instantiate(Resources.Load<GameObject>("Pista"));
		ProcessFile();

		foreach (Vector4 wall in walls)

		{
			if (wall.z==0){
			GameObject wallObject = Instantiate(Resources.Load<GameObject>("dt0"));
			wallObject.transform.position = new Vector2(wall.x, wall.y);
			wallObject.transform.localScale = new Vector3(320, 320, 1);
			//wallObject.transform.SetParent(Cols.transform);
			}
			if (wall.z==4){
			GameObject wallObject = Instantiate(Resources.Load<GameObject>("dt4"));
					
			wallObject.transform.position = new Vector2(wall.x, wall.y);
			wallObject.transform.localScale = new Vector3(320, 320, 1);
			//wallObject.transform.SetParent(Cols.transform);
			}
	        if (wall.z==1){
			GameObject wallObject = Instantiate(Resources.Load<GameObject>("dt1"));
			wallObject.transform.position = new Vector2(wall.x, wall.y);
			wallObject.transform.localScale = new Vector3(320, 320, 1);
			//wallObject.transform.SetParent(Cols.transform);
			}
			if (wall.z==3){
			GameObject wallObject = Instantiate(Resources.Load<GameObject>("dt3"));
			wallObject.transform.position = new Vector2(wall.x, wall.y);
			wallObject.transform.localScale = new Vector3(320, 320, 1);
			//wallObject.transform.SetParent(Cols.transform);
			}
			if (wall.z==2){
			GameObject wallObject = Instantiate(Resources.Load<GameObject>("dt2"));
			wallObject.transform.position = new Vector2(wall.x, wall.y);
			wallObject.transform.localScale = new Vector3(320, 320, 1);
			//wallObject.transform.SetParent(Cols.transform);
			}
			
		}
	}

    void ProcessFile()
    {
        StreamReader reader = new StreamReader("Assets/Data.txt");
			numbers= new List <float>();
			while(!reader.EndOfStream)
			{
				string[] line = reader.ReadLine().Split(' ');
				numbers.Add(float.Parse(line[0]));
				if(numbers.Count==3)
				{
walls.Add(new Vector4(numbers[0],numbers[1],numbers[2]));

numbers.Clear();
				}
			}
			
			
	
        

      
		
    }
}