.class public final Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "zza"
.end annotation


# instance fields
.field public final applicationInfo:Landroid/content/pm/ApplicationInfo;

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
.method public constructor <init>(Landroid/os/Bundle;Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Ljava/lang/String;Landroid/content/pm/ApplicationInfo;Landroid/content/pm/PackageInfo;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Landroid/os/Bundle;Ljava/util/List;Ljava/util/List;Landroid/os/Bundle;ZLandroid/os/Messenger;IIFLjava/lang/String;ZIJLjava/lang/String;Ljava/util/List;Ljava/lang/String;Lcom/google/android/gms/ads/internal/formats/NativeAdOptionsParcel;Lcom/google/android/gms/ads/internal/request/CapabilityParcel;)V
    .registers 33
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
            "Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;",
            "Landroid/os/Bundle;",
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
            "ZIJ",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/ads/internal/formats/NativeAdOptionsParcel;",
            "Lcom/google/android/gms/ads/internal/request/CapabilityParcel;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDx:Landroid/os/Bundle;

    iput-object p2, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDy:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    iput-object p3, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzqf:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    iput-object p4, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzpZ:Ljava/lang/String;

    iput-object p5, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iput-object p6, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDz:Landroid/content/pm/PackageInfo;

    iput-object p7, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDB:Ljava/lang/String;

    iput-object p8, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDC:Ljava/lang/String;

    iput-object p9, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzqb:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    iput-object p10, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDD:Landroid/os/Bundle;

    move/from16 v0, p14

    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDG:Z

    move-object/from16 v0, p15

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDH:Landroid/os/Messenger;

    move/from16 v0, p16

    iput v0, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDI:I

    move/from16 v0, p17

    iput v0, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDJ:I

    move/from16 v0, p18

    iput v0, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDK:F

    if-eqz p11, :cond_65

    invoke-interface {p11}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_65

    const/4 v2, 0x3

    iput v2, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDE:I

    iput-object p11, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzqv:Ljava/util/List;

    move-object/from16 v0, p12

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDS:Ljava/util/List;

    :goto_3c
    move-object/from16 v0, p13

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDF:Landroid/os/Bundle;

    move-object/from16 v0, p19

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDL:Ljava/lang/String;

    move/from16 v0, p20

    iput-boolean v0, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDM:Z

    move/from16 v0, p21

    iput v0, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDN:I

    move-wide/from16 v0, p22

    iput-wide v0, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDP:J

    move-object/from16 v0, p24

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDQ:Ljava/lang/String;

    move-object/from16 v0, p25

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDR:Ljava/util/List;

    move-object/from16 v0, p26

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzpY:Ljava/lang/String;

    move-object/from16 v0, p27

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzqt:Lcom/google/android/gms/ads/internal/formats/NativeAdOptionsParcel;

    move-object/from16 v0, p28

    iput-object v0, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDU:Lcom/google/android/gms/ads/internal/request/CapabilityParcel;

    return-void

    :cond_65
    const/4 v2, 0x0

    iput v2, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDE:I

    const/4 v2, 0x0

    iput-object v2, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzqv:Ljava/util/List;

    const/4 v2, 0x0

    iput-object v2, p0, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel$zza;->zzDS:Ljava/util/List;

    goto :goto_3c
.end method
