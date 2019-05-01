using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine.EventSystems;
using UnityEngine;
using UnityEngine.UI;

public class touchCon : MonoBehaviour
{
    public AudioClip[] aClips;
    public AudioSource myAudioSource;
    string btnName;
    public Material[] materials;
    [SerializeField] private Image journalImg;
    [SerializeField] private Button cancelBut;
    public string[] otherFiles = {"intro", "secondary_scans", "missing_hippo_profiles", "possible_deaths" };
    public string[] txtFiles = { "whole_bottom_jaw_mandible", "condyle", "coronoid_process", "molars", "pre_molars", "foramina", "canines", "incisor" };
    string[] txtContents = new string[8];
    string introText;
    // Start is called before the first frame update
    GUIStyle style = new GUIStyle();
    // Start is called before the first frame update
    bool[] diamondTouched = new bool[8];
    bool showIntro = true; 
    void Start()
    { 
        Debug.Log("Start"); 
        myAudioSource = GetComponent<AudioSource>();
        journalImg.enabled = true;
        cancelBut.enabled = true;
        cancelBut.gameObject.SetActive(true);
        cancelBut.onClick.AddListener(TaskOnClick);

        style.normal.textColor = Color.black;
        TextAsset txtAssets = (TextAsset)Resources.Load("intro");
        introText = txtAssets.text;
        for (int i=0; i<txtFiles.Length; i++)
        {
            txtAssets = (TextAsset)Resources.Load(txtFiles[i]);
            Debug.Log("Text: " + txtAssets.text);
            txtContents[i] = txtAssets.text;
            diamondTouched[i] = false; 
        }
        
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
                    case "mandible":
                        //myAudioSource.clip = aClips[0];
                        //myAudioSource.Play();
                        Hit.transform.GetComponent<Renderer>().material.color = Color.red;
                        journalImg.enabled = true;
                        cancelBut.enabled = true;
                        cancelBut.gameObject.SetActive(true);
                        diamondTouched[0] = true;
                        Debug.Log("Touched mandible");
                        break;
                    case "condyle":
                        Hit.transform.GetComponent<Renderer>().material.color = Color.red;
                        journalImg.enabled = true;
                        cancelBut.enabled = true;
                        cancelBut.gameObject.SetActive(true);
                        diamondTouched[1] = true;
                        Debug.Log("Touched condyle ");
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
        for (int i=0; i<txtFiles.Length; i++)
        {
            if (diamondTouched[i])
            {
                style.wordWrap = true;
                style.fontStyle = FontStyle.Bold;

                string[] lines = txtContents[i].Split(new[] { '\n' });
                string title = lines[0];
                style.fontSize = 30;
                int index = txtContents[i].IndexOf(System.Environment.NewLine);
                string textBody = txtContents[i].Substring(index + System.Environment.NewLine.Length);
                Debug.Log("body: " + textBody);

                GUILayout.BeginArea(new Rect(Screen.width / 2 + 25, 100, Screen.width / 2 - 125, Screen.height - 75));
                GUILayout.Label(title, style);
                //add empty line between title and body
                GUILayout.Label(lines[1], style);

               for (int j=2; j<lines.Length; j++)
                {
                    if (j==2)
                    {
                        style.fontStyle = FontStyle.Italic;
                    }
                    else if (lines[j-1].Trim().Length == 0)
                    {
                        style.fontStyle = FontStyle.Italic;
                    }
                    else
                    {
                        style.fontStyle = FontStyle.Normal;
                    }
                    GUILayout.Label(lines[j], style);
                }

               // style.fontStyle = FontStyle.Normal;
                //GUILayout.Label(textBody, style);
                GUILayout.EndArea();
            }
            if (showIntro)
            {
                style.wordWrap = true;
                style.fontStyle = FontStyle.Bold;

                string[] lines =introText.Split(new[] { '\n' });
                string title = lines[0];
                style.fontSize = 30;
                int index = introText.IndexOf(System.Environment.NewLine);
                string textBody = introText.Substring(index + System.Environment.NewLine.Length);
                Debug.Log("body: " + textBody);

                GUILayout.BeginArea(new Rect(Screen.width / 2 + 25, 100, Screen.width / 2 - 125, Screen.height - 75));
                GUILayout.Label(title, style);
                style.fontStyle = FontStyle.Normal;
                GUILayout.Label(textBody, style);
                GUILayout.EndArea();
            } 
        }
       
    }

    void TaskOnClick()
    {
        cancelBut.gameObject.SetActive(false);
        cancelBut.enabled = false;
        journalImg.enabled = false;
        for (int i=0; i<txtFiles.Length; i++)
        {
            diamondTouched[i] = false;
        }
        showIntro = false;
        
    }

}
