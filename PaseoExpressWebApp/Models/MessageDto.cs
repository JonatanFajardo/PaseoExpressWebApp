namespace PaseoExpressWebApp.Models
{
    public class MessageDto
    {
        public string Description { get; set; }
        public bool IsRead { get; set; }
        public int SenderId { get; set; }
        public int ReceiverId { get; set; }
        public int GroupId { get; set; }
        public DateTime Time { get; set; } = DateTime.Now;
    }

}
