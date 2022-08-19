using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Models
{
    public class ChecklistWarner : ChecklistBase
    {
        /*****************Video and Content*********************************/
        public bool? WasOVReportSupplied { get; set; }
        public bool? WereAllLocalisedTextDocumentsSupplied { get; set; }
        public bool? WasOVReportUsedToCreateTheLanguageVariantReportAndTimeCodesOrFaultsCopied { get; set; }
        public bool? DoOVTimecodesAndApprovedFaultsMatchTheCreatedLanguageVariant { get; set; }
        public bool? HasTheSlateBeenCheckedForTextContentOrTimingsOrAudioConfig { get; set; }
        public bool? HasTheAspectRatioBeenCheckedOnTheSlateAndProgramme { get; set; }
        public bool? IsCreatedLanguageVariantFileNormalVideoRange { get; set; }
         public bool? AreAllInsertsNormalVideoRange { get; set; }
       
        ///// <summary>
        ///// No longer required
        ///// </summary>
        //public bool? AreAllInsertsEditedCorrectly { get; set; }
        
        
        public bool? HaveAllLocalisedInsertsBeenCheckedForTextContentOrGraphicsOrSpellingOrGrammar { get; set; }
        public bool? FirstAndLastCutBeenCheckedOrloggedAsReference { get; set; }
        
        /// <summary>
        ///// No longer required
        ///// </summary>
        //public bool? IsTheDubCardPresentAtEndFeatureAndOnSeparateFileSupplied { get; set; }
       
        
        public bool? IsDubCardNormalVideoRange { get; set; }
        public bool? HasTheDubCardBbeenCheckedForTextContentOrGraphicsOrSpellingOrgrammar { get; set; }
        public bool? HasAllTextedContentBeenListedInLocalisedLanguageInReportAndChecked { get; set; }     
        public string IsTheNewWarnerBrosBlueShieldLogoPresentTopOrTail { get; set; }
       


        /***************** AUDIO *********************************/
        public bool? IsAudioOnFileOV { get; set; }

        ///// <summary>
        ///// No longer required
        ///// </summary>
        //public bool? IsTheAudioChannelLayout_5_1_And_2_0 { get; set; }

        public bool? Is_5_1_AudioConfig_L_R_C_LFE_Ls_Rs { get; set; }
        public bool? IsThereMAndEOnFile { get; set; }
       public bool? AudioOrVideoSyncCheckedOrLogged { get; set; }

        /// <summary>
        /// New
        /// </summary>
        public string DoesTheAudioChannelLayoutMatchOriginalVersionsWithNoMandE { get; set; }

        /// <summary>
        /// New
        /// </summary>
        public string DoesTheAudioLanguageMatchOriginalVersions { get; set; }

        /***************** METADATA *********************************/

        public bool? HasAllFileMetadatBeenChecked { get; set; }       
        public string FileFormat { get; set; }
        public string Codec { get; set; }
        public string StandardOrFrameRate { get; set; }
        public string Resolution { get; set; }
        public bool? Progressive { get; set; }
        public bool? CLAPPresent { get; set; }
        public string ColourPrimaries { get; set; }
        public string TransferCharacteristics { get; set; }
        public string MatrixCoefficients { get; set; }
        public string AudioBitDepthOrRate { get; set; }
        public string IsAudioDiscreate { get; set; }



    }
}
