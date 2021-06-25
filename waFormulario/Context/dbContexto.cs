using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;

namespace waFormulario.Context
{
    public class dbContexto : DbContext
    {
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<OneToManyCascadeDeleteConvention>();
        }

        public System.Data.Entity.DbSet<waFormulario.Models.ControlPersona> ControlPersonas { get; set; }
    }
}