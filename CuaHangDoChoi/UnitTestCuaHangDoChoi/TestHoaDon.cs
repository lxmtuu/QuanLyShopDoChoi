﻿using System;
using System.Text;
using System.Collections.Generic;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using DTO;
using DAO;

namespace UnitTestCuaHangDoChoi
{
    /// <summary>
    /// Summary description for TestHoaDon
    /// </summary>
    [TestClass]
    public class TestHoaDon
    {
        public TestHoaDon()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        private TestContext testContextInstance;

        /// <summary>
        ///Gets or sets the test context which provides
        ///information about and functionality for the current test run.
        ///</summary>
        public TestContext TestContext
        {
            get
            {
                return testContextInstance;
            }
            set
            {
                testContextInstance = value;
            }
        }

        #region Additional test attributes
        //
        // You can use the following additional attributes as you write your tests:
        //
        // Use ClassInitialize to run code before running the first test in the class
        // [ClassInitialize()]
        // public static void MyClassInitialize(TestContext testContext) { }
        //
        // Use ClassCleanup to run code after all tests in a class have run
        // [ClassCleanup()]
        // public static void MyClassCleanup() { }
        //
        // Use TestInitialize to run code before running each test 
        // [TestInitialize()]
        // public void MyTestInitialize() { }
        //
        // Use TestCleanup to run code after each test has run
        // [TestCleanup()]
        // public void MyTestCleanup() { }
        //
        #endregion

        [TestMethod]
        public void TestLayDachSachHoaDon()
        {
            List<HoaDon> hd = HoaDonDAO.Instance.LayDanhSachHoaDon();
            int expected = 3;
            int actual = hd.Count;
            Assert.AreEqual(expected, actual);
        }

        [TestMethod]
        public void TestLayDachSachHoaDonTheoThangNamNhapDung()
        {
            double hd = HoaDonDAO.Instance.LayDanhSachHoaDonTheoThangNam(9,2018);
            double expected = 1500000;
            double actual = hd;
            Assert.AreEqual(expected, actual);
        }

        // Nếu ra sai là làm đúng
        [TestMethod]
        public void TestLayDachSachHoaDonTheoThangNamVoiNamSai()
        {
            double hd = HoaDonDAO.Instance.LayDanhSachHoaDonTheoThangNam(9, 2020);
            double expected = 200000;
            double actual = hd;
            Assert.AreEqual(expected, actual);
        }

        [TestMethod]
        public void TestThemHoaDon()
        {
            bool expected = true;
            bool actual = HoaDonDAO.Instance.ThemHD(100, 108, 11, DateTime.Parse("9/12/2018"),200000); 
            Assert.AreEqual(expected, actual);
        }

    }
}
