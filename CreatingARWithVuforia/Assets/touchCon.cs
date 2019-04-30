using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine.EventSystems;
using UnityEngine;
using UnityEngine.UI;

public class touchCon : MonoBehaviour, IPointerClickHandler
{
    public AudioClip[] aClips;
    public AudioSource myAudioSource;
    string btnName;
    public Material[] materials;
    [SerializeField] private Image journalImg;
    [SerializeField] private Button cancelBut;
    //public string txtFile = "intro";
    string txtContents;
    // Start is called before the first frame update
    GUIStyle style = new GUIStyle();
    // Start is called before the first frame update
    bool diamondTouched = false;
    void Start()
    {
        Debug.Log("Start");
        myAudioSource = GetComponent<AudioSource>();
        journalImg.enabled = false;
        cancelBut.enabled = false;
        cancelBut.gameObject.SetActive(false);
        cancelBut.onClick.AddListener(TaskOnClick);

        style.normal.textColor = Color.black;
        TextAsset txtAssets = (TextAsset)Resources.Load("test");
        Debug.Log("Text: " + txtAssets.text);
        txtContents = txtAssets.text;
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
                        //myAudioSource.clip = aClips[0];
                        //myAudioSource.Play();
                        Hit.transform.GetComponent<Renderer>().material.color = Color.red;
                        journalImg.enabled = true;
                        cancelBut.enabled = true;
                        cancelBut.gameObject.SetActive(true);
                        diamondTouched = true;
                        Debug.Log("Touched diamond");
                        break;
                    default:
                        break;
                }
            }
        }
    }

    // Update is called once per frame
    void OnGUI()
    {
        if (diamondTouched)
        {
            style.fontSize = 30;
            style.wordWrap = true;
            GUILayout.BeginArea(new Rect(Screen.width / 2 + 25, 100, Screen.width / 2 - 125, Screen.height - 75));
            GUILayout.Label(txtContents, style);
            GUILayout.EndArea();
        }
    }

    public void OnPointerClick(PointerEventData eventData)
    {
        journalImg.enabled = false;   
        
    }

    void TaskOnClick()
    {
        cancelBut.gameObject.SetActive(false);
        cancelBut.enabled = false;
        journalImg.enabled = false;
        diamondTouched = false;
    }

}
