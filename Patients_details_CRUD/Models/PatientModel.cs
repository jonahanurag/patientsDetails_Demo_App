using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Patients_details_CRUD.Models
{
    public class PatientModel
    {
        [HiddenInput(DisplayValue = false)]
        public string id { get; set; }
        [DisplayName(" First Name")]
        public string Fornames { get; set; }
        [DisplayName(" Sur Name")]
        public string Surname { get; set; }
        [DisplayName(" Date Of Birth")]
        [DataType(DataType.DateTime)]
        public DateTime DateOfBirth { get; set; }
        [DisplayName(" Gender")]
        public string SexCode { get; set; }
        [DisplayName("Phone #")]
        public string HomeTelephoneNumber { get; set; }
        [DisplayName(" Transaction Id")]
        public string transaction_id { get; set; }
        [DisplayName("  Transaction Time")]
        [DataType(DataType.DateTime)]
        public DateTime transaction_time { get; set; }
        [DisplayName(" Patient Pass Number")]
        public string PasNumber { get; set; }
        [DisplayName(" Relative Name")]
        public string NokName { get; set; }
        [DisplayName(" Relationship")]
        public string NokRelationshipCode { get; set; }
        [DisplayName(" Address 1")]
        public string NokAddressLine1 { get; set; }
        [DisplayName(" Address 2")]
        public string NokAddressLine2 { get; set; }
        [DisplayName(" Address 3")]
        public string NokAddressLine3 { get; set; }
        [DisplayName(" Address 4")]
        public string NokAddressLine4 { get; set; }
        [DisplayName(" Postal Code")]
        public string NokPostcode { get; set; }
        [DisplayName(" Gp Code")]
        public string GpCode { get; set; }
        [DisplayName(" Gp Sur Name")]
        public string GpSurname { get; set; }
        [DisplayName(" Gp Initial")]
        public string GpInitials { get; set; }
        [DisplayName(" Gp Mobile #")]
        public string GpPhone { get; set; }        
    }
}