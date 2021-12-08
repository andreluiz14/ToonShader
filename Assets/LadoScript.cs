using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public enum LadoVia
{
    esquerdo,
    direito
}
public class LadoScript : MonoBehaviour
{
    public RuaScript Pai;
    public LadoVia lado = new LadoVia();
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
    public void OnTriggerEnter(Collider carro)
    {
        Pai.EntrouNoCollider(carro, lado);
    }
    public void OnTriggerExit(Collider carro)
    {
        Pai.SaiuDoCollider(carro, lado);
    }
}
