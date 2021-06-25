using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using waFormulario.Context;
using waFormulario.Models;

namespace waFormulario.Controllers
{
    public class ControlPersonasController : Controller
    {
        private dbContexto db = new dbContexto();

        // GET: ControlPersonas
        public async Task<ActionResult> Index()
        {
            return View(await db.ControlPersonas.ToListAsync());
        }

        // GET: ControlPersonas/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ControlPersona controlPersona = await db.ControlPersonas.FindAsync(id);
            if (controlPersona == null)
            {
                return HttpNotFound();
            }
            return View(controlPersona);
        }

        // GET: ControlPersonas/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: ControlPersonas/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "IdRegistro,Nombre,FechaNacimiento,IdUbicacion,IdTipoEnfermedad")] ControlPersona controlPersona)
        {
            bool valido = true;
            string mensajeValidacion = string.Empty;

            if (ModelState.IsValid)
            {
                List<string> lstPaises = new List<string>() { "Panama","Costa Rica","Brazil","Usa" } ;

                if (DateTime.UtcNow.Year - controlPersona.FechaNacimiento.Year < 18)
                {
                    mensajeValidacion = "La edad de la persona debe ser superior a 18 años";
                    valido = false;
                }

                if (lstPaises.Contains(controlPersona.IdUbicacion, StringComparer.OrdinalIgnoreCase))
                {
                    mensajeValidacion = mensajeValidacion + " - " + "La persona no puede registrarse en la ubicacion " + controlPersona.IdUbicacion;
                    valido = false;
                }

                if (controlPersona.IdTipoEnfermedad.IndexOf("covid", StringComparison.OrdinalIgnoreCase) >= 0)
                {
                    mensajeValidacion = mensajeValidacion + " - " + "La persona no puede registrar con el tipo de enfermedad Covid";
                    valido = false;
                }


                if (valido)
                {
                    db.ControlPersonas.Add(controlPersona);
                    await db.SaveChangesAsync();
                    return RedirectToAction("Index");
                }
            }
            ViewBag.Mensaje = mensajeValidacion;
            return View(controlPersona);
        }

        // GET: ControlPersonas/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ControlPersona controlPersona = await db.ControlPersonas.FindAsync(id);
            if (controlPersona == null)
            {
                return HttpNotFound();
            }
            return View(controlPersona);
        }

        // POST: ControlPersonas/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "IdRegistro,Nombre,FechaNacimiento,IdUbicacion,IdTipoEnfermedad")] ControlPersona controlPersona)
        {
            if (ModelState.IsValid)
            {
                db.Entry(controlPersona).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(controlPersona);
        }

        // GET: ControlPersonas/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ControlPersona controlPersona = await db.ControlPersonas.FindAsync(id);
            if (controlPersona == null)
            {
                return HttpNotFound();
            }
            return View(controlPersona);
        }

        // POST: ControlPersonas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            ControlPersona controlPersona = await db.ControlPersonas.FindAsync(id);
            db.ControlPersonas.Remove(controlPersona);
            await db.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        // GET: ControlPersonas/Delete/5
        public async Task<ActionResult> Imprimir(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ControlPersona controlPersona = await db.ControlPersonas.FindAsync(id);
            if (controlPersona == null)
            {
                return HttpNotFound();
            }

            //MemoryStream m = new MemoryStream();
            //Document document = new Document();
            //PdfWriter.GetInstance(document, m);
            //document.Open();
            //document.Add(new Paragraph("Hello World"));
            //document.Add(new Paragraph(DateTime.Now.ToString()));
            //m.Position = 0;

            //return File(m, "application/pdf");

            return View() ;
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
