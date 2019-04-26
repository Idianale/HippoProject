using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class soundCon : MonoBehaviour
{
    public AudioClip[] aClips;
    public AudioSource myAudioSource;
    string btnName;
    public Material[] materials;
    // Start is called before the first frame update
    void Start()
    {
        Debug.Log("Start");
        myAudioSource = GetComponent<AudioSource>();
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.touchCount > 0 && Input.touches[0].phase == TouchPhase.Began)
        {
            Debug.Log("Touched screen!");
            Ray ray = Camera.main.ScreenPointToRay(Input.GetTouch(0).position);
            RaycastHit Hit;
            if (Physics.Raycast(ray, out Hit)){
                btnName = Hit.transform.name;
                switch (btnName)
                {
                    case "gem_17":
                        myAudioSource.clip = aClips[0];
                        myAudioSource.Play();
                        Hit.transform.GetComponent<Renderer>().material.color = Color.red;
                        Debug.Log("Touched gem");
                        break;
                    case "Sphere":
                        myAudioSource.clip = aClips[0];
                        myAudioSource.Play();
                        Hit.transform.GetComponent<Renderer>().material.color = Color.red;
                        Debug.Log("Touched sphere");
                        break;
                    default:
                        break;
                }
            }
        }
    }
}
