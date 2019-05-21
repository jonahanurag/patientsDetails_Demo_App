using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Patients_details_CRUD.Models;

namespace Patients_details_CRUD.Controllers
{

    public class patientController : Controller
    {
        public static string connection_string = "Server=.;Database=testDB;Trusted_Connection=True;";
        [HttpGet]
        // GET: patient
        public ActionResult Index()
        {
            DataTable table = new DataTable();
            using (var con = new SqlConnection(connection_string))
            using (var cmd = new SqlCommand("sp_GetData", con))
            using (var da = new SqlDataAdapter(cmd))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                da.Fill(table);
            }
            return View(table);
        }

        // GET: patient/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: patient/Create
        public ActionResult Create()
        {
            PatientModel model = new PatientModel();
            model.transaction_time = DateTime.Today;
            model.DateOfBirth = DateTime.Today;
            return View(model);
        }

        // POST: patient/Create
        [HttpPost]
        public ActionResult Create(PatientModel patientmodel)
        {
            using (var con = new SqlConnection(connection_string))
            using (var command = new SqlCommand("sp_create", con)
            {
                CommandType = CommandType.StoredProcedure
            })
            {
                command.Parameters.Add(new SqlParameter("@firstname", patientmodel.Fornames));
                command.Parameters.Add(new SqlParameter("@surname", patientmodel.Surname));
                command.Parameters.Add(new SqlParameter("@dob", patientmodel.DateOfBirth));
                command.Parameters.Add(new SqlParameter("@gender", patientmodel.SexCode));
                command.Parameters.Add(new SqlParameter("@homephoneno", patientmodel.HomeTelephoneNumber));
                command.Parameters.Add(new SqlParameter("@transid", patientmodel.transaction_id));
                command.Parameters.Add(new SqlParameter("@transtime", patientmodel.transaction_time));
                command.Parameters.Add(new SqlParameter("@passno", patientmodel.PasNumber));
                command.Parameters.Add(new SqlParameter("@nokname", patientmodel.NokName));
                command.Parameters.Add(new SqlParameter("@relation", patientmodel.NokRelationshipCode));
                command.Parameters.Add(new SqlParameter("@address1", patientmodel.NokAddressLine1));
                command.Parameters.Add(new SqlParameter("@address2", patientmodel.NokAddressLine2));
                command.Parameters.Add(new SqlParameter("@address3", patientmodel.NokAddressLine3));
                command.Parameters.Add(new SqlParameter("@address4", patientmodel.NokAddressLine4));
                command.Parameters.Add(new SqlParameter("@postal", patientmodel.NokPostcode));
                command.Parameters.Add(new SqlParameter("@gpcode", patientmodel.GpCode));
                command.Parameters.Add(new SqlParameter("@gpsurname", patientmodel.GpSurname));
                command.Parameters.Add(new SqlParameter("@gpinitial", patientmodel.GpInitials));
                command.Parameters.Add(new SqlParameter("@gpmobile", patientmodel.GpPhone));
                con.Open();
                command.ExecuteNonQuery();
            }
            return RedirectToAction("Index");
        }

        // GET: patient/Edit/5
        public ActionResult Edit(int id)
        {
            PatientModel patientModel = new PatientModel();
            DataTable table = new DataTable();
            using (var con = new SqlConnection(connection_string))
            {
                con.Open();
                string query = "SELECT * FROM [testDB].[dbo].[t_patient] JOIN[testDB].[dbo].[t_NextOfKin] ON[t_patient].id =[t_NextOfKin].patient_id JOIN[testDB].[dbo].t_GpDetails ON[t_patient].id = t_GpDetails.patient_id WHERE t_patient.id = @patientid";
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                sda.SelectCommand.Parameters.AddWithValue("@patientid", id);
                sda.Fill(table);
            }
            if (table.Rows.Count == 1)
            {
                patientModel.PasNumber = table.Rows[0][1].ToString();
                patientModel.Fornames = table.Rows[0][2].ToString();
                patientModel.Surname = table.Rows[0][3].ToString();
                patientModel.DateOfBirth = Convert.ToDateTime(table.Rows[0][4]);
                patientModel.SexCode = table.Rows[0][5].ToString();
                patientModel.HomeTelephoneNumber = table.Rows[0][6].ToString();
                patientModel.transaction_id = table.Rows[0][7].ToString();
                patientModel.transaction_time = Convert.ToDateTime(table.Rows[0][8]);
                patientModel.NokName = table.Rows[0][11].ToString();
                patientModel.NokRelationshipCode = table.Rows[0][12].ToString();
                patientModel.NokAddressLine1 = table.Rows[0][13].ToString();
                patientModel.NokAddressLine2 = table.Rows[0][14].ToString();
                patientModel.NokAddressLine3 = table.Rows[0][15].ToString();
                patientModel.NokAddressLine4 = table.Rows[0][16].ToString();
                patientModel.NokPostcode = table.Rows[0][17].ToString();
                patientModel.GpCode = table.Rows[0][20].ToString();
                patientModel.GpSurname = table.Rows[0][21].ToString();
                patientModel.GpInitials = table.Rows[0][22].ToString();
                patientModel.GpPhone = table.Rows[0][23].ToString();
                return View(patientModel);
            }
            else
                return RedirectToAction("Index");
        }

        // POST: patient/Edit/5
        [HttpPost]
        public ActionResult Edit(PatientModel patientmodel)
        {
            using (var con = new SqlConnection(connection_string))
            using (var command = new SqlCommand("sp_update", con)
            {
                CommandType = CommandType.StoredProcedure
            })
            {
                command.Parameters.Add(new SqlParameter("@id", patientmodel.id));
                command.Parameters.Add(new SqlParameter("@firstname", patientmodel.Fornames));
                command.Parameters.Add(new SqlParameter("@surname", patientmodel.Surname));
                command.Parameters.Add(new SqlParameter("@dob", patientmodel.DateOfBirth));
                command.Parameters.Add(new SqlParameter("@gender", patientmodel.SexCode));
                command.Parameters.Add(new SqlParameter("@homephoneno", patientmodel.HomeTelephoneNumber));
                command.Parameters.Add(new SqlParameter("@transid", patientmodel.transaction_id));
                command.Parameters.Add(new SqlParameter("@transtime", patientmodel.transaction_time));
                command.Parameters.Add(new SqlParameter("@passno", patientmodel.PasNumber));
                command.Parameters.Add(new SqlParameter("@nokname", patientmodel.NokName));
                command.Parameters.Add(new SqlParameter("@relation", patientmodel.NokRelationshipCode));
                command.Parameters.Add(new SqlParameter("@address1", patientmodel.NokAddressLine1));
                command.Parameters.Add(new SqlParameter("@address2", patientmodel.NokAddressLine2));
                command.Parameters.Add(new SqlParameter("@address3", patientmodel.NokAddressLine3));
                command.Parameters.Add(new SqlParameter("@address4", patientmodel.NokAddressLine4));
                command.Parameters.Add(new SqlParameter("@postal", patientmodel.NokPostcode));
                command.Parameters.Add(new SqlParameter("@gpcode", patientmodel.GpCode));
                command.Parameters.Add(new SqlParameter("@gpsurname", patientmodel.GpSurname));
                command.Parameters.Add(new SqlParameter("@gpinitial", patientmodel.GpInitials));
                command.Parameters.Add(new SqlParameter("@gpmobile", patientmodel.GpPhone));
                con.Open();
                command.ExecuteNonQuery();
            }

            return RedirectToAction("Index");
        }

        // GET: patient/Delete/5
        public ActionResult Delete(int id)
        {
            PatientModel patientModel = new PatientModel();
            DataTable table = new DataTable();
            using (var con = new SqlConnection(connection_string))
            {
                con.Open();
                string query = "SELECT * FROM [testDB].[dbo].[t_patient] JOIN[testDB].[dbo].[t_NextOfKin] ON[t_patient].id =[t_NextOfKin].patient_id JOIN[testDB].[dbo].t_GpDetails ON[t_patient].id = t_GpDetails.patient_id WHERE t_patient.id = @patientid";
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                sda.SelectCommand.Parameters.AddWithValue("@patientid", id);
                sda.Fill(table);
            }
            if (table.Rows.Count == 1)
            {
                patientModel.PasNumber = table.Rows[0][1].ToString();
                patientModel.Fornames = table.Rows[0][2].ToString();
                patientModel.Surname = table.Rows[0][3].ToString();
                patientModel.DateOfBirth = Convert.ToDateTime(table.Rows[0][4]);
                patientModel.SexCode = table.Rows[0][5].ToString();
                patientModel.HomeTelephoneNumber = table.Rows[0][6].ToString();
                patientModel.transaction_id = table.Rows[0][7].ToString();
                patientModel.transaction_time = Convert.ToDateTime(table.Rows[0][8]);
                patientModel.NokName = table.Rows[0][11].ToString();
                patientModel.NokRelationshipCode = table.Rows[0][12].ToString();
                patientModel.NokAddressLine1 = table.Rows[0][13].ToString();
                patientModel.NokAddressLine2 = table.Rows[0][14].ToString();
                patientModel.NokAddressLine3 = table.Rows[0][15].ToString();
                patientModel.NokAddressLine4 = table.Rows[0][16].ToString();
                patientModel.NokPostcode = table.Rows[0][17].ToString();
                patientModel.GpCode = table.Rows[0][20].ToString();
                patientModel.GpSurname = table.Rows[0][21].ToString();
                patientModel.GpInitials = table.Rows[0][22].ToString();
                patientModel.GpPhone = table.Rows[0][23].ToString();
                return View(patientModel);
            }
            else
                return RedirectToAction("Index");

        }

        // POST: patient/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            using (var con = new SqlConnection(connection_string))
            using (var command = new SqlCommand("sp_delete", con)
            {
                CommandType = CommandType.StoredProcedure
            })
            {
                command.Parameters.Add(new SqlParameter("@id",id));                
                con.Open();
                command.ExecuteNonQuery();
            }

            return RedirectToAction("Index");
        }
    }
}
