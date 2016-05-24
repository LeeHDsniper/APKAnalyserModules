.class public final Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;
    }
.end annotation


# static fields
.field public static final CREATOR:Lcom/google/android/gms/ads/internal/request/zzf;


# instance fields
.field public final applicationInfo:Landroid/content/pm/ApplicationInfo;

.field public final versionCode:I

.field public final zzDA:Ljava/lang/String;

.field public final zzDB:Ljava/lang/String;

.field public final zzDC:Ljava/lang/String;

.field public final zzDD:Landroid/os/Bundle;

.field public final zzDE:I

.field public final zzDF:Landroid/os/Bundle;

.field public final zzDG:Z

.field public final zzDH:Landroid/os/Messenger;

.field public final zzDI:I

.field public final zzDJ:I

.field public final zzDK:F

.field public final zzDL:Ljava/lang/String;

.field public final zzDM:Z

.field public final zzDN:I

.field public final zzDO:Ljava/lang/String;

.field public final zzDP:J

.field public final zzDQ:Ljava/lang/String;

.field public final zzDR:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final zzDS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final zzDT:J

.field public final zzDU:Lcom/google/android/gms/ads/internal/request/CapabilityParcel;

.field public final zzDx:Landroid/os/Bundle;

.field public final zzDy:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

.field public final zzDz:Landroid/content/pm/PackageInfo;

.field public final zzpY:Ljava/lang/String;

.field public final zzpZ:Ljava/lang/String;

.field public final zzqb:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

.field public final zzqf:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

.field public final zzqt:Lcom/google/android/gms/ads/internal/formats/NativeAdOptionsParcel;

.field public final zzqv:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/google/android/gms/ads/internal/request/zzf;

    invoke-direct {v0}, Lcom/google/android/gms/ads/internal/request/zzf;-><init>()V

    sput-object v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->CREATOR:Lcom/google/android/gms/ads/internal/request/zzf;

    return-void
.end method

.method constructor <init>(ILandroid/os/Bundle;Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Ljava/lang/String;Landroid/content/pm/ApplicationInfo;Landroid/content/pm/PackageInfo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Landroid/os/Bundle;ILjava/util/List;Landroid/os/Bundle;ZLandroid/os/Messenger;IIFLjava/lang/String;ZILjava/lang/String;JLjava/lang/String;Ljava/util/List;Ljava/lang/String;Lcom/google/android/gms/ads/internal/formats/NativeAdOptionsParcel;Ljava/util/List;JLcom/google/android/gms/ads/internal/request/CapabilityParcel;)V
    .registers 38
    .param p1, "versionCode"    # I
    .param p2, "adPositionBundle"    # Landroid/os/Bundle;
    .param p3, "adRequest"    # Lcom/google/android/gms/ads/internal/client/AdRequestParcel;
    .param p4, "adSize"    # Lcom/google/android/gms/ads/internal/client/AdSizeParcel;
    .param p5, "adUnitId"    # Ljava/lang/String;
    .param p6, "applicationInfo"    # Landroid/content/pm/ApplicationInfo;
    .param p7, "packageInfo"    # Landroid/content/pm/PackageInfo;
    .param p8, "querySpamSignals"    # Ljava/lang/String;
    .param p9, "sequenceNumber"    # Ljava/lang/String;
    .param p10, "sessionId"    # Ljava/lang/String;
    .param p11, "versionInfo"    # Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;
    .param p12, "stats"    # Landroid/os/Bundle;
    .param p13, "nativeVersion"    # I
    .param p15, "contentInfo"    # Landroid/os/Bundle;
    .param p16, "useHTTPS"    # Z
    .param p17, "prefetchMessenger"    # Landroid/os/Messenger;
    .param p18, "screenWidth"    # I
    .param p19, "screenHeight"    # I
    .param p20, "screenDensity"    # F
    .param p21, "viewHierarchy"    # Ljava/lang/String;
    .param p22, "isAnalyticsInitialized"    # Z
    .param p23, "screenId"    # I
    .param p24, "analyticsClientId"    # Ljava/lang/String;
    .param p25, "correlationId"    # J
    .param p27, "requestId"    # Ljava/lang/String;
    .param p29, "slotId"    # Ljava/lang/String;
    .param p30, "nativeAdOptions"    # Lcom/google/android/gms/ads/internal/formats/NativeAdOptionsParcel;
    .param p32, "connectionStartTime"    # J
    .param p34, "capabilityParcel"    # Lcom/google/android/gms/ads/internal/request/CapabilityParcel;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/os/Bundle;",
            "Lcom/google/android/gms/ads/internal/client/AdRequestParcel;",
            "Lcom/google/android/gms/ads/internal/client/AdSizeParcel;",
            "Ljava/lang/String;",
            "Landroid/content/pm/ApplicationInfo;",
            "Landroid/content/pm/PackageInfo;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;",
            "Landroid/os/Bundle;",
            "I",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/os/Bundle;",
            "Z",
            "Landroid/os/Messenger;",
            "IIF",
            "Ljava/lang/String;",
            "ZI",
            "Ljava/lang/String;",
            "J",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/ads/internal/formats/NativeAdOptionsParcel;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;J",
            "Lcom/google/android/gms/ads/internal/request/CapabilityParcel;",
            ")V"
        }
    .end annotation

    .prologue
    .local p14, "nativeTemplates":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p28, "experimentIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p31, "nativeCustomTemplateIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->versionCode:I

    iput-object p2, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDx:Landroid/os/Bundle;

    iput-object p3, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDy:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    iput-object p4, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzqf:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    iput-object p5, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzpZ:Ljava/lang/String;

    iput-object p6, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iput-object p7, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDz:Landroid/content/pm/PackageInfo;

    iput-object p8, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDA:Ljava/lang/String;

    iput-object p9, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDB:Ljava/lang/String;

    iput-object p10, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDC:Ljava/lang/String;

    iput-object p11, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzqb:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    iput-object p12, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDD:Landroid/os/Bundle;

    move/from16 v0, p13

    iput v0, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDE:I

    move-object/from16 v0, p14

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzqv:Ljava/util/List;

    if-nez p31, :cond_74

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v2

    :goto_29
    iput-object v2, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDS:Ljava/util/List;

    move-object/from16 v0, p15

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDF:Landroid/os/Bundle;

    move/from16 v0, p16

    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDG:Z

    move-object/from16 v0, p17

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDH:Landroid/os/Messenger;

    move/from16 v0, p18

    iput v0, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDI:I

    move/from16 v0, p19

    iput v0, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDJ:I

    move/from16 v0, p20

    iput v0, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDK:F

    move-object/from16 v0, p21

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDL:Ljava/lang/String;

    move/from16 v0, p22

    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDM:Z

    move/from16 v0, p23

    iput v0, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDN:I

    move-object/from16 v0, p24

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDO:Ljava/lang/String;

    move-wide/from16 v0, p25

    iput-wide v0, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDP:J

    move-object/from16 v0, p27

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDQ:Ljava/lang/String;

    if-nez p28, :cond_79

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v2

    :goto_61
    iput-object v2, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDR:Ljava/util/List;

    move-object/from16 v0, p29

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzpY:Ljava/lang/String;

    move-object/from16 v0, p30

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzqt:Lcom/google/android/gms/ads/internal/formats/NativeAdOptionsParcel;

    move-wide/from16 v0, p32

    iput-wide v0, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDT:J

    move-object/from16 v0, p34

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzDU:Lcom/google/android/gms/ads/internal/request/CapabilityParcel;

    return-void

    :cond_74
    invoke-static/range {p31 .. p31}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    goto :goto_29

    :cond_79
    invoke-static/range {p28 .. p28}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    goto :goto_61
.end method

.method public constructor <init>(Landroid/os/Bundle;Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Ljava/lang/String;Landroid/content/pm/ApplicationInfo;Landroid/content/pm/PackageInfo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Landroid/os/Bundle;ILjava/util/List;Ljava/util/List;Landroid/os/Bundle;ZLandroid/os/Messenger;IIFLjava/lang/String;ZILjava/lang/String;JLjava/lang/String;Ljava/util/List;Ljava/lang/String;Lcom/google/android/gms/ads/internal/formats/NativeAdOptionsParcel;JLcom/google/android/gms/ads/internal/request/CapabilityParcel;)V
    .registers 69
    .param p1, "adPositionBundle"    # Landroid/os/Bundle;
    .param p2, "adRequest"    # Lcom/google/android/gms/ads/internal/client/AdRequestParcel;
    .param p3, "adSize"    # Lcom/google/android/gms/ads/internal/client/AdSizeParcel;
    .param p4, "adUnitId"    # Ljava/lang/String;
    .param p5, "applicationInfo"    # Landroid/content/pm/ApplicationInfo;
    .param p6, "packageInfo"    # Landroid/content/pm/PackageInfo;
    .param p7, "querySpamSignals"    # Ljava/lang/String;
    .param p8, "sequenceNumber"    # Ljava/lang/String;
    .param p9, "sessionId"    # Ljava/lang/String;
    .param p10, "versionInfo"    # Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;
    .param p11, "stats"    # Landroid/os/Bundle;
    .param p12, "nativeVersion"    # I
    .param p15, "contentInfo"    # Landroid/os/Bundle;
    .param p16, "useHTTPS"    # Z
    .param p17, "prefetchMessenger"    # Landroid/os/Messenger;
    .param p18, "screenWidth"    # I
    .param p19, "screenHeight"    # I
    .param p20, "screenDensity"    # F
    .param p21, "viewHierarchy"    # Ljava/lang/String;
    .param p22, "isAnalyticsInitialized"    # Z
    .param p23, "screenId"    # I
    .param p24, "analyticsClientId"    # Ljava/lang/String;
    .param p25, "correlationId"    # J
    .param p27, "requestId"    # Ljava/lang/String;
    .param p29, "slotId"    # Ljava/lang/String;
    .param p30, "nativeAdOptionsParcel"    # Lcom/google/android/gms/ads/internal/formats/NativeAdOptionsParcel;
    .param p31, "connectionStartTime"    # J
    .param p33, "capabilityParcel"    # Lcom/google/android/gms/ads/internal/request/CapabilityParcel;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Bundle;",
            "Lcom/google/android/gms/ads/internal/client/AdRequestParcel;",
            "Lcom/google/android/gms/ads/internal/client/AdSizeParcel;",
            "Ljava/lang/String;",
            "Landroid/content/pm/ApplicationInfo;",
            "Landroid/content/pm/PackageInfo;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;",
            "Landroid/os/Bundle;",
            "I",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/os/Bundle;",
            "Z",
            "Landroid/os/Messenger;",
            "IIF",
            "Ljava/lang/String;",
            "ZI",
            "Ljava/lang/String;",
            "J",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/ads/internal/formats/NativeAdOptionsParcel;",
            "J",
            "Lcom/google/android/gms/ads/internal/request/CapabilityParcel;",
            ")V"
        }
    .end annotation

    .prologue
    .local p13, "nativeTemplates":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p14, "nativeCustomTemplateIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p28, "experimentIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/16 v1, 0xb

    move-object/from16 v0, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move-object/from16 v10, p9

    move-object/from16 v11, p10

    move-object/from16 v12, p11

    move/from16 v13, p12

    move-object/from16 v14, p13

    move-object/from16 v15, p15

    move/from16 v16, p16

    move-object/from16 v17, p17

    move/from16 v18, p18

    move/from16 v19, p19

    move/from16 v20, p20

    move-object/from16 v21, p21

    move/from16 v22, p22

    move/from16 v23, p23

    move-object/from16 v24, p24

    move-wide/from16 v25, p25

    move-object/from16 v27, p27

    move-object/from16 v28, p28

    move-object/from16 v29, p29

    move-object/from16 v30, p30

    move-object/from16 v31, p14

    move-wide/from16 v32, p31

    move-object/from16 v34, p33

    invoke-direct/range {v0 .. v34}, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;-><init>(ILandroid/os/Bundle;Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Ljava/lang/String;Landroid/content/pm/ApplicationInfo;Landroid/content/pm/PackageInfo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Landroid/os/Bundle;ILjava/util/List;Landroid/os/Bundle;ZLandroid/os/Messenger;IIFLjava/lang/String;ZILjava/lang/String;JLjava/lang/String;Ljava/util/List;Ljava/lang/String;Lcom/google/android/gms/ads/internal/formats/NativeAdOptionsParcel;Ljava/util/List;JLcom/google/android/gms/ads/internal/request/CapabilityParcel;)V

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;Ljava/lang/String;Ljava/lang/String;J)V
    .registers 44
    .param p1, "partialAdRequestInfo"    # Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;
    .param p2, "querySpamSignals"    # Ljava/lang/String;
    .param p3, "analyticsClientId"    # Ljava/lang/String;
    .param p4, "connectionStartTime"    # J

    .prologue
    move-object/from16 v0, p1

    iget-object v4, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDx:Landroid/os/Bundle;

    move-object/from16 v0, p1

    iget-object v5, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDy:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    move-object/from16 v0, p1

    iget-object v6, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzqf:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    move-object/from16 v0, p1

    iget-object v7, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzpZ:Ljava/lang/String;

    move-object/from16 v0, p1

    iget-object v8, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    move-object/from16 v0, p1

    iget-object v9, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDz:Landroid/content/pm/PackageInfo;

    move-object/from16 v0, p1

    iget-object v11, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDB:Ljava/lang/String;

    move-object/from16 v0, p1

    iget-object v12, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDC:Ljava/lang/String;

    move-object/from16 v0, p1

    iget-object v13, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzqb:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    move-object/from16 v0, p1

    iget-object v14, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDD:Landroid/os/Bundle;

    move-object/from16 v0, p1

    iget v15, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDE:I

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzqv:Ljava/util/List;

    move-object/from16 v16, v0

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDS:Ljava/util/List;

    move-object/from16 v17, v0

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDF:Landroid/os/Bundle;

    move-object/from16 v18, v0

    move-object/from16 v0, p1

    iget-boolean v0, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDG:Z

    move/from16 v19, v0

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDH:Landroid/os/Messenger;

    move-object/from16 v20, v0

    move-object/from16 v0, p1

    iget v0, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDI:I

    move/from16 v21, v0

    move-object/from16 v0, p1

    iget v0, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDJ:I

    move/from16 v22, v0

    move-object/from16 v0, p1

    iget v0, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDK:F

    move/from16 v23, v0

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDL:Ljava/lang/String;

    move-object/from16 v24, v0

    move-object/from16 v0, p1

    iget-boolean v0, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDM:Z

    move/from16 v25, v0

    move-object/from16 v0, p1

    iget v0, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDN:I

    move/from16 v26, v0

    move-object/from16 v0, p1

    iget-wide v0, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDP:J

    move-wide/from16 v28, v0

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDQ:Ljava/lang/String;

    move-object/from16 v30, v0

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDR:Ljava/util/List;

    move-object/from16 v31, v0

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzpY:Ljava/lang/String;

    move-object/from16 v32, v0

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzqt:Lcom/google/android/gms/ads/internal/formats/NativeAdOptionsParcel;

    move-object/from16 v33, v0

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDU:Lcom/google/android/gms/ads/internal/request/CapabilityParcel;

    move-object/from16 v36, v0

    move-object/from16 v3, p0

    move-object/from16 v10, p2

    move-object/from16 v27, p3

    move-wide/from16 v34, p4

    invoke-direct/range {v3 .. v36}, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;-><init>(Landroid/os/Bundle;Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Ljava/lang/String;Landroid/content/pm/ApplicationInfo;Landroid/content/pm/PackageInfo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Landroid/os/Bundle;ILjava/util/List;Ljava/util/List;Landroid/os/Bundle;ZLandroid/os/Messenger;IIFLjava/lang/String;ZILjava/lang/String;JLjava/lang/String;Ljava/util/List;Ljava/lang/String;Lcom/google/android/gms/ads/internal/formats/NativeAdOptionsParcel;JLcom/google/android/gms/ads/internal/request/CapabilityParcel;)V

    return-void
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 3
    .param p1, "out"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    invoke-static {p0, p1, p2}, Lcom/google/android/gms/ads/internal/request/zzf;->zza(Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;Landroid/os/Parcel;I)V

    return-void
.end method
