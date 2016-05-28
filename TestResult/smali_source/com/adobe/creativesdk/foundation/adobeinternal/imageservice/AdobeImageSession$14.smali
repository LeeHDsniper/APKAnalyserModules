.class synthetic Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession$14;
.super Ljava/lang/Object;
.source "AdobeImageSession.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$imageservice$AdobeImageAdjustType:[I

.field static final synthetic $SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$imageservice$AdobeImageAutoCropSortType:[I

.field static final synthetic $SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$imageservice$AdobeImageCalibrateType:[I

.field static final synthetic $SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$imageservice$AdobeImageCropType:[I

.field static final synthetic $SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$imageservice$AdobeImageFillType:[I

.field static final synthetic $SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$imageservice$AdobeImageFitType:[I

.field static final synthetic $SwitchMap$com$adobe$creativesdk$foundation$internal$auth$AdobeAuthIMSEnvironment:[I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 1553
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;->values()[Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession$14;->$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$imageservice$AdobeImageFitType:[I

    :try_start_9
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession$14;->$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$imageservice$AdobeImageFitType:[I

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;->AdobeImageFit:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_14
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_14} :catch_1d8

    :goto_14
    :try_start_14
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession$14;->$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$imageservice$AdobeImageFitType:[I

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;->AdobeImageConstrain:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_14 .. :try_end_1f} :catch_1d5

    :goto_1f
    :try_start_1f
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession$14;->$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$imageservice$AdobeImageFitType:[I

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;->AdobeImageCrop:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1f .. :try_end_2a} :catch_1d2

    :goto_2a
    :try_start_2a
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession$14;->$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$imageservice$AdobeImageFitType:[I

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;->AdobeImageWrap:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_35
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2a .. :try_end_35} :catch_1cf

    :goto_35
    :try_start_35
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession$14;->$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$imageservice$AdobeImageFitType:[I

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;->AdobeImageStretch:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_40
    .catch Ljava/lang/NoSuchFieldError; {:try_start_35 .. :try_end_40} :catch_1cc

    :goto_40
    :try_start_40
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession$14;->$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$imageservice$AdobeImageFitType:[I

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;->AdobeImageHFit:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_4b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_40 .. :try_end_4b} :catch_1c9

    :goto_4b
    :try_start_4b
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession$14;->$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$imageservice$AdobeImageFitType:[I

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;->AdobeImageVFit:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_56
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4b .. :try_end_56} :catch_1c6

    .line 1538
    :goto_56
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;->values()[Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession$14;->$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$imageservice$AdobeImageFillType:[I

    :try_start_5f
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession$14;->$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$imageservice$AdobeImageFillType:[I

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;->AdobeImageRegularFill:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_6a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5f .. :try_end_6a} :catch_1c3

    :goto_6a
    :try_start_6a
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession$14;->$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$imageservice$AdobeImageFillType:[I

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;->AdobeImageGBFill:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_75
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6a .. :try_end_75} :catch_1c0

    :goto_75
    :try_start_75
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession$14;->$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$imageservice$AdobeImageFillType:[I

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;->AdobeImageGBLFill:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_80
    .catch Ljava/lang/NoSuchFieldError; {:try_start_75 .. :try_end_80} :catch_1bd

    :goto_80
    :try_start_80
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession$14;->$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$imageservice$AdobeImageFillType:[I

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;->AdobeImageLBCFill:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_8b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_80 .. :try_end_8b} :catch_1ba

    .line 1525
    :goto_8b
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCropType;->values()[Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCropType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession$14;->$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$imageservice$AdobeImageCropType:[I

    :try_start_94
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession$14;->$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$imageservice$AdobeImageCropType:[I

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCropType;->AdobeImageNoCrop:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCropType;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCropType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_9f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_94 .. :try_end_9f} :catch_1b7

    :goto_9f
    :try_start_9f
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession$14;->$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$imageservice$AdobeImageCropType:[I

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCropType;->AdobeImageCropToFit:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCropType;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCropType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_aa
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9f .. :try_end_aa} :catch_1b4

    :goto_aa
    :try_start_aa
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession$14;->$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$imageservice$AdobeImageCropType:[I

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCropType;->AdobeImageSmartFillCrop:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCropType;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCropType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_b5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_aa .. :try_end_b5} :catch_1b1

    .line 1512
    :goto_b5
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCalibrateType;->values()[Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCalibrateType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession$14;->$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$imageservice$AdobeImageCalibrateType:[I

    :try_start_be
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession$14;->$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$imageservice$AdobeImageCalibrateType:[I

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCalibrateType;->AdobeImageCalibrateAll:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCalibrateType;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCalibrateType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_c9
    .catch Ljava/lang/NoSuchFieldError; {:try_start_be .. :try_end_c9} :catch_1ae

    :goto_c9
    :try_start_c9
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession$14;->$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$imageservice$AdobeImageCalibrateType:[I

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCalibrateType;->AdobeImageCalibrateAllFixCop:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCalibrateType;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCalibrateType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_d4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c9 .. :try_end_d4} :catch_1ab

    :goto_d4
    :try_start_d4
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession$14;->$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$imageservice$AdobeImageCalibrateType:[I

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCalibrateType;->AdobeImageCalibrateAllFixK:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCalibrateType;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCalibrateType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_df
    .catch Ljava/lang/NoSuchFieldError; {:try_start_d4 .. :try_end_df} :catch_1a8

    .line 1495
    :goto_df
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;->values()[Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession$14;->$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$imageservice$AdobeImageAdjustType:[I

    :try_start_e8
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession$14;->$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$imageservice$AdobeImageAdjustType:[I

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;->AdobeImageFullAdjust:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_f3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_e8 .. :try_end_f3} :catch_1a5

    :goto_f3
    :try_start_f3
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession$14;->$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$imageservice$AdobeImageAdjustType:[I

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;->AdobeImageEyeLevelAdjust:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_fe
    .catch Ljava/lang/NoSuchFieldError; {:try_start_f3 .. :try_end_fe} :catch_1a2

    :goto_fe
    :try_start_fe
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession$14;->$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$imageservice$AdobeImageAdjustType:[I

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;->AdobeImageNoPerspectiveAdjust:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_109
    .catch Ljava/lang/NoSuchFieldError; {:try_start_fe .. :try_end_109} :catch_19f

    :goto_109
    :try_start_109
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession$14;->$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$imageservice$AdobeImageAdjustType:[I

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;->AdobeImageRectificationAdjust:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_114
    .catch Ljava/lang/NoSuchFieldError; {:try_start_109 .. :try_end_114} :catch_19c

    :goto_114
    :try_start_114
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession$14;->$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$imageservice$AdobeImageAdjustType:[I

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;->AdobeImageAdjustAll:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_11f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_114 .. :try_end_11f} :catch_19a

    .line 154
    :goto_11f
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;->values()[Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession$14;->$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$imageservice$AdobeImageAutoCropSortType:[I

    :try_start_128
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession$14;->$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$imageservice$AdobeImageAutoCropSortType:[I

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;->AdobeImageSortOnAll:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_133
    .catch Ljava/lang/NoSuchFieldError; {:try_start_128 .. :try_end_133} :catch_198

    :goto_133
    :try_start_133
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession$14;->$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$imageservice$AdobeImageAutoCropSortType:[I

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;->AdobeImageSortOnComposition:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_13e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_133 .. :try_end_13e} :catch_196

    :goto_13e
    :try_start_13e
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession$14;->$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$imageservice$AdobeImageAutoCropSortType:[I

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;->AdobeImageSortOnSaliency:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_149
    .catch Ljava/lang/NoSuchFieldError; {:try_start_13e .. :try_end_149} :catch_194

    :goto_149
    :try_start_149
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession$14;->$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$imageservice$AdobeImageAutoCropSortType:[I

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;->AdobeImageSortOnCutThrough:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAutoCropSortType;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_154
    .catch Ljava/lang/NoSuchFieldError; {:try_start_149 .. :try_end_154} :catch_192

    .line 78
    :goto_154
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;->values()[Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession$14;->$SwitchMap$com$adobe$creativesdk$foundation$internal$auth$AdobeAuthIMSEnvironment:[I

    :try_start_15d
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession$14;->$SwitchMap$com$adobe$creativesdk$foundation$internal$auth$AdobeAuthIMSEnvironment:[I

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;->AdobeAuthIMSEnvironmentProductionUS:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_168
    .catch Ljava/lang/NoSuchFieldError; {:try_start_15d .. :try_end_168} :catch_190

    :goto_168
    :try_start_168
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession$14;->$SwitchMap$com$adobe$creativesdk$foundation$internal$auth$AdobeAuthIMSEnvironment:[I

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;->AdobeAuthIMSEnvironmentStageUS:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_173
    .catch Ljava/lang/NoSuchFieldError; {:try_start_168 .. :try_end_173} :catch_18e

    :goto_173
    :try_start_173
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession$14;->$SwitchMap$com$adobe$creativesdk$foundation$internal$auth$AdobeAuthIMSEnvironment:[I

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;->AdobeAuthIMSEnvironmentCloudLabsUS:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_17e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_173 .. :try_end_17e} :catch_18c

    :goto_17e
    :try_start_17e
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession$14;->$SwitchMap$com$adobe$creativesdk$foundation$internal$auth$AdobeAuthIMSEnvironment:[I

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;->AdobeAuthIdentityManagementServiceUndefined:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_189
    .catch Ljava/lang/NoSuchFieldError; {:try_start_17e .. :try_end_189} :catch_18a

    :goto_189
    return-void

    :catch_18a
    move-exception v0

    goto :goto_189

    :catch_18c
    move-exception v0

    goto :goto_17e

    :catch_18e
    move-exception v0

    goto :goto_173

    :catch_190
    move-exception v0

    goto :goto_168

    .line 154
    :catch_192
    move-exception v0

    goto :goto_154

    :catch_194
    move-exception v0

    goto :goto_149

    :catch_196
    move-exception v0

    goto :goto_13e

    :catch_198
    move-exception v0

    goto :goto_133

    .line 1495
    :catch_19a
    move-exception v0

    goto :goto_11f

    :catch_19c
    move-exception v0

    goto/16 :goto_114

    :catch_19f
    move-exception v0

    goto/16 :goto_109

    :catch_1a2
    move-exception v0

    goto/16 :goto_fe

    :catch_1a5
    move-exception v0

    goto/16 :goto_f3

    .line 1512
    :catch_1a8
    move-exception v0

    goto/16 :goto_df

    :catch_1ab
    move-exception v0

    goto/16 :goto_d4

    :catch_1ae
    move-exception v0

    goto/16 :goto_c9

    .line 1525
    :catch_1b1
    move-exception v0

    goto/16 :goto_b5

    :catch_1b4
    move-exception v0

    goto/16 :goto_aa

    :catch_1b7
    move-exception v0

    goto/16 :goto_9f

    .line 1538
    :catch_1ba
    move-exception v0

    goto/16 :goto_8b

    :catch_1bd
    move-exception v0

    goto/16 :goto_80

    :catch_1c0
    move-exception v0

    goto/16 :goto_75

    :catch_1c3
    move-exception v0

    goto/16 :goto_6a

    .line 1553
    :catch_1c6
    move-exception v0

    goto/16 :goto_56

    :catch_1c9
    move-exception v0

    goto/16 :goto_4b

    :catch_1cc
    move-exception v0

    goto/16 :goto_40

    :catch_1cf
    move-exception v0

    goto/16 :goto_35

    :catch_1d2
    move-exception v0

    goto/16 :goto_2a

    :catch_1d5
    move-exception v0

    goto/16 :goto_1f

    :catch_1d8
    move-exception v0

    goto/16 :goto_14
.end method
