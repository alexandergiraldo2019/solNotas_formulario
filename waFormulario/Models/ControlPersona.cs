using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace waFormulario.Models
{
    [Table("COTIZACION")]
    public class ControlPersona
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int IdRegistro { get; set; }

        [Display(Name = "Nombre:")]
        [Required(ErrorMessage = "Debe ingresar el nombre de la persona")]
        [StringLength(100, ErrorMessage = "Longitud entre {2} y {1} caracteres", MinimumLength = 5)]
        public string  Nombre { get; set; }

        [Display(Name = "Fecha de nacimiento:")]
        [DisplayFormat(DataFormatString = "{0:yyyy/MM/dd}", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        [Required(ErrorMessage = "Se requiere la fecha de nacimiento")]
        public DateTime FechaNacimiento { get; set; }

        [Display(Name = "Ubicacion:")]
        [Required(ErrorMessage = "Debe ingresar pais de ubicacion de la persona")]
        [StringLength(50, ErrorMessage = "Longitud entre {2} y {1} caracteres", MinimumLength = 5)]
        public string IdUbicacion { get; set; }

        [Display(Name = "Tipo de Enfermedad:")]
        [Required(ErrorMessage = "Debe ingresar tipo de enfermedad")]
        [StringLength(50, ErrorMessage = "Longitud entre {2} y {1} caracteres", MinimumLength = 5)]
        public string IdTipoEnfermedad { get; set; }


    }
}