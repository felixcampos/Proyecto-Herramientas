using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Character : MonoBehaviour
{
	bool isLeft = false;
	bool isRight = false;
	bool isUp = false;
	bool isDown = false;
	public float SPEED = 0.1f;
	float speedX = 0;
	float speedY = 0;
	
	void Update ()
	{
        isLeft = Input.GetKey(KeyCode.LeftArrow);
        isRight = Input.GetKey(KeyCode.RightArrow);
		isUp = Input.GetKey(KeyCode.UpArrow);
		isDown = Input.GetKey(KeyCode.DownArrow);

		if (isRight) speedX = SPEED;
		if (isLeft) speedX = -SPEED;
		if (isDown) speedY = -SPEED;
		if (isUp) speedY = SPEED;

		if (!isRight && !isLeft) speedX = 0;
		if (!isUp && !isDown) speedY = 0;

		transform.position += new Vector3(speedX, speedY, 0);
	}
}
