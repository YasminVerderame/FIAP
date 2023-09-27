using System.Text;
using RabbitMQ.Client;
using RabbitMQ.Client.Events;


namespace Fiap.Cartao
{
    internal class Program
    {
        static void Main(string[] args)
        {
            var factory = new ConnectionFactory { HostName = "localhost" };
            using var connection = factory.CreateConnection();
            using var channel = connection.CreateModel();

            channel.QueueDeclare(queue: "hello",
                                 durable: false,
                                 exclusive: false,
                                 autoDelete: false,
                                 arguments: null
                                 );

            Console.WriteLine(" [*] Aguardando novas mensagens.");

            var consumer = new EventingBasicConsumer(channel);
            consumer.Received += (model, ea) =>
            {
                var body = ea.Body.ToArray();
                var message = Encoding.UTF8.GetString(body);
                Console.WriteLine($" [x] recebido {message}");

                channel.BasicAck(ea.DeliveryTag, false);                

            };
            channel.BasicConsume(queue: "hello",
                                 autoAck: false,
                                 consumer: consumer);

            Console.WriteLine(" Pressione [enter] para finalizar.");
            Console.ReadLine();
        }
    }
}