using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UniversityCourseandResultManagementSystem.Models;

namespace UniversityCourseandResultManagementSystem.DAL
{
    public class CourseStaticsGateway : CommonGateway
    {
        public List<CourseStatics> GetCourseStatics(string departmentCode)
        {
            List<CourseStatics> courseStaticsList = new List<CourseStatics>();
            GenarateConnection();
            using (Connection)
            {
                string query = "select * from CourseStatics where Department = @Department;";
                Command = new SqlCommand(query, Connection);
                Command.Parameters.Clear();
                Connection.Open();
                Command.Parameters.Add("@Department", SqlDbType.VarChar);
                Command.Parameters["@Department"].Value = departmentCode;


                Reader = Command.ExecuteReader();
                if (Reader.HasRows)
                {
                    while (Reader.Read())
                    {
                        CourseStatics courseStatics=new CourseStatics();
                        courseStatics.Code = Reader["Code"].ToString();
                        courseStatics.Name = Reader["Name"].ToString();
                        courseStatics.Semester = Reader["Semester"].ToString();
                        courseStatics.Teacher = Reader["Teacher"].ToString();
                        string visible = Reader["Visible"].ToString();

                        if (courseStatics.Teacher.Equals(""))
                        {
                            courseStatics.Teacher = "Not Assigned Yet";
                        }
                        else if (visible.Equals("0"))
                        {
                            courseStatics.Teacher = "Not Assigned Yet";
                        }
                        courseStaticsList.Add(courseStatics);
                    }
                }
                Connection.Close();
            }
            return courseStaticsList;
        }
        public List<Department> GetDepartmentDropdownList()
        {
            List<Department> departmentList = new List<Department>();
            GenarateConnection();
            using (Connection)
            {
                Connection.Open();

                string query = "select * from Department;";
                Command = new SqlCommand(query, Connection);
                Reader = Command.ExecuteReader();
                if (Reader.HasRows)
                {
                    while (Reader.Read())
                    {
                        Department department = new Department();
                        department.Code = Reader["Code"].ToString();
                        department.Name = Reader["Name"].ToString();
                        departmentList.Add(department);
                    }
                }
                Connection.Close();
            }
            return departmentList;
        }
    }
}