using System;
using System.Threading;

Console.WriteLine("🚀 CoreOrchestrator está despertando...");
while (true)
{
    Console.WriteLine($"[ {DateTime.Now} ] El servidor en la Raspberry está vivo y operando.");
    Thread.Sleep(5000); // Espera 5 segundos
}
