using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;

public class loadTxt : MonoBehaviour
{
    //public string txtFile = "intro";
    string txtContents;
    // Start is called before the first frame update
    GUIStyle style = new GUIStyle();
    void Start()
    {
        style.normal.textColor = Color.black;
        TextAsset txtAssets = (TextAsset) Resources.Load("test");
        //Debug.Log("Text: " + txtAssets.text);
        txtContents = txtAssets.text;
        Debug.Log("width: " + Screen.width);

    }

    // Update is called once per frame
    void OnGUI()
    {
        style.fontSize = 30;
        style.wordWrap = true;
        GUILayout.BeginArea(new Rect(Screen.width/2+25, 25, Screen.width/2-10, Screen.height-25));
        GUILayout.Label(txtContents, style);
        GUILayout.EndArea();
    }
}
