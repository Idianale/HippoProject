using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Spin : MonoBehaviour
{
    int spinX, spinZ = 0;
    int spinY = 1;

    // Use this for initialization
    void Start()
    {
        Debug.Log("Start spining");
    }

    // Update is called once per frame
    void Update()
    {
        transform.Rotate(spinX, spinY, spinZ);
    }
}
