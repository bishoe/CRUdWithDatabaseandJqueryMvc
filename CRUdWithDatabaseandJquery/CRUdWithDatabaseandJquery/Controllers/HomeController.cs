using CRUdWithDatabaseandJquery.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CRUdWithDatabaseandJquery.Controllers
{
    public class HomeController : Controller
    {
        AddNewItemDB AddNeDB = new AddNewItemDB();
        // GET: Home  
        public ActionResult Index()
        {
          
            return View();
        }
        public JsonResult List()
        {
            return Json(AddNeDB.ListAll(), JsonRequestBehavior.AllowGet);
        }
        public JsonResult Add(AddNewItem AddNe)
        {
            return Json(AddNeDB.Add(AddNe), JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetbyID(int ID)
        {
            var Employee = AddNeDB.ListAll().Find(x => x.ID.Equals(ID));
            return Json(Employee, JsonRequestBehavior.AllowGet);
        }
        public JsonResult Update(AddNewItem AddNe)
        {
            return Json(AddNeDB.Update(AddNe), JsonRequestBehavior.AllowGet);
        }
        public JsonResult Delete(int ID)
        {
            return Json(AddNeDB.Delete(ID), JsonRequestBehavior.AllowGet);
        }
    }

}