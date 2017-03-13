using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Rotativa;
using UniversityCourseandResultManagementSystem.Controllers;
using UniversityCourseandResultManagementSystem.BLL;
using UniversityCourseandResultManagementSystem.Models;

namespace UniversityCourseandResultManagementSystem.Controllers
{
    public class ViewResultController : Controller
    {
        ViewResultManager viewResultManager=new ViewResultManager();
          public ActionResult ViewResult()
        {
            ViewBag.StudentList = viewResultManager.GetStudentDropdownList();
            return View();
        }
        [HttpPost]
        public ActionResult ViewResult(Student student)
        {
 
            ViewBag.ViewResults = viewResultManager.GetResultList(student.ID);
            ViewBag.StudentList = viewResultManager.GetStudentDropdownList();
            return View();
        }
              [HttpPost]

        public ActionResult ExportResult()
        {
            ViewBag.Names = "<View>";
            ViewBag.Regs = "<View>";
            ViewBag.Emails = "<View>";
            ViewBag.Departments = "<View>";
            ViewBag.StudentList = viewResultManager.GetStudentDropdownList();
            return View();
        }
    
        public ActionResult ExportResult(int id)
        {
            ViewBag.Regs = GetStudentRegString(id);
            ViewBag.Names = GetStudentNameString(id);
            ViewBag.Emails = GetStudentEmailString(id);
            ViewBag.Departments = GetStudentDepartmentString(id); 
            ViewBag.ViewResults = viewResultManager.GetResultList(id);
            ViewBag.StudentList = viewResultManager.GetStudentDropdownList();
            return View();
        }

      
        public JsonResult GetStudentName(int id)
        {
            Student student = viewResultManager.GetStudentInformation(id);
            string name = student.Name;
            return Json(name);

        }
        public JsonResult GetStudentEmail(int id)
        {
            Student student = viewResultManager.GetStudentInformation(id);
            string email = student.Email;
            return Json(email);

        }
        public JsonResult GetStudentDepartment(int id)
        {
            Student student = viewResultManager.GetStudentInformation(id);
            string department = student.Department;
            return Json(department);

        }
        public string GetStudentNameString(int id)
        {
            Student student = viewResultManager.GetStudentInformation(id);
            string name = student.Name;
            return name;

        }
        public string GetStudentEmailString(int id)
        {
            Student student = viewResultManager.GetStudentInformation(id);
            string email = student.Email;
            return email;

        }
        public string GetStudentDepartmentString(int id)
        {
            Student student = viewResultManager.GetStudentInformation(id);
            string department = student.Department;
            return department;

        }
        public string GetStudentRegString(int id)
        {
            Student student = viewResultManager.GetStudentInformation(id);
            string reg = student.Address;
            return reg;

        }
        public ActionResult GeneratePDF(int id)
        {
            return new ActionAsPdf("ExportResult/"+id)
            {
                FileName  = Server.MapPath("~/Content/StudentResult.pdf")
            };
        }
	}
}