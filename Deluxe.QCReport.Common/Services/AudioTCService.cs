using Deluxe.QCReport.Common.Models;
using Deluxe.QCReport.Common.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Services
{
    public class AudioTCService
    {
        AudioTCRepository _repSql = new AudioTCRepository();

        public AudioTCVM GetAudioTCDetails(int QCNum, int SubQCNum)
        {

            return _repSql.GetAudioTCDetails(QCNum, SubQCNum);
        }

        public bool SaveAudioTCDetails(AudioTCVM audioTCDetails)
        {

            return _repSql.UpdateAudioTCDetails(audioTCDetails);
        }
    }
}
