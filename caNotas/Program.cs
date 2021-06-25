using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace caNotas
{
    class Program
    {
        static void Main(string[] args)
        {
            // Inicializa las variables
            int suma = 0;
            decimal promedio = 0;
            int[] notas = new int[10];
            string[] materias = new string[10] { "Matematicas", "Ciencias", "Historia", "Educacion Fisica", "Idiomas", "Sociales","Geografia","Religion","Artes","Manualidades" };

            // Ciclo para obtener las notas de las materias
            for (int i = 0; i < 10; i++)
            {
                Console.WriteLine("Registro {0}. Ingrese la nota para la materia {1} : ", i+1, materias[i]);
                notas[i] = int.Parse(Console.ReadLine());
                suma += notas[i];
            }

            // Calculo del promedio
            promedio = (suma / 10);

            // Resultado
            Console.Clear();
            Console.WriteLine("*********************************************************");
            Console.WriteLine("*        Informacion registrada para el Alumno          *");
            Console.WriteLine("*********************************************************");

            for (int i = 0; i < 10; i++)
            {
                Console.WriteLine("Materia : {0} {1} nota {2} ", materias[i], new string('.', 20-materias[i].Length ) ,notas[i]);
            }
            Console.WriteLine();            
            Console.WriteLine("Promedio: {0}", promedio);
            Console.ReadKey();
        }
    }
}
