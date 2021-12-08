using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class RuaScript : MonoBehaviour
{
    //public LadoScript pista;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
    public void EntrouNoCollider(Collider carro, LadoVia lado)
    {
        if (lado == LadoVia.direito)
        {
            Debug.Log("Direito");
        }
        else if (lado == LadoVia.esquerdo)
        {
            Debug.Log("Esquerdo");
        }
    }
    public void SaiuDoCollider(Collider carro, LadoVia lado)
    {
        if(lado == LadoVia.direito)
        {
            Debug.Log("Saiu Direito");
        }else if(lado == LadoVia.esquerdo)
        {
            Debug.Log("Saiu Esquerdo");
        }
    }
}
