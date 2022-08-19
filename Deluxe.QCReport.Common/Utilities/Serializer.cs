using System;
using System.IO;
using System.Text;
using System.Xml.Serialization;
using System.Collections.Generic;

namespace Deluxe.QCReport.Common.Utilities
{
    /// <summary>
    /// Serializes and Deserializes object to and from Xml
    /// </summary>
    public sealed class Serializer
    {
        /// <summary>
        /// Serializes object to xml
        /// </summary>
        /// <param name="xmlObject"></param>
        /// <returns></returns>
        public static string Serialize(object xmlObject)
        {
            XmlSerializer xs = new XmlSerializer(xmlObject.GetType());
            StringBuilder sb = new StringBuilder();
            StringWriter sw = new StringWriter(sb);
            string xml = string.Empty;

            try
            {
                xs.Serialize(sw, xmlObject);
                xml = sw.ToString();
            }
            catch //(Exception ex)
            {
                
            }

            return xml;
        }

        public static string SerializeFromList<T>(List<T> xmlObject) where T : class
        {
            XmlSerializer xs = new XmlSerializer(xmlObject.GetType());
            StringBuilder sb = new StringBuilder();
            StringWriter sw = new StringWriter(sb);
            string xml = string.Empty;

            try
            {
                xs.Serialize(sw, xmlObject);
                xml = sw.ToString();
            }
            catch //(Exception ex)
            {
               
            }

            return xml;
        }

        public static string SerializeFromSingle<T>(T xmlObject) where T : class
        {
            XmlSerializer xs = new XmlSerializer(xmlObject.GetType());
            StringBuilder sb = new StringBuilder();
            StringWriter sw = new StringWriter(sb);
            string xml = string.Empty;

            try
            {
                xs.Serialize(sw, xmlObject);
                xml = sw.ToString();
            }
            catch //(Exception ex)
            {
                
            }

            return xml;
        }

        /// <summary>
        /// Deserialize xml to object
        /// </summary>
        /// <param name="objectType"></param>
        /// <param name="xml"></param>
        /// <returns></returns>
        public static object Deserialize(Type objectType, string xml)
        {
            object obj = null;

            try
            {
                XmlSerializer xs = new XmlSerializer(objectType);
                obj = xs.Deserialize(new StringReader(xml));
            }
            catch // (Exception ex)
            {
               
            }

            return obj;

        }

        public static List<T> DeserializeAsList<T>(string xml) where T : class
        {
            List<T> obj = null;

            try
            {
                XmlSerializer xs = new XmlSerializer(typeof(List<T>));
                obj = (List<T>)xs.Deserialize(new StringReader(xml));
            }
            catch //(Exception ex)
            {
                
            }

            return obj;

        }

        public static T DeserializeAsSingle<T>(string xml) where T : class
        {
            T obj = null;

            try
            {
                XmlSerializer xs = new XmlSerializer(typeof(T));
                obj = (T)xs.Deserialize(new StringReader(xml));
            }
            catch //(Exception ex)
            {
                
            }

            return obj;

        }

    }
}
